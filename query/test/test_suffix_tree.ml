open Index.Private
open Query.Private

let knuth_morris_pratt str ~sub =
  let sublen = String.length sub in
  if sublen = 0
  then true
  else (
    let len = String.length str in
    List.init len (fun i ->
      if i + sublen > len then false else String.sub str i sublen = sub)
    |> List.exists Fun.id)

let pkg = Db.Entry.Package.v ~name:"" ~version:""

let elt cost =
  Db.Entry.v ~cost ~name:"" ~kind:Db.Entry.Kind.Doc ~rhs:None ~doc_html:"" ~url:"" ~pkg ()

let entry_of_int int =
  Db.Entry.v
    ~name:""
    ~kind:Db.Entry.Kind.Module
    ~rhs:None
    ~doc_html:""
    ~url:""
    ~pkg:(Db.Entry.Package.v ~name:"" ~version:"")
    ~cost:int
    ()

let int_of_entry entry = Db.Entry.(entry.cost)

(** This module does the same thing as Succ, but its correctness is obvious
    and its performance terrible. *)
module Reference = struct
  type t' = (string * int) list
  type t = t' ref

  let make () = ref []
  let add t id entry = t := (id, entry) :: !t
  let export t = !t

  let find li request =
    li
    |> List.filter_map (fun (id, v) ->
      if knuth_morris_pratt ~sub:request id then Some v else None)
    |> List.sort_uniq Int.compare
end

module Real = struct
  type t = Suffix_tree.t
  type t' = Db.String_automata.t

  let make () = Suffix_tree.(make (Buf.make ()))

  let add t id v =
    let entry = entry_of_int v in
    Suffix_tree.add_suffixes t id entry

  let export = Suffix_tree.export ~summarize:false

  let find s req =
    match Db.String_automata.find s req with
    | None -> []
    | Some automata ->
      automata
      |> Succ.of_automata
      |> Succ.to_seq
      |> List.of_seq
      |> List.map int_of_entry
      |> List.sort_uniq Int.compare
end

module Both = struct
  let make () = Reference.make (), Real.make ()

  let add (ref, real) id v =
    Reference.add ref id v ;
    Real.add real id v

  let export (ref, real) = Reference.export ref, Real.export real
  let find (ref, real) req = Reference.find ref req, Real.find real req
end

let random_string ?size () =
  let size =
    match size with
    | None -> Random.int 64
    | Some size -> size
  in
  String.init size (fun _ ->
    let int = Random.int (122 - 97) + 97 in
    Char.chr int)

let random_suffix_tree size =
  let suffixes = Both.make () in
  for i = 1 to size do
    let id = random_string () in
    let v = Random.int size in
    Printf.printf "%S -> %i\n" id v ;
    Both.add suffixes id v
  done ;
  suffixes

let test_find tree req =
  let tree = Both.export tree in
  let ref, real = Both.find tree req in
  Alcotest.(check (list int)) "same int list" ref real

let test_random_requests tree =
  let tree = Both.export tree in
  for i = 0 to 64 do
    let req = random_string ~size:i () in
    Printf.printf "req : %S\n" req ;
    let ref, real = Both.find tree req in
    Alcotest.(check (list int)) "same int list" ref real
  done

let test_random_size size () =
  let tree = random_suffix_tree size in
  test_random_requests tree

let tests =
  List.init 100 (fun i ->
    Alcotest.test_case
      (Printf.sprintf "Suffix_tree size %i" i)
      `Quick
      (test_random_size i))
