(** The markdown hilite library depends on {! Cmarkit}. It provides a
    convenience function {! transform} that maps over markdown documents
    converting code blocks into HTML with highlighted syntax. *)

val transform :
  ?skip_unknown_languages:bool ->
  ?lookup_method:Hilite.tm_lookup_method ->
  ?tm:TmLanguage.t ->
  Cmarkit.Doc.t ->
  Cmarkit.Doc.t
(** [transform ?tm md] will extract code blocks from [md] and replace them with HTML
    code blocks with syntax highlighting spans.

    @param lookup_method How to lookup grammars using {! TmLanguage}, by default
    it will use [`Name].

    @param tm If no collection of textmate grammars is provided, then a default
    OCaml-centric on will be used. See {! Hilite.Syntax.langs} for details. *)
