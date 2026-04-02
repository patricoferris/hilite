(** The markdown hilite library depends on {! Cmarkit}. It provides a
    convenience function {! transform} that maps over markdown documents
    converting code blocks into HTML with highlighted syntax. *)

module Options : sig
  (** These options change the behaviour of the markdown parser. *)

  type t
  (** Options for markdown transformation. *)

  val default : t
  (** The default options. *)

  val set_ocaml_mdx_syntax : bool -> t -> t
  (** Turn on or off the OCaml MDX syntax support. Turn this on if you are writing
      code blocks for OCaml like:

      {markdown[
        ```ocaml
        # let f () = 1 + 1;;
        ```
      ]} 

      It will try to strip out the [#] character for better highlighting.
      *)
end

val transform :
  ?options:Options.t ->
  ?skip_unknown_languages:bool ->
  ?lookup_method:Hilite.tm_lookup_method ->
  ?tm:TmLanguage.t ->
  Cmarkit.Doc.t ->
  Cmarkit.Doc.t
(** [transform ?tm md] will extract code blocks from [md] and replace them with
    HTML code blocks with syntax highlighting spans.

    @param lookup_method
      How to lookup grammars using {! TmLanguage}, by default it will use
      [`Name].

    @param tm
      If no collection of textmate grammars is provided, then a default
      OCaml-centric on will be used. See {! Hilite.Syntax.langs} for details. *)
