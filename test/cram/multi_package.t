  $ export ODOCLS=$(find ./docs/odoc/ -name '*.odocl' | sort)
  $ echo $ODOCLS | wc -w
  557
  $ export SHERLODOC_DB=db.bin
  $ export SHERLODOC_FORMAT=ancient
  $ sherlodoc index --index-docstring=false $ODOCLS > /dev/null
  $ sherlodoc search --print-cost --limit 100 "S_poly"
  195 val Base.Set.S_poly.mem : 'a t -> 'a -> bool
  202 val Base.Hashtbl.S_poly.data : (_, 'b) t -> 'b list
  206 val Base.Hashtbl.S_poly.keys : ('a, _) t -> 'a key list
  212 val Base.Set.S_poly.map : ('a, _) set -> f:('a -> 'b) -> 'b t
  212 val Base.Hashtbl.S_poly.find_exn : ('a, 'b) t -> 'a key -> 'b
  213 val Base.Hashtbl.S_poly.choose_exn : ('a, 'b) t -> 'a key * 'b
  215 sig Base.Map.S_poly
  215 sig Base.Set.S_poly
  215 val Base.Hashtbl.S_poly.find : ('a, 'b) t -> 'a key -> 'b option
  218 val Base.Hashtbl.S_poly.choose : ('a, 'b) t -> ('a key * 'b) option
  218 val Base.Hashtbl.S_poly.to_alist : ('a, 'b) t -> ('a key * 'b) list
  219 sig Base.Hashtbl.S_poly
  221 val Base.Hashtbl.S_poly.map : ('a, 'b) t -> f:('b -> 'c) -> ('a, 'c) t
  222 val Base.Hashtbl.S_poly.map_inplace : (_, 'b) t -> f:('b -> 'b) -> unit
  222 val Base.Hashtbl.S_poly.remove_multi : ('a, _ list) t -> 'a key -> unit
  224 val Base.Hashtbl.S_poly.set : ('a, 'b) t -> key:'a key -> data:'b -> unit
  224 val Base.Hashtbl.S_poly.find_multi : ('a, 'b list) t -> 'a key -> 'b list
  226 val Base.Hashtbl.S_poly.find_and_remove : ('a, 'b) t -> 'a key -> 'b option
  235 val Base.Hashtbl.S_poly.update : ('a, 'b) t -> 'a key -> f:('b option -> 'b) -> unit
  235 val Base.Hashtbl.S_poly.add_multi : ('a, 'b list) t -> key:'a key -> data:'b -> unit
  235 val Base.Hashtbl.S_poly.filter_map : ('a, 'b) t -> f:('b -> 'c option) -> ('a, 'c) t
  236 val Base.Hashtbl.S_poly.filter_map_inplace : (_, 'b) t -> f:('b -> 'b option) -> unit
  236 val Base.Hashtbl.S_poly.filter_keys_inplace : ('a, _) t -> f:('a key -> bool) -> unit
  237 val Base.Hashtbl.S_poly.equal : ('b -> 'b -> bool) -> ('a, 'b) t -> ('a, 'b) t -> bool
  238 val Base.Hashtbl.S_poly.iteri : ('a, 'b) t -> f:(key:'a key -> data:'b -> unit) -> unit
  239 val Base.Hashtbl.S_poly.find_or_add : ('a, 'b) t -> 'a key -> default:(unit -> 'b) -> 'b
  240 val Base.Hashtbl.S_poly.add : ('a, 'b) t -> key:'a key -> data:'b -> [ `Ok | `Duplicate ]
  241 val Base.Hashtbl.S_poly.mapi : ('a, 'b) t -> f:(key:'a key -> data:'b -> 'c) -> ('a, 'c) t
  242 val Base.Hashtbl.S_poly.change : ('a, 'b) t -> 'a key -> f:('b option -> 'b option) -> unit
  242 val Base.Hashtbl.S_poly.findi_or_add : ('a, 'b) t -> 'a key -> default:('a key -> 'b) -> 'b
  244 val Base.Hashtbl.S_poly.update_and_return : ('a, 'b) t -> 'a key -> f:('b option -> 'b) -> 'b
  245 val Base.Hashtbl.S_poly.partition_tf : ('a, 'b) t -> f:('b -> bool) -> ('a, 'b) t * ('a, 'b) t
  246 val Base.Hashtbl.S_poly.incr : ?by:int -> ?remove_if_zero:bool -> ('a, int) t -> 'a key -> unit
  254 val Base.Hashtbl.S_poly.choose_randomly_exn : ?random_state:Random.State.t -> ('a, 'b) t -> 'a key * 'b
  255 val Base.Hashtbl.S_poly.filter_mapi : ('a, 'b) t -> f:(key:'a key -> data:'b -> 'c option) -> ('a, 'c) t
  258 val Base.Hashtbl.S_poly.fold : ('a, 'b) t -> init:'acc -> f:(key:'a key -> data:'b -> 'acc -> 'acc) -> 'acc
  259 val Base.Hashtbl.S_poly.partition_map : ('a, 'b) t -> f:('b -> ('c, 'd) Either.t) -> ('a, 'c) t * ('a, 'd) t
  259 val Base.Hashtbl.S_poly.choose_randomly : ?random_state:Random.State.t -> ('a, 'b) t -> ('a key * 'b) option
  265 val Base.Hashtbl.S_poly.partitioni_tf : ('a, 'b) t -> f:(key:'a key -> data:'b -> bool) -> ('a, 'b) t * ('a, 'b) t
  272 type ('a, 'b) Base.Map.S_poly.t
  272 type 'elt Base.Set.S_poly.t
  274 type ('a, 'cmp) Base.Set.S_poly.set
  275 type ('a, 'b) Base.Map.S_poly.tree
  275 type 'elt Base.Set.S_poly.tree
  276 type ('a, 'b) Base.Hashtbl.S_poly.t
  279 val Base.Hashtbl.S_poly.find_and_call : ('a, 'b) t ->
    'a key ->
    if_found:('b -> 'c) ->
    if_not_found:('a key -> 'c) ->
    'c
  283 val Base.Set.S_poly.empty : 'a t
  283 type 'a Base.Hashtbl.S_poly.key = 'a
  283 val Base.Hashtbl.S_poly.partition_mapi : ('a, 'b) t ->
    f:(key:'a key -> data:'b -> ('c, 'd) Either.t) ->
    ('a, 'c) t * ('a, 'd) t
  288 val Base.Map.S_poly.empty : ('k, _) t
  289 type Base.Map.S_poly.comparator_witness
  289 type Base.Set.S_poly.comparator_witness
  290 val Base.Set.S_poly.length : _ t -> int
  293 val Base.Set.S_poly.is_empty : _ t -> bool
  293 val Base.Set.S_poly.singleton : 'a -> 'a t
  294 val Base.Set.S_poly.choose_exn : 'a t -> 'a
  295 val Base.Set.S_poly.add : 'a t -> 'a -> 'a t
  295 val Base.Map.S_poly.length : (_, _) t -> int
  295 val Base.Set.S_poly.max_elt_exn : 'a t -> 'a
  295 val Base.Set.S_poly.min_elt_exn : 'a t -> 'a
  296 val Base.Set.S_poly.of_list : 'a list -> 'a t
  296 val Base.Set.S_poly.of_tree : 'a tree -> 'a t
  296 val Base.Set.S_poly.to_list : 'a t -> 'a list
  296 val Base.Set.S_poly.to_tree : 'a t -> 'a tree
  296 val Base.Set.S_poly.invariants : 'a t -> bool
  297 val Base.Set.S_poly.choose : 'a t -> 'a option
  297 val Base.Set.S_poly.elements : 'a t -> 'a list
  297 val Base.Hashtbl.S_poly.merge_into : src:('k, 'a) t ->
    dst:('k, 'b) t ->
    f:(key:'k key -> 'a -> 'b option -> 'b Merge_into_action.t) ->
    unit
  298 val Base.Map.S_poly.data : (_, 'v) t -> 'v list
  298 val Base.Map.S_poly.keys : ('k, _) t -> 'k list
  298 val Base.Set.S_poly.diff : 'a t -> 'a t -> 'a t
  298 val Base.Set.S_poly.remove : 'a t -> 'a -> 'a t
  298 val Base.Set.S_poly.max_elt : 'a t -> 'a option
  298 val Base.Set.S_poly.min_elt : 'a t -> 'a option
  298 val Base.Map.S_poly.is_empty : (_, _) t -> bool
  298 val Base.Set.S_poly.of_array : 'a array -> 'a t
  298 val Base.Set.S_poly.to_array : 'a t -> 'a array
  299 val Base.Set.S_poly.equal : 'a t -> 'a t -> bool
  299 val Base.Set.S_poly.inter : 'a t -> 'a t -> 'a t
  299 val Base.Set.S_poly.union : 'a t -> 'a t -> 'a t
  299 val Base.Hashtbl.S_poly.clear : (_, _) t -> unit
  299 val Base.Hashtbl.S_poly.length : (_, _) t -> int
  299 val Base.Hashtbl.S_poly.hashable : 'a Hashable.t
  300 val Base.Map.S_poly.mem : ('k, _) t -> 'k -> bool
  301 val Base.Set.S_poly.nth : 'a t -> int -> 'a option
  301 val Base.Set.S_poly.union_list : 'a t list -> 'a t
  302 val Base.Map.S_poly.invariants : ('k, 'v) t -> bool
  302 val Base.Hashtbl.S_poly.is_empty : (_, _) t -> bool
  302 val Base.Hashtbl.S_poly.find_and_call1 : ('a, 'b) t ->
    'a key ->
    a:'d ->
    if_found:('b -> 'd -> 'c) ->
    if_not_found:('a key -> 'd -> 'c) ->
    'c
  304 val Base.Map.S_poly.find_exn : ('k, 'v) t -> 'k -> 'v
  305 val Base.Map.S_poly.singleton : 'k -> 'v -> ('k, 'v) t
  305 val Base.Set.S_poly.remove_index : 'a t -> int -> 'a t
  306 val Base.Hashtbl.S_poly.copy : ('a, 'b) t -> ('a, 'b) t
  306 val Base.Map.S_poly.max_elt_exn : ('k, 'v) t -> 'k * 'v
  306 val Base.Map.S_poly.min_elt_exn : ('k, 'v) t -> 'k * 'v
  306 val Base.Set.S_poly.of_sequence : 'a Sequence.t -> 'a t
  306 val Base.Set.S_poly.are_disjoint : 'a t -> 'a t -> bool
  307 val Base.Map.S_poly.find : ('k, 'v) t -> 'k -> 'v option
  307 val Base.Map.S_poly.rank : ('k, _) t -> 'k -> int option
  307 val Base.Set.S_poly.compare_direct : 'a t -> 'a t -> int
  $ sherlodoc search --print-cost --no-rhs "group b"
  227 val Str.group_beginning
  271 field Signature_group.in_place_patch.replace_by
  281 val Base.Set.group_by
  295 val Stdlib.Seq.group
  360 val Base.List.group
  367 val Base.Sequence.group
  375 val Base.Set.Poly.group_by
  390 val Base.List.Assoc.group
  390 val Base.List.sort_and_group
  403 val Base.Set.Using_comparator.group_by
  413 val Base.Set.Using_comparator.Tree.group_by
  420 val Base.List.Assoc.sort_and_group
  458 val Base.List.groupi
  477 val Base.Set.S_poly.group_by
  478 val Base.Hashtbl.group
  482 type UnixLabels.group_entry
  505 field UnixLabels.group_entry.gr_gid
  509 field UnixLabels.group_entry.gr_name
  511 field UnixLabels.group_entry.gr_passwd
  512 val Base.Set.Accessors_generic.group_by
  514 field UnixLabels.group_entry.gr_mem
  525 val Base.Set.Creators_and_accessors_generic.group_by
  565 val UnixLabels.getgroups
  565 val UnixLabels.setgroups
  570 val UnixLabels.initgroups
  $ sherlodoc search --no-rhs "group by"
  field Signature_group.in_place_patch.replace_by
  val Base.Set.group_by
  val Base.Set.Poly.group_by
  val Base.Set.Using_comparator.group_by
  val Base.Set.Using_comparator.Tree.group_by
  val Base.Set.S_poly.group_by
  val Base.Set.Accessors_generic.group_by
  val Base.Set.Creators_and_accessors_generic.group_by
  $ sherlodoc search --print-cost "map2"
  88 val Stdlib.Seq.map2 : ('a -> 'b -> 'c) -> 'a t -> 'b t -> 'c t
  98 val Stdlib.List.map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  101 val Stdlib.Float.Array.map2 : (float -> float -> float) -> t -> t -> t
  102 val Stdlib.Array.map2 : ('a -> 'b -> 'c) -> 'a array -> 'b array -> 'c array
  106 val Stdlib.ListLabels.map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  109 val Stdlib.Float.ArrayLabels.map2 : f:(float -> float -> float) -> t -> t -> t
  110 val Stdlib.ArrayLabels.map2 : f:('a -> 'b -> 'c) -> 'a array -> 'b array -> 'c array
  122 val Stdlib.List.rev_map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  130 val Stdlib.ListLabels.rev_map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  142 val Base.Uniform_array.map2_exn : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t
  150 val Base.Applicative.Make_using_map2.(<*>) : ('a -> 'b) X.t -> 'a X.t -> 'b X.t
  153 val Misc.Stdlib.List.map2_prefix : ('a -> 'b -> 'c) -> 'a t -> 'b t -> 'c t * 'b t
  157 val Base.List.rev_map2_exn : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t
  173 val Base.Applicative.Make_using_map2.Applicative_infix.(<*>) : ('a -> 'b) X.t -> 'a X.t -> 'b X.t
  176 val Base.Applicative.Make_using_map2_local.(<*>) : ('a -> 'b) X.t -> 'a X.t -> 'b X.t
  199 val Base.Applicative.Make_using_map2_local.Applicative_infix.(<*>) : ('a -> 'b) X.t -> 'a X.t -> 'b X.t
  211 val Base.Option.map2 : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t
  213 val Base.Or_error.map2 : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t
  226 val Base.Applicative.Pair.map2 : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t
  229 val Base.Applicative.Compose.map2 : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t
  229 val Base.Applicative.S2_to_S.map2 : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t
  229 val Base.Applicative.S3_to_S.map2 : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t
  229 val Base.Applicative.Make_using_map2.return : 'a -> 'a X.t
  230 val Base.List.map2 : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t Or_unequal_lengths.t
  232 val Base.List.Cartesian_product.map2 : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t

  $ sherlodoc search --print-cost --static-sort "List map2"
  78 val Stdlib.List.map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  82 val Stdlib.List.rev_map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  86 val Stdlib.ListLabels.map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  90 val Stdlib.ListLabels.rev_map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  97 val Base.List.rev_map2_exn : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t
  113 val Misc.Stdlib.List.map2_prefix : ('a -> 'b -> 'c) -> 'a t -> 'b t -> 'c t * 'b t
  193 val Base.List.map2_exn : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t
  210 val Base.List.map2 : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t Or_unequal_lengths.t
  212 val Base.List.Cartesian_product.map2 : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t
  214 val Base.List.rev_map2 : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t Or_unequal_lengths.t

  $ sherlodoc search --print-cost "List map2"
  118 val Stdlib.List.map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  142 val Stdlib.List.rev_map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  173 val Misc.Stdlib.List.map2_prefix : ('a -> 'b -> 'c) -> 'a t -> 'b t -> 'c t * 'b t
  177 val Base.List.rev_map2_exn : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t
  216 val Stdlib.ListLabels.map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  240 val Stdlib.ListLabels.rev_map2 : f:('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  250 val Base.List.map2 : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t Or_unequal_lengths.t
  252 val Base.List.Cartesian_product.map2 : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t
  253 val Base.List.map2_exn : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t
  274 val Base.List.rev_map2 : 'a t -> 'b t -> f:('a -> 'b -> 'c) -> 'c t Or_unequal_lengths.t

  $ sherlodoc search --no-rhs "Base.Hashtbl.S_without_submodules.group"
  val Base.Hashtbl.S_without_submodules.group
  $ sherlodoc search --print-cost "list"
  89 val Stdlib.Stream.of_list : 'a list -> 'a t
  92 val Stdlib.Array.of_list : 'a list -> 'a array
  92 val Stdlib.Array.to_list : 'a array -> 'a list
  94 val Stdlib.Option.to_list : 'a option -> 'a list
  94 val Stdlib.Set.Make.of_list : elt list -> t
  98 val Stdlib.ArrayLabels.of_list : 'a list -> 'a array
  98 val Stdlib.ArrayLabels.to_list : 'a array -> 'a list
  99 val Stdlib.Float.Array.of_list : float list -> t
  99 val Stdlib.Float.Array.to_list : t -> float list
  100 val Stdlib.Result.to_list : ('a, 'e) result -> 'a list
  101 val Reg.Set.of_list : elt list -> t
  102 val Path.Set.of_list : elt list -> t
  105 val Base.Bytes.to_list : t -> char list
  105 val Stdlib.Float.ArrayLabels.of_list : float list -> t
  105 val Stdlib.Float.ArrayLabels.to_list : t -> float list
  106 val Base.Queue.of_list : 'a list -> 'a t
  106 val Base.Stack.of_list : 'a list -> 'a t
  106 val Types.VarSet.of_list : elt list -> t
  107 val Btype.TypeSet.of_list : elt list -> t
  107 val Types.MethSet.of_list : elt list -> t
  109 val Base.Set.to_list : ('a, _) t -> 'a list
  110 val Stdlib.List.hd : 'a list -> 'a
  110 val Base.Bytes.of_char_list : char list -> t
  110 val Stdlib.MoreLabels.Set.Make.of_list : elt list -> t
  111 val Odoc_info.text_no_title_no_list : text -> text
  $ sherlodoc search --print-cost ": list"
  75 val Stdlib.List.tl : 'a list -> 'a list
  76 val Stdlib.List.rev : 'a list -> 'a list
  78 val Config.flexdll_dirs : string list
  80 val Stdlib.List.of_seq : 'a Seq.t -> 'a list
  81 val Stdlib.ListLabels.tl : 'a list -> 'a list
  82 val Stdlib.Array.to_list : 'a array -> 'a list
  82 val Stdlib.ListLabels.rev : 'a list -> 'a list
  84 val Stdlib.List.concat : 'a list list -> 'a list
  84 val Stdlib.Option.to_list : 'a option -> 'a list
  85 val Stdlib.List.flatten : 'a list list -> 'a list
  85 val Stdlib.Set.Make.elements : t -> elt list
  86 val Stdlib.ListLabels.of_seq : 'a Seq.t -> 'a list
  87 val Stdlib.(@) : 'a list -> 'a list -> 'a list
  88 val Stdlib.ArrayLabels.to_list : 'a array -> 'a list
  89 val Load_path.get : unit -> Dir.t list
  89 val Unix.sigpending : unit -> int list
  89 val Stdlib.Float.Array.to_list : t -> float list
  90 val Stdlib.ListLabels.concat : 'a list list -> 'a list
  91 val Stdlib.ListLabels.flatten : 'a list list -> 'a list
  92 val Reg.Set.elements : t -> elt list
  92 val Tag.Set.elements : t -> elt list
  92 field Odoc_info.info.i_sees : see list
  93 val Stdlib.List.cons : 'a -> 'a list -> 'a list
  93 val Path.Set.elements : t -> elt list
  94 val Ident.Set.elements : t -> elt list

Partial name search:
  $ sherlodoc search --print-cost "strin"
  151 val Stdlib.string_of_int : int -> string
  153 val Stdlib.string_of_bool : bool -> string
  154 val Stdlib.Digest.string : string -> t
  155 val Stdlib.string_of_float : float -> string
  168 val Num.string_of_num : num -> string
  169 val Caml.string_of_int : int -> string
  171 val Caml.string_of_bool : bool -> string
  171 val Stdlib.prerr_string : string -> unit
  171 val Stdlib.print_string : string -> unit
  171 val Stdlib.int_of_string : string -> int
  173 val Caml.string_of_float : float -> string
  173 val Stdlib.bool_of_string : string -> bool
  174 val Stdlib.Sys.max_string_length : int
  175 val Stdlib.Unit.to_string : t -> string
  175 val Stdlib.float_of_string : string -> float
  176 val Stdlib.Int.to_string : int -> string
  176 val Odoc_info.string_of_info : info -> string
  176 val Odoc_info.string_of_text : text -> string
  177 val Str.string_after : string -> int -> string
  178 val Str.string_before : string -> int -> string
  178 val Stdlib.Bool.to_string : bool -> string
  179 val Cmm_helpers.string_header : int -> nativeint
  180 val Config.safe_string : bool
  180 val Stdlib.Bytes.of_string : string -> bytes
  180 val Big_int.string_of_big_int : big_int -> string
  $ sherlodoc search --print-cost "base strin"
  246 val Base.Sexp.of_string : unit
  252 val Base.Exn.to_string : t -> string
  252 val Base.Sys.max_string_length : int
  254 val Base.Float.to_string : t -> string
  257 val Base.Exn.to_string_mach : t -> string
  257 val Base.Info.to_string_hum : t -> string
  257 val Base.Sign.to_string_hum : t -> string
  258 val Base.Error.to_string_hum : t -> string
  258 val Base.Info.to_string_mach : t -> string
  259 val Base.Error.to_string_mach : t -> string
  262 val Base.Or_error.error_string : string -> _ t
  264 val Base.Buffer.add_string : t -> string -> unit
  264 val Base.Sign_or_nan.to_string_hum : t -> string
  267 val Base.Sexp.to_string : Sexplib0.Sexp.t -> string
  268 val Base.Info.to_string_hum_deprecated : t -> string
  269 val Base.Error.to_string_hum_deprecated : t -> string
  269 val Base.Float.to_padded_compact_string : t -> string
  269 val Base.Source_code_position.to_string : t -> string
  272 val Base.Sexp.to_string_mach : Sexplib0.Sexp.t -> string
  274 val Base.String.rev : t -> t
  275 val Base.Int.to_string_hum : ?delimiter:char -> t -> string
  277 val Base.String.hash : t -> int
  277 val Base.Int32.to_string_hum : ?delimiter:char -> t -> string
  277 val Base.Int63.to_string_hum : ?delimiter:char -> t -> string
  277 val Base.Int64.to_string_hum : ?delimiter:char -> t -> string

  $ sherlodoc search --print-cost "tring"
  144 type Stdlib.String.t = string
  148 val Stdlib.String.empty : string
  151 val Stdlib.prerr_string : string -> unit
  151 val Stdlib.print_string : string -> unit
  151 val Stdlib.int_of_string : string -> int
  153 val Stdlib.bool_of_string : string -> bool
  154 val Stdlib.Digest.string : string -> t
  155 type Docstrings.docstring
  155 val Stdlib.String.create : int -> bytes
  155 val Stdlib.Unit.to_string : t -> string
  155 val Stdlib.float_of_string : string -> float
  156 val Stdlib.String.equal : t -> t -> bool
  156 val Stdlib.Int.to_string : int -> string
  156 val Stdlib.String.length : string -> int
  157 val Stdlib.String.copy : string -> string
  157 val Stdlib.String.trim : string -> string
  157 val Stdlib.String.compare : t -> t -> int
  158 val Stdlib.String.of_seq : char Seq.t -> t
  158 val Stdlib.String.to_seq : t -> char Seq.t
  158 val Stdlib.Bool.to_string : bool -> string
  160 val Config.safe_string : bool
  160 val Stdlib.String.escaped : string -> string
  160 val Stdlib.Bytes.of_string : string -> bytes
  160 val Stdlib.Bytes.to_string : bytes -> string
  160 val Stdlib.String.is_valid_utf_8 : t -> bool
  $ sherlodoc search --print-cost "base tring"
  224 val Base.String.rev : t -> t
  226 val Base.Sexp.of_string : unit
  227 val Base.String.hash : t -> int
  228 val Base.String.escaped : t -> t
  228 val Base.String.max_length : int
  229 val Base.String.(^) : t -> t -> t
  230 val Base.String.uppercase : t -> t
  231 val Base.String.capitalize : t -> t
  232 val Base.Exn.to_string : t -> string
  232 val Base.String.append : t -> t -> t
  234 val Base.String.equal : t -> t -> bool
  234 val Base.String.prefix : t -> int -> t
  234 val Base.String.suffix : t -> int -> t
  234 val Base.Float.to_string : t -> string
  235 val Base.String.compare : t -> t -> int
  237 val Base.String.ascending : t -> t -> int
  237 val Base.String.split_lines : t -> t list
  239 val Base.String.drop_prefix : t -> int -> t
  239 val Base.String.drop_suffix : t -> int -> t
  239 val Base.String.common_prefix : t list -> t
  239 val Base.String.common_suffix : t list -> t
  240 val Base.String.to_list_rev : t -> char list
  240 val Base.String.common_prefix2 : t -> t -> t
  240 val Base.String.common_suffix2 : t -> t -> t
  242 val Base.Or_error.error_string : string -> _ t

