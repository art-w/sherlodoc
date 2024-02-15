**Try it online at [doc.sherlocode.com](https://doc.sherlocode.com) !**

Sherlodoc is a search engine for OCaml documentation (inspired by [Hoogle](https://hoogle.haskell.org/)), which allows you to search through OCaml libraries by names and approximate type signatures:

- Search by name: [`list map`](https://doc.sherlocode.com/?q=list%20map)
- Search inside documentation comments: [`raise Not_found`](https://doc.sherlocode.com/?q=raise%20Not_found)
- Fuzzy type search is introduced with a colon, e.g. [`: map -> list`](https://doc.sherlocode.com/?q=%3A%20map%20-%3E%20list)
- Search by name and type with a colon separator [`Bogue : Button.t`](https://doc.sherlocode.com/?q=Bogue%20%3A%20Button.t)
- An underscore `_` can be used as a wildcard in type queries: [`(int -> _) -> list -> _`](https://doc.sherlocode.com/?q=(int%20-%3E%20_)%20-%3E%20list%20-%3E%20_)
- Type search supports products and reordering of function arguments: [`array -> ('a * int -> bool) -> array`](https://doc.sherlocode.com/?q=%3A%20array%20-%3E%20(%27a%20*%20int%20-%3E%20bool)%20-%3E%20array)

## Local usage

First, install sherlodoc and odig:

```bash
$ opam pin add 'https://github.com/art-w/sherlodoc.git'  # optional

$ opam install sherlodoc odig
```

[Odig](https://erratique.ch/software/odig) can generate the odoc documentation of your current switch with:

```bash
$ odig odoc   # followed by `odig doc` to browse your switch documentation
```

Which sherlodoc can then index to create a search database:

```bash
# name your sherlodoc database
$ export SHERLODOC_DB=/tmp/sherlodoc.marshal

# if you are using OCaml 4, we recommend the `ancient` database format:
$ opam install ancient
$ export SHERLODOC_DB=/tmp/sherlodoc.ancient

# index all odoc files generated by odig for your current switch:
$ sherlodoc index $(find $OPAM_SWITCH_PREFIX/var/cache/odig/odoc -name '*.odocl' | grep -v __)
```

Enjoy searching from the command-line or run the webserver:

```bash
$ sherlodoc search "map : list"
$ sherlodoc search # interactice cli

$ opam install dream
$ sherlodoc serve  # webserver at http://localhost:1234
```

The different commands support a `--help` argument for more details/options.

In particular, sherlodoc supports three different file formats for its database, which can be specified either in the filename extension or through the `--db-format=` flag:
- `ancient` for fast database loading using mmap, but is only compatible with OCaml 4.
- `marshal` for when ancient is unavailable, with slower database opening.
- `js` for integration with odoc static html documentation for client-side search without a server.

## Integration with Odoc

Odoc 2.4.0 adds a search bar inside the statically generated html documentation. [Integration with dune is in progress](https://github.com/ocaml/dune/pull/9772), you can try it inside a fresh opam switch with: (warning! this will recompile any installed package that depends on dune!)

```bash
$ opam pin https://github.com/emileTrotignon/dune.git#search-odoc-new

$ dune build @doc # in your favorite project
```

Otherwise, manual integration with odoc requires to add to every call of `odoc html-generate` the flags `--search-uri sherlodoc.js --search-uri db.js` to activate the search bar. You'll also need to generate a search database `db.js` and provide the `sherlodoc.js` dependency (a version of the sherlodoc search engine with odoc support, compiled to javascript):

```bash
$ sherlodoc index --db=_build/default/_doc/_html/YOUR_LIB/db.js \
    $(find _build/default/_doc/_odocls/YOUR_LIB -name '*.odocl' | grep -v __)

$ sherlodoc js > _build/default/_doc/_html/sherlodoc.js
```

## How it works

The sherlodoc database uses [Suffix Trees](https://en.wikipedia.org/wiki/Suffix_tree) to search for substrings in value names, documentation and types. During indexation, the suffix trees are compressed to state machine automatas. The children of every node are also sorted, such that a sub-tree can be used as a priority queue during search enumeration.

A quick example of a suffix-tree is as follows:
                            
                             root
                 ----------/ / \  \
               /            /   \  --------------$(6)              b  a  n  a  n  a  $
	banana(0)  ---a-----     -----na-                          -------------------
                  /         \         /  \                         0  1  2  3  4  5  6
           -----na---        $(5)    $(4) na$(2)
          /           \
       na$(1)          $(3)

As you can see, the full word "banana" is broken down into substrings. These substrings allow for quicker and more 
efficient searching by effectively compressing the information about all suffixes into a single data structure. 
This allows for fast lookup, efficient enumeration, and various optimizations.

To rank the search results, sherlodoc computes a static evaluation of each candidate during indexation. This static scoring biases the search to favor short names, short types, the presence of documentation, etc. When searching, a dynamic evaluation dependent on the user query is used to adjust the static ordering of the results:

- How similar is the result name to the search query? (to e.g. prefer results which respect the case: [`map`](https://doc.sherlocode.com/?q=map) vs [`Map`](https://doc.sherlocode.com/?q=Map))
- How similar are the types? (using a tree diff algorithm, as for example [`('a -> 'b -> 'a) -> 'a -> 'b list -> 'a`](https://doc.sherlocode.com/?q=(%27a%20-%3E%20%27b%20-%3E%20%27a)%20-%3E%20%27a%20-%3E%20%27b%20list%20-%3E%20%27a) and [`('a -> 'b -> 'b) -> 'a list -> 'b -> 'b`](https://doc.sherlocode.com/?q=(%27a%20-%3E%20%27b%20-%3E%20%27b)%20-%3E%20%27a%20list%20-%3E%20%27b%20-%3E%20%27b) are isomorphic yet point to `fold_left` and `fold_right` respectively)

For fuzzy type search, sherlodoc aims to provide good results without requiring a precise search query, on the basis that the user doesn't know the exact type of the things they are looking for (e.g. [`string -> file_descr`](https://doc.sherlocode.com/?q=string%20-%3E%20file_descr) is incomplete but should still point in the right direction). In particular when exploring a package documentation, the common question "how do I produce a value of type `foo`" can be answered with the query `: foo` (and "which functions consume a value of type `bar`" with `: bar -> _`). This should also work when the type can only be produced indirectly through a callback (for example [`: Eio.Switch.t`](https://doc.sherlocode.com/?q=%3A%20Eio.Switch.t) has no direct constructor). To achieve this, sherlodoc performs a type decomposition based on the polarity of each term: A value produced by a function is said to be positive, while an argument consumed by a function is negative. This simplifies away the tree shape of types, allowing their indexation in the suffix trees. The cardinality of each value type is also indexed, to e.g. differentiate between [`list -> list`](https://doc.sherlocode.com/?q=list%20-%3E%20list) and [`list -> list -> list`](https://doc.sherlocode.com/?q=list%20-%3E%20list%20-%3E%20list).

While the polarity search results are satisfying, sherlodoc offers very limited support for polymorphic variables, type aliases and true type isomorphisms. You should check out the extraordinary [Dowsing](https://github.com/Drup/dowsing) project for this!

And if you speak French, a more detailed [presentation of Sherlodoc](https://www.irill.org/videos/OUPS/2023-03/wendling.html) (and [Sherlocode](https://sherlocode.com)) was given at the [OCaml Users in PariS (OUPS)](https://oups.frama.io/) in March 2023.

## Reminders for contributing
-Always fork repo or create a new branch before making any changes
-Push and create pull request to the main branch (no dev branch YET)
-Write descriptive commit messages
-Explain what you did in a few words in your pull request comment
-Never merge or close a PR yourself - code reviews!

