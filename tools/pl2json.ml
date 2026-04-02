let usage = "pl2json <lang.tmLanguage>"

let to_json_token : Plist_xml.token -> Jsonm.lexeme = function
  | `Array_start -> `As
  | `Array_end -> `Ae
  | `Data s -> `String s
  | `Date _ -> failwith "remove date from plist"
  | `Dict_start -> `Os
  | `Dict_end -> `Oe
  | `False -> `Bool false
  | `Int i -> `Float (Int.to_float i)
  | `Key s -> `Name s
  | `Real f -> `Float f
  | `String s -> `String s
  | `True -> `Bool true

let ok = function `Ok -> () | `Partial -> failwith "partial jsonm encode..."

let main () =
  let lang = In_channel.with_open_bin Sys.argv.(1) Plist_xml.from_channel in
  let encoder = Jsonm.encoder (`Channel stdout) in
  let sink token = Jsonm.encode encoder (`Lexeme (to_json_token token)) |> ok in
  Plist_xml.tokens sink lang;
  Jsonm.encode encoder `End |> ok

let () =
  match main () with
  | () -> ()
  | exception e -> Format.eprintf "%s: %s\n%!" usage (Printexc.to_string e)
