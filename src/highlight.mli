(** {1 Core}*)

type error = [ `Unknown_lang of string ]
(** Error type for catching code blocks with languages not supported
    by the provided collection of textmate grammars. *)

type tm_lookup_method = [ `Name | `Scope_name | `Filetype ]
(** Methods for looking up grammars, see {! TmLanguage} for the various
    functions. *)

val langs : string list
(** The list of supported languages for the default collection of
    textmate grammers used in {! src_code_to_html} if no [tm] argument
    is provided. The grammars for these languages can be found in {! Grammars}. *)

val src_code_to_html :
  ?lookup_method:tm_lookup_method ->
  ?tm:TmLanguage.t ->
  lang:string ->
  string ->
  (string, error) result
(** [src_code_to_html ~lang src] will highlight the source code [src] in language [lang] and
    return a string *)

(** {1 Predefined Grammars}

    The {! Grammars} module contains some predefined grammars for OCaml-specific
    languages including OCaml itself and [dune], [opam] and interface files.
*)

module Grammars : sig
  val ocaml : TmLanguage.yojson
  val ocaml_interface : TmLanguage.yojson
  val dune : TmLanguage.yojson
  val opam : TmLanguage.yojson
  val shell : TmLanguage.yojson
  val diff : TmLanguage.yojson
end
