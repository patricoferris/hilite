let css =
  {|
body {
  margin: auto 20%
}

pre code {
  background-color: #282828;
  display: block;
  padding: 1em;
  overflow-x: scroll;
  border-radius: 5px;
  color: #ebdbb2;
}

span[class*='keyword'] {
  color: #fb4934
}

span[class*='constant'] {
  color: #fabd2f
}

span[class*='variable'] {
  color: #85ebeb;
  font-style: italic;
}

span[class*='support'] {
  color: #83a598;
}

span[class*='literal'] {
  color: #d3869b
}

span[class*='literal'] {
  color: #d3869b
}

span[class*='string'] {
  color: #b8bb26
}

span[class*='numeric'] {
  color: #ff5683
}

span[class*='comment'] {
  font-style: italic
  color: #969696
}

span[class*='function'] {
  color: #77ce0e 
}

span[class*='storage-type'] {
 color: #83a598
}

span[class*='deleted'] {
  color: red
}

span[class*='inserted'] {
  color: green 
}
|}

let () =
  let file = In_channel.with_open_bin "./README.md" In_channel.input_all in
  let doc = Cmarkit.Doc.of_string file in
  let s =
    Hilite_markdown.transform ~lookup_method:`Name doc
    |> Cmarkit_html.of_doc ~safe:false
  in
  Format.printf
    {|
    <!doctype html>
<html>
  <head>
    <title>Hilite Test Page</title>
    <style>%s</style>
  </head>
  <body>
    %s
  </body>
</html>
  |}
    css s
