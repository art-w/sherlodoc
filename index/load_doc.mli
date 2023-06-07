module Make (Storage : Db.Storage.S) : sig
  module Db : Db.S with type writer = Storage.writer

  val clear : unit -> unit

  val run :
       index_docstring:bool
    -> index_name:bool
    -> type_search:bool
    -> empty_payload:bool
    -> index:Odoc_search.Entry.t list
    -> unit
end