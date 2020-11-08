type 'a res = ('a, [ `Msg of string ]) result

val src_code_to_tyxml_html :
  lang:string -> src:string -> [> Html_types.span ] Tyxml_html.elt list list res
(** [src_code_to_tyxml_html lang code] will highlight [code] in language [lang] producing a Tyxml element *)

val drop_last : 'a list -> 'a list

val src_code_to_html : lang:string -> src:string -> string res
(** [src_code_to_html lang code] will highlight [code] in language [lang] and return a string *)
