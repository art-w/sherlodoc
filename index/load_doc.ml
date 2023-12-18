module Entry = Db.Entry
module Db_common = Db
module ModuleName = Odoc_model.Names.ModuleName

let generic_cost ~ignore_no_doc name has_doc =
  (* name length is important not because short identifier are better in the
     abstract, but because the shortest result will be close to the query, as
     the suffix tree does not return results shorter than the query*)
  (String.length name * 6)
  (* + (5 * List.length path) TODO : restore depth based ordering *)
  + (if ignore_no_doc || has_doc then 0 else 30)
  + if String.starts_with ~prefix:"Stdlib." name then -100 else 0

let kind_cost (kind : Entry.Kind.t) =
  match kind with
  | Constructor typ | Field typ | Val typ -> Db.Typexpr.size typ
  | Doc -> 400
  | TypeDecl _ | Module -> 0
  | Exception _ | Class_type | Method | Class -> 10
  | TypeExtension -> 1000
  | ExtensionConstructor _ | ModuleType -> 10

let cost ~name ~kind ~doc_html =
  let ignore_no_doc =
    match kind with
    | Entry.Kind.Module | ModuleType -> true
    | _ -> false
  in
  let has_doc = doc_html <> "" in
  generic_cost ~ignore_no_doc name has_doc + kind_cost kind

(*

  todo : check usefulness
  let rec type_size = function
    | Odoc_model.Lang.TypeExpr.Var _ -> 1
    | Any -> 1
    | Arrow (lbl, a, b) ->
        (match lbl with
        | None -> 0
        | Some _ -> 1)
        + type_size a + type_size b
    | Constr (_, args) -> List.fold_left (fun acc t -> acc + type_size t) 1 args
    | Tuple args -> List.fold_left (fun acc t -> acc + type_size t) 1 args
    | _ -> 100
*)

let string_of_html = Format.asprintf "%a" (Tyxml.Html.pp_elt ())

let rec typ_of_odoc_typ otyp =
  let open Db.Typexpr in
  match otyp with
  | Odoc_model.Lang.TypeExpr.Var str -> poly str
  | Any -> any
  | Arrow (_lbl, left, right) ->
      arrow (typ_of_odoc_typ left) (typ_of_odoc_typ right)
  | Constr (name, args) ->
      constr (Typename.to_string name) (List.map typ_of_odoc_typ args)
  | Tuple li -> tuple (List.map typ_of_odoc_typ li)
  | _ -> unhandled

let with_tokenizer str fn =
  let str = String.lowercase_ascii str in
  let buf = Buffer.create 16 in
  let flush () =
    let word = Buffer.contents buf in
    if word <> "" then fn word ;
    Buffer.clear buf
  in
  let rec go i =
    if i >= String.length str
    then flush ()
    else
      let chr = str.[i] in
      if (chr >= 'a' && chr <= 'z')
         || (chr >= '0' && chr <= '9')
         || chr = '_' || chr = '@'
      then Buffer.add_char buf chr
      else flush () ;
      go (i + 1)
  in
  go 0

let register_doc ~db elt doc_txt =
  with_tokenizer doc_txt @@ fun word -> Db.store_word db word elt

let register_full_name ~db name elt =
  let name = String.lowercase_ascii name in
  Db.store_word db name elt

let searchable_type_of_constructor args res =
  let open Odoc_model.Lang in
  match args with
  | TypeDecl.Constructor.Tuple args -> (
      match args with
      | _ :: _ :: _ -> TypeExpr.(Arrow (None, Tuple args, res))
      | [ arg ] -> TypeExpr.(Arrow (None, arg, res))
      | _ -> res)
  | TypeDecl.Constructor.Record fields ->
      List.fold_left
        (fun res field ->
          let open TypeDecl.Field in
          let field_name = Odoc_model.Paths.Identifier.name field.id in
          TypeExpr.Arrow (Some (Label field_name), field.type_, res))
        res fields

let searchable_type_of_record parent_type type_ =
  let open Odoc_model.Lang in
  TypeExpr.Arrow (None, parent_type, type_)

