type 'a res = ('a, [ `Msg of string ]) result

val src_code_to_html : lang:string -> src:string -> string res
(** [src_code_to_html ~lang ~src] will highlight the source code [src] in language [lang] and
    return a string *)
