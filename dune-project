(lang dune 2.7)

(name hilite)

(generate_opam_files true)

(source
 (github patricoferris/hilite))

(cram enable)

(using mdx 0.1)

(license ISC)

(authors "Patrick Ferris")

(maintainers "pf341@patricoferris.com")

(package
 (name hilite)
 (synopsis "Build time syntax highlighting")
 (description
   "A library for adding syntax highlighting to OCaml-related code and outputing to Tyxml.Html or vanilla HTML")
 (depends
  (alcotest :with-test)
  (mdx :with-test)
  markup
  tyxml
  omd
  fmt
  plist-xml
  textmate-language))
