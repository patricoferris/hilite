let md = {|
```ocaml
let html = "<h1>Hello World!</h1>"
```
|}

let test_transform () =
  let omd_t = Omd.of_string md |> Hilite.Md.transform in
  Format.printf "%s" (Omd.to_html omd_t)

let () = test_transform ()
