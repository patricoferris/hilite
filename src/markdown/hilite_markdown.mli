val langs : string list
(** The list of supported languages for syntax-highlighting. *)

val transform : Cmarkit.Doc.t -> Cmarkit.Doc.t
(** [transform md] will extract code blocks from [md] and replace them with HTML
    code blocks with syntax highlighting spans. *)