let convert_kind (Odoc_search.Entry.{ kind; _ } as entry) =
  let open Odoc_search.Entry in
  match kind with
  | TypeDecl _ ->
      Entry.Kind.TypeDecl (Odoc_search.Html.typedecl_params_of_entry entry)
  | Module -> Entry.Kind.Module
  | Value { value = _; type_ } ->
      let typ = typ_of_odoc_typ type_ in
      Entry.Kind.val_ typ
  | Constructor { args; res } ->
      let searchable_type = searchable_type_of_constructor args res in
      let typ = typ_of_odoc_typ searchable_type in
      Entry.Kind.constructor typ
  | Field { mutable_ = _; parent_type; type_ } ->
      let typ =
        type_ |> searchable_type_of_record parent_type |> typ_of_odoc_typ
      in
      Entry.Kind.field typ
  | Doc _ -> Doc
  | Exception { args; res } ->
      let searchable_type = searchable_type_of_constructor args res in
      let typ = typ_of_odoc_typ searchable_type in
      Entry.Kind.exception_ typ
  | Class_type _ -> Class_type
  | Method _ -> Method
  | Class _ -> Class
  | TypeExtension _ -> TypeExtension
  | ExtensionConstructor { args; res } ->
      let searchable_type = searchable_type_of_constructor args res in
      let typ = typ_of_odoc_typ searchable_type in
      Entry.Kind.extension_constructor typ
  | ModuleType -> ModuleType

let register_type_expr ~db elt type_ =
  let type_polarities =
    type_ |> typ_of_odoc_typ
    |> Db.Type_polarity.of_typ ~ignore_any:false ~all_names:true
  in
  Db.store_type_polarities db elt type_polarities

let register_kind ~db ~type_search elt (kind : Odoc_search.Entry.kind) =
  let open Odoc_search.Entry in
  let open Odoc_model.Lang in
  if type_search
  then
    match kind with
    | TypeDecl _ -> ()
    | Module -> ()
    | Value { value = _; type_ } -> register_type_expr ~db elt type_
    | Doc _ -> ()
    | Class_type _ -> ()
    | Method _ -> ()
    | Class _ -> ()
    | TypeExtension _ -> ()
    | ModuleType -> ()
    | ExtensionConstructor { args; res }
    | Constructor { args; res }
    | Exception { args; res } ->
        let type_ = searchable_type_of_constructor args res in
        register_type_expr ~db elt type_
    | Field { mutable_ = _; parent_type; type_ } ->
        let type_ = TypeExpr.Arrow (None, parent_type, type_) in
        register_type_expr ~db elt type_

let rec is_from_module_type (id : Odoc_model.Paths.Identifier.Any.t) =
  let open Odoc_model.Paths in
  match id.iv with
  | `CoreType _ | `CoreException _ | `Root _ | `Page _ | `LeafPage _ -> false
  | `ModuleType _ -> true
  | #Identifier.NonSrc.t_pv as x ->
      let parent = Identifier.label_parent { id with iv = x } in
      is_from_module_type (parent :> Identifier.Any.t)
  | _ -> false

let is_from_module_type Odoc_search.Entry.{ id; _ } =
  match id.iv with
  | `ModuleType (parent, _) ->
      (* A module type itself is not *from* a module type, but it might be if one
         of its parents is a module type. *)
      is_from_module_type (parent :> Odoc_model.Paths.Identifier.Any.t)
  | _ -> is_from_module_type id

let prefixname n =
  match
    (n :> Odoc_model.Paths.Identifier.t)
    |> Odoc_model.Paths.Identifier.fullname |> List.rev
  with
  | [] -> ""
  | _ :: q -> q |> List.rev |> String.concat "."

let register_entry ~db ~index_name ~type_search ~index_docstring
    (Odoc_search.Entry.{ id; doc; kind } as entry) =
  let module Sherlodoc_entry = Entry in
  let open Odoc_search in
  let open Odoc_search.Entry in
  let is_type_extension =
    match kind with
    | TypeExtension _ -> true
    | _ -> false
  in
  if Odoc_model.Paths.Identifier.is_internal id || is_type_extension
  then ()
  else
    let full_name =
      id |> Odoc_model.Paths.Identifier.fullname |> String.concat "."
    in
    let doc_txt = Text.of_doc doc in
    let doc_html =
      match doc_txt with
      | "" -> ""
      | _ -> doc |> Html.of_doc |> string_of_html
    in
    let kind' = convert_kind entry in
    let name =
      match kind with
      | Doc _ -> prefixname id
      | _ -> full_name
    in
    let cost = cost ~name ~kind:kind' ~doc_html in
    let rhs = Html.rhs_of_kind kind in
    let url = Html.url id in
    let url = Result.get_ok url in
    let is_from_module_type = is_from_module_type entry in
    let elt =
      Sherlodoc_entry.v ~name ~kind:kind' ~rhs ~doc_html ~cost ~url
        ~is_from_module_type ()
    in
    if index_docstring then register_doc ~db elt doc_txt ;
    (if index_name
     then
       match kind with
       | Doc _ -> ()
       | _ -> register_full_name ~db full_name elt) ;
    register_kind ~db ~type_search elt kind
