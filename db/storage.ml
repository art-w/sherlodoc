let base_addr = 0x100000000000n

type writer =
  { mutable write_shard : int
  ; ancient : Ancient.md
  }

let open_out filename =
  let handle = Unix.openfile filename Unix.[ O_RDWR; O_TRUNC; O_CREAT ] 0o640 in
  let ancient = Ancient.attach handle base_addr in
  { write_shard = 0; ancient }

type t =
  { db : Types.db
  ; db_names : Types.Elt_set.t Types.Tchar.t
  }

let save ~db (t : t) =
  ignore (Ancient.share db.ancient db.write_shard t) ;
  db.write_shard <- db.write_shard + 1

let close_out db = Ancient.detach db.ancient

type reader = { shards : t array }

let load_shard md shard =
  match Ancient.get md shard with
  | t -> Some (Ancient.follow t)
  | exception _ -> None

let load_shards md =
  let rec go i =
    match load_shard md i with
    | None -> []
    | Some t -> t :: go (i + 1)
  in
  Array.of_list (go 0)

let db_open_in db : reader =
  let filename = db in
  let handle = Unix.openfile filename Unix.[ O_RDWR ] 0o640 in
  let md = Ancient.attach handle base_addr in
  { shards = load_shards md }
