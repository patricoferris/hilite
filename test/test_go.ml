let md =
  {|
```go
package main

//go:wasmexport add
func add(a int32, b int32) int32 {
	return a + b;
}

func main {}
```
|}

let tm =
  let t = TmLanguage.create () in
  let go_syntax = In_channel.with_open_bin "go.plist" Plist_xml.from_channel in
  let grammar = TmLanguage.of_plist_exn go_syntax in
  TmLanguage.add_grammar t grammar;
  t

let test_transform () =
  let omd_t = Cmarkit.Doc.of_string md |> Hilite_markdown.transform ~tm in
  Format.printf "<html><body>%s</body></html>"
    (Cmarkit_html.of_doc ~safe:false omd_t)

let () = test_transform ()
