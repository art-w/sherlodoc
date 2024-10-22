val term : (Db_store.db_format -> string -> unit) Cmdliner.Term.t

module Private : sig
  module Suffix_tree = Suffix_tree
end
