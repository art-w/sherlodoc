val register_entry
  :  db:Db_writer.t
  -> index_name:bool
  -> type_search:bool
  -> index_docstring:bool
  -> favour_stdlib:bool
  -> pkg:Db.Entry.Package.t
  -> Odoc_search.Entry.t
  -> unit
(** [register_entry ~db ~index_name ~type_search ~index_docstring e] register
    the entry [e] in [db]. *)
