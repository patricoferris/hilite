let ocaml_interface =
`Assoc ([("name", `String ("OCaml Interface"));
          ("scopeName", `String ("source.ocaml.interface"));
          ("fileTypes", `List ([`String ("mli"); `String ("eliomi")]));
          ("patterns",
           `List ([`Assoc ([("include", `String ("source.ocaml#directives"))]);
                    `Assoc ([("include", `String ("source.ocaml#comments"))]);
                    `Assoc ([("include", `String ("source.ocaml#attributes"))
                              ]);
                    `Assoc ([("include", `String ("source.ocaml#extensions"))
                              ]);
                    `Assoc ([("include", `String ("#bindings"))]);
                    `Assoc ([("include", `String ("source.ocaml#operators"))]);
                    `Assoc ([("include", `String ("#keywords"))]);
                    `Assoc ([("include", `String ("source.ocaml#types"))]);
                    `Assoc ([("include", `String ("source.ocaml#identifiers"))
                              ])
                    ]));
          ("repository",
           `Assoc ([("bindings",
                     `Assoc ([("comment",
                               `String ("bindings that are shared between .ml and .mli syntaxes"));
                               ("patterns",
                                `List ([`Assoc ([("comment",
                                                  `String ("optional labeled argument"));
                                                  ("name",
                                                   `String ("variable.parameter.optional.ocaml"));
                                                  ("match",
                                                   `String ("\\?([[:lower:]_][[:word:]']*)?"))
                                                  ]);
                                         `Assoc ([("comment",
                                                   `String ("labeled argument"));
                                                   ("name",
                                                    `String ("variable.parameter.labeled.ocaml"));
                                                   ("match",
                                                    `String ("~([[:lower:]_][[:word:]']*)?"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("type declaration"));
                                                   ("match",
                                                    `String ("\\b(type)[[:space:]]+(nonrec[[:space:]]+)?(_[[:space:]]+|[+-]?'[[:alpha:]][[:word:]']*[[:space:]]+|\\(.*\\)[[:space:]]+)?([[:lower:]_][[:word:]']*)"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.ocaml"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.ocaml"))
                                                                 ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("patterns",
                                                                 `List (
                                                                 [`Assoc (
                                                                   [("include",
                                                                    `String (
                                                                    "$base"))
                                                                    ])
                                                                   ]))
                                                                 ]));
                                                              ("4",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "entity.name.function.binding.ocaml"))
                                                                 ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("and declaration for let bindings, type declarations, class bindings, class type definitions, or module constraints"));
                                                   ("match",
                                                    `String ("\\b(and)[[:space:]]+(?!(?:module|type|lazy)\\b(?!'))(virtual[[:space:]]+)?(_[[:space:]]+|'[[:alpha:]][[:word:]']*[[:space:]]+|\\(.*\\)[[:space:]]+)?([[:lower:]_][[:word:]']*)(?![[:word:]'])[[:space:]]*(?!,|::|[[:space:]])"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.ocaml"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.ocaml"))
                                                                 ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("patterns",
                                                                 `List (
                                                                 [`Assoc (
                                                                   [("include",
                                                                    `String (
                                                                    "$base"))
                                                                    ])
                                                                   ]))
                                                                 ]));
                                                              ("4",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "entity.name.function.binding.ocaml"))
                                                                 ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("external declaration"));
                                                   ("begin",
                                                    `String ("\\b(external)[[:space:]]+([[:lower:]_][[:word:]']*)?"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.ocaml"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "entity.name.function.binding.ocaml"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("(?<=]|\")[[:space:]]*(?:$|(?=]))"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("comment",
                                                                    `String (
                                                                    "string literal"));
                                                                    ("name",
                                                                    `String (
                                                                    "string.quoted.double.ocaml"));
                                                                    ("begin",
                                                                    `String (
                                                                    "\""));
                                                                    ("end",
                                                                    `String (
                                                                    "\""))]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "$base"))])
                                                             ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("val declaration for class instance variables"));
                                                   ("match",
                                                    `String ("\\b(val)[[:space:]]+(virtual)[[:space:]]+(mutable)[[:space:]]+([[:lower:]_][[:word:]']*)"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.ocaml"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.ocaml"))
                                                                 ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.ocaml"))
                                                                 ]));
                                                              ("4",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "entity.name.function.binding.ocaml"))
                                                                 ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("val declaration for let bindings or class instance variables"));
                                                   ("match",
                                                    `String ("\\b(val|val!)[[:space:]]+(mutable[[:space:]]+)?(virtual[[:space:]]+)?([[:lower:]_][[:word:]']*)"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.ocaml"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.ocaml"))
                                                                 ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.ocaml"))
                                                                 ]));
                                                              ("4",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "entity.name.function.binding.ocaml"))
                                                                 ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("class method declaration"));
                                                   ("match",
                                                    `String ("\\b(method)[[:space:]]+(virtual)[[:space:]]+(private)[[:space:]]+([[:lower:]_][[:word:]']*)"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.ocaml"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.ocaml"))
                                                                 ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.ocaml"))
                                                                 ]));
                                                              ("4",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "entity.name.function.binding.ocaml"))
                                                                 ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("class method declaration"));
                                                   ("match",
                                                    `String ("\\b(method|method!)[[:space:]]+(private[[:space:]]+)?(virtual[[:space:]]+)?([[:lower:]_][[:word:]']*)"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.ocaml"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.ocaml"))
                                                                 ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.ocaml"))
                                                                 ]));
                                                              ("4",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "entity.name.function.binding.ocaml"))
                                                                 ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("class specification or class type definition with type parameters"));
                                                   ("match",
                                                    `String ("\\b(class)[[:space:]]*([[:space:]]+type)?([[:space:]]+virtual)?[[:space:]]*(\\[.*\\])[[:space:]]*([[:lower:]_][[:word:]']*)"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.ocaml"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.ocaml"))
                                                                 ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.ocaml"))
                                                                 ]));
                                                              ("4",
                                                               `Assoc (
                                                               [("patterns",
                                                                 `List (
                                                                 [`Assoc (
                                                                   [("include",
                                                                    `String (
                                                                    "$base"))
                                                                    ])
                                                                   ]))
                                                                 ]));
                                                              ("5",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "entity.name.function.binding.ocaml"))
                                                                 ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("class specification or class type definition"));
                                                   ("match",
                                                    `String ("\\b(class)[[:space:]]+(type[[:space:]]+)?(virtual[[:space:]]+)?([[:lower:]_][[:word:]']*)"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.ocaml"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.ocaml"))
                                                                 ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.ocaml"))
                                                                 ]));
                                                              ("4",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "entity.name.function.binding.ocaml"))
                                                                 ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("named self in object"));
                                                   ("match",
                                                    `String ("\\b(object)[[:space:]]*\\([[:space:]]*([[:lower:]_][[:word:]']*)"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.ocaml"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "entity.name.function.binding.ocaml"))
                                                                 ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("module type of"));
                                                   ("begin",
                                                    `String ("\\b(module)[[:space:]]+(type)[[:space:]]+(of)\\b"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.ocaml"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.ocaml"))
                                                                 ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.ocaml"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("(?=val|external|type|exception|class|module|open|include|=)"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "source.ocaml"))
                                                                    ])
                                                             ]))
                                                   ])
                                         ]))
                               ]));
                     ("keywords",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("comment",
                                                  `String ("reserved ocaml keyword (in interfaces)"));
                                                  ("name",
                                                   `String ("keyword.other.ocaml.interface"));
                                                  ("match",
                                                   `String ("\\b(and|as|class|constraint|end|exception|external|functor|in|include|inherit|let[[:space:]]+open|method|module|mutable|nonrec|object|of|open|private|rec|sig|type|val|virtual|with)\\b(?!')"))
                                                  ])
                                         ]))
                                ]))
                     ]))
          ])


let ocaml =
`Assoc ([("name", `String ("OCaml"));
          ("scopeName", `String ("source.ocaml"));
          ("fileTypes",
           `List ([`String ("ml"); `String ("eliom"); `String (".ocamlinit")]));
          ("patterns",
           `List ([`Assoc ([("include", `String ("#directives"))]);
                    `Assoc ([("include", `String ("#comments"))]);
                    `Assoc ([("include", `String ("#strings"))]);
                    `Assoc ([("include", `String ("#characters"))]);
                    `Assoc ([("include", `String ("#attributes"))]);
                    `Assoc ([("include", `String ("#extensions"))]);
                    `Assoc ([("include", `String ("#modules"))]);
                    `Assoc ([("include", `String ("#bindings"))]);
                    `Assoc ([("include", `String ("#operators"))]);
                    `Assoc ([("include", `String ("#keywords"))]);
                    `Assoc ([("include", `String ("#literals"))]);
                    `Assoc ([("include", `String ("#types"))]);
                    `Assoc ([("include", `String ("#identifiers"))])]));
          ("repository",
           `Assoc ([("directives",
                     `Assoc ([("patterns",
                               `List ([`Assoc ([("comment",
                                                 `String ("line number directive"));
                                                 ("begin",
                                                  `String ("^[[:space:]]*(#)[[:space:]]*([[:digit:]]+)"));
                                                 ("end", `String ("$"));
                                                 ("beginCaptures",
                                                  `Assoc ([("1",
                                                            `Assoc ([("name",
                                                                    `String (
                                                                    "keyword.other.ocaml"))
                                                                    ]));
                                                            ("2",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "constant.numeric.decimal.integer.ocaml"))
                                                               ]))
                                                            ]));
                                                 ("contentName",
                                                  `String ("comment.line.directive.ocaml"))
                                                 ]);
                                        `Assoc ([("comment",
                                                  `String ("general, loading codes"));
                                                  ("begin",
                                                   `String ("^[[:space:]]*(#)[[:space:]]*(help|quit|cd|directory|remove_directory|load_rec|load|use|mod_use)"));
                                                  ("end", `String ("$"));
                                                  ("beginCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "keyword.other.ocaml"))
                                                               ]));
                                                             ("2",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.other.ocaml"))
                                                                ]))
                                                             ]));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#strings"))
                                                                    ])
                                                            ]))
                                                  ]);
                                        `Assoc ([("comment",
                                                  `String ("environment queries"));
                                                  ("begin",
                                                   `String ("^[[:space:]]*(#)[[:space:]]*(show_class_type|show_class|show_exception|show_module_type|show_module|show_type|show_val|show)"));
                                                  ("end", `String ("$"));
                                                  ("beginCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "keyword.other.ocaml"))
                                                               ]));
                                                             ("2",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.other.ocaml"))
                                                                ]))
                                                             ]));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#types"))
                                                                    ]);
                                                            `Assoc ([("include",
                                                                    `String (
                                                                    "#identifiers"))
                                                                    ])
                                                            ]))
                                                  ]);
                                        `Assoc ([("comment",
                                                  `String ("pretty-printing, tracing"));
                                                  ("begin",
                                                   `String ("^[[:space:]]*(#)[[:space:]]*(install_printer|print_depth|print_length|remove_printer|trace|untrace_all|untrace)"));
                                                  ("end", `String ("$"));
                                                  ("beginCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "keyword.other.ocaml"))
                                                               ]));
                                                             ("2",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.other.ocaml"))
                                                                ]))
                                                             ]));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#literals"))
                                                                    ]);
                                                            `Assoc ([("include",
                                                                    `String (
                                                                    "#identifiers"))
                                                                    ])
                                                            ]))
                                                  ]);
                                        `Assoc ([("comment",
                                                  `String ("compiler options"));
                                                  ("begin",
                                                   `String ("^[[:space:]]*(#)[[:space:]]*(labels|ppx|principal|rectypes|warn_error|warnings)"));
                                                  ("end", `String ("$"));
                                                  ("beginCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "keyword.other.ocaml"))
                                                               ]));
                                                             ("2",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.other.ocaml"))
                                                                ]))
                                                             ]));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#strings"))
                                                                    ]);
                                                            `Assoc ([("include",
                                                                    `String (
                                                                    "#literals"))
                                                                    ])
                                                            ]))
                                                  ]);
                                        `Assoc ([("comment",
                                                  `String ("topfind directives"));
                                                  ("begin",
                                                   `String ("^[[:space:]]*(#)[[:space:]]*(require|list|camlp4o|camlp4r|predicates|thread)"));
                                                  ("end", `String ("$"));
                                                  ("beginCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "keyword.other.ocaml"))
                                                               ]));
                                                             ("2",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.other.ocaml"))
                                                                ]))
                                                             ]));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#strings"))
                                                                    ])
                                                            ]))
                                                  ]);
                                        `Assoc ([("comment",
                                                  `String ("cppo directives"));
                                                  ("begin",
                                                   `String ("^[[:space:]]*(#)[[:space:]]*(define|undef|ifdef|ifndef|if|else|elif|endif|include|warning|error|ext|endext)"));
                                                  ("end", `String ("$"));
                                                  ("beginCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "keyword.other.ocaml"))
                                                               ]));
                                                             ("2",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.other.ocaml"))
                                                                ]))
                                                             ]));
                                                  ("patterns",
                                                   `List ([`Assoc ([("name",
                                                                    `String (
                                                                    "keyword.other.ocaml"));
                                                                    ("match",
                                                                    `String (
                                                                    "\\b(defined)\\b"))
                                                                    ]);
                                                            `Assoc ([("name",
                                                                    `String (
                                                                    "keyword.other.ocaml"));
                                                                    ("match",
                                                                    `String (
                                                                    "\\\\"))]);
                                                            `Assoc ([("include",
                                                                    `String (
                                                                    "#comments"))
                                                                    ]);
                                                            `Assoc ([("include",
                                                                    `String (
                                                                    "#strings"))
                                                                    ]);
                                                            `Assoc ([("include",
                                                                    `String (
                                                                    "#characters"))
                                                                    ]);
                                                            `Assoc ([("include",
                                                                    `String (
                                                                    "#keywords"))
                                                                    ]);
                                                            `Assoc ([("include",
                                                                    `String (
                                                                    "#operators"))
                                                                    ]);
                                                            `Assoc ([("include",
                                                                    `String (
                                                                    "#literals"))
                                                                    ]);
                                                            `Assoc ([("include",
                                                                    `String (
                                                                    "#types"))
                                                                    ]);
                                                            `Assoc ([("include",
                                                                    `String (
                                                                    "#identifiers"))
                                                                    ])
                                                            ]))
                                                  ])
                                        ]))
                               ]));
                     ("comments",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("comment",
                                                  `String ("empty comment"));
                                                  ("name",
                                                   `String ("comment.block.ocaml"));
                                                  ("match",
                                                   `String ("\\(\\*\\*\\)"))
                                                  ]);
                                         `Assoc ([("comment",
                                                   `String ("ocamldoc comment"));
                                                   ("name",
                                                    `String ("comment.doc.ocaml"));
                                                   ("begin",
                                                    `String ("\\(\\*\\*"));
                                                   ("end", `String ("\\*\\)"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "source.ocaml.ocamldoc#markup"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#strings-in-comments"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#comments"))])
                                                             ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("Cinaps comment"));
                                                   ("begin",
                                                    `String ("\\(\\*\\$"));
                                                   ("end", `String ("\\*\\)"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "comment.cinaps.ocaml"))
                                                                ]))
                                                              ]));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "comment.cinaps.ocaml"))
                                                                ]))
                                                              ]));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("block comment"));
                                                   ("name",
                                                    `String ("comment.block.ocaml"));
                                                   ("begin",
                                                    `String ("\\(\\*"));
                                                   ("end", `String ("\\*\\)"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#strings-in-comments"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#comments"))])
                                                             ]))
                                                   ])
                                         ]))
                                ]));
                     ("strings-in-comments",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("comment",
                                                  `String ("char literal"));
                                                  ("match",
                                                   `String ("'(\\\\)?.'"))
                                                  ]);
                                         `Assoc ([("comment",
                                                   `String ("string literal"));
                                                   ("begin", `String ("\""));
                                                   ("end", `String ("\""));
                                                   ("patterns",
                                                    `List ([`Assoc ([("match",
                                                                    `String (
                                                                    "\\\\\\\\"))
                                                                    ]);
                                                             `Assoc (
                                                             [("match",
                                                               `String (
                                                               "\\\\\""))])
                                                             ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("quoted string literal"));
                                                   ("begin",
                                                    `String ("\\{[[:lower:]_]*\\|"));
                                                   ("end",
                                                    `String ("\\|[[:lower:]_]*\\}"))
                                                   ])
                                         ]))
                                ]));
                     ("strings",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("comment",
                                                  `String ("quoted string literal"));
                                                  ("name",
                                                   `String ("string.quoted.braced.ocaml"));
                                                  ("begin",
                                                   `String ("\\{(%%?[[:alpha:]_][[:word:]']*(\\.[[:alpha:]_][[:word:]']*)*[[:space:]]*)?[[:lower:]_]*\\|"));
                                                  ("end",
                                                   `String ("\\|[[:lower:]_]*\\}"));
                                                  ("beginCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "keyword.other.extension.ocaml"))
                                                               ]))
                                                             ]))
                                                  ]);
                                         `Assoc ([("comment",
                                                   `String ("string literal"));
                                                   ("name",
                                                    `String ("string.quoted.double.ocaml"));
                                                   ("begin", `String ("\""));
                                                   ("end", `String ("\""));
                                                   ("patterns",
                                                    `List ([`Assoc ([("comment",
                                                                    `String (
                                                                    "escaped newline"));
                                                                    ("name",
                                                                    `String (
                                                                    "constant.character.escape.ocaml"));
                                                                    ("match",
                                                                    `String (
                                                                    "\\\\$"))
                                                                    ]);
                                                             `Assoc (
                                                             [("comment",
                                                               `String (
                                                               "escaped backslash"));
                                                               ("name",
                                                                `String (
                                                                "constant.character.escape.ocaml"));
                                                               ("match",
                                                                `String (
                                                                "\\\\\\\\"))
                                                               ]);
                                                             `Assoc (
                                                             [("comment",
                                                               `String (
                                                               "escaped quote or whitespace"));
                                                               ("name",
                                                                `String (
                                                                "constant.character.escape.ocaml"));
                                                               ("match",
                                                                `String (
                                                                "\\\\[\"'ntbr ]"))
                                                               ]);
                                                             `Assoc (
                                                             [("comment",
                                                               `String (
                                                               "character from decimal ASCII code"));
                                                               ("name",
                                                                `String (
                                                                "constant.character.escape.ocaml"));
                                                               ("match",
                                                                `String (
                                                                "\\\\[[:digit:]]{3}"))
                                                               ]);
                                                             `Assoc (
                                                             [("comment",
                                                               `String (
                                                               "character from hexadecimal ASCII code"));
                                                               ("name",
                                                                `String (
                                                                "constant.character.escape.ocaml"));
                                                               ("match",
                                                                `String (
                                                                "\\\\x[[:xdigit:]]{2}"))
                                                               ]);
                                                             `Assoc (
                                                             [("comment",
                                                               `String (
                                                               "character from octal ASCII code"));
                                                               ("name",
                                                                `String (
                                                                "constant.character.escape.ocaml"));
                                                               ("match",
                                                                `String (
                                                                "\\\\o[0-3][0-7]{2}"))
                                                               ]);
                                                             `Assoc (
                                                             [("comment",
                                                               `String (
                                                               "unicode character escape sequence"));
                                                               ("name",
                                                                `String (
                                                                "constant.character.escape.ocaml"));
                                                               ("match",
                                                                `String (
                                                                "\\\\u\\{[[:xdigit:]]{1,6}\\}"))
                                                               ]);
                                                             `Assoc (
                                                             [("comment",
                                                               `String (
                                                               "printf format string"));
                                                               ("name",
                                                                `String (
                                                                "constant.character.printf.ocaml"));
                                                               ("match",
                                                                `String (
                                                                "%[-0+ #]*([[:digit:]]+|\\*)?(.([[:digit:]]+|\\*))?[lLn]?[diunlLNxXosScCfFeEgGhHBbat!%@,]"))
                                                               ]);
                                                             `Assoc (
                                                             [("comment",
                                                               `String (
                                                               "unknown escape sequence"));
                                                               ("name",
                                                                `String (
                                                                "invalid.illegal.unknown-escape.ocaml"));
                                                               ("match",
                                                                `String (
                                                                "\\\\."))
                                                               ])
                                                             ]))
                                                   ])
                                         ]))
                                ]));
                     ("characters",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("comment",
                                                  `String ("character literal from escaped backslash"));
                                                  ("name",
                                                   `String ("string.quoted.single.ocaml"));
                                                  ("match",
                                                   `String ("'(\\\\\\\\)'"));
                                                  ("captures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "constant.character.escape.ocaml"))
                                                               ]))
                                                             ]))
                                                  ]);
                                         `Assoc ([("comment",
                                                   `String ("character literal from escaped quote or whitespace"));
                                                   ("name",
                                                    `String ("string.quoted.single.ocaml"));
                                                   ("match",
                                                    `String ("'(\\\\[\"'ntbr ])'"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "constant.character.escape.ocaml"))
                                                                ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("character literal from decimal ASCII code"));
                                                   ("name",
                                                    `String ("string.quoted.single.ocaml"));
                                                   ("match",
                                                    `String ("'(\\\\[[:digit:]]{3})'"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "constant.character.escape.ocaml"))
                                                                ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("character literal from hexadecimal ASCII code"));
                                                   ("name",
                                                    `String ("string.quoted.single.ocaml"));
                                                   ("match",
                                                    `String ("'(\\\\x[[:xdigit:]]{2})'"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "constant.character.escape.ocaml"))
                                                                ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("character literal from octal ASCII code"));
                                                   ("name",
                                                    `String ("string.quoted.single.ocaml"));
                                                   ("match",
                                                    `String ("'(\\\\o[0-3][0-7]{2})'"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "constant.character.escape.ocaml"))
                                                                ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("character literal from unknown escape sequence"));
                                                   ("name",
                                                    `String ("string.quoted.single.ocaml"));
                                                   ("match",
                                                    `String ("'(\\\\.)'"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "invalid.illegal.unknown-escape.ocaml"))
                                                                ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("character literal"));
                                                   ("name",
                                                    `String ("string.quoted.single.ocaml"));
                                                   ("match", `String ("'.'"))
                                                   ])
                                         ]))
                                ]));
                     ("attributes",
                      `Assoc ([("begin",
                                `String ("\\[(@|@@|@@@)[[:space:]]*([[:alpha:]_]+(\\.[[:word:]']+)*)"));
                                ("end", `String ("\\]"));
                                ("beginCaptures",
                                 `Assoc ([("1",
                                           `Assoc ([("name",
                                                     `String ("keyword.operator.attribute.ocaml"))
                                                     ]));
                                           ("2",
                                            `Assoc ([("name",
                                                      `String ("keyword.other.attribute.ocaml"));
                                                      ("patterns",
                                                       `List ([`Assoc (
                                                                [("name",
                                                                  `String (
                                                                  "keyword.other.ocaml punctuation.other.period punctuation.separator.period"));
                                                                  ("match",
                                                                   `String (
                                                                   "\\."))
                                                                  ])
                                                                ]))
                                                      ]))
                                           ]));
                                ("patterns",
                                 `List ([`Assoc ([("include",
                                                   `String ("$self"))])
                                          ]))
                                ]));
                     ("extensions",
                      `Assoc ([("begin",
                                `String ("\\[(%|%%)[[:space:]]*([[:alpha:]_]+(\\.[[:word:]']+)*)"));
                                ("end", `String ("\\]"));
                                ("beginCaptures",
                                 `Assoc ([("1",
                                           `Assoc ([("name",
                                                     `String ("keyword.operator.extension.ocaml"))
                                                     ]));
                                           ("2",
                                            `Assoc ([("name",
                                                      `String ("keyword.other.extension.ocaml"));
                                                      ("patterns",
                                                       `List ([`Assoc (
                                                                [("name",
                                                                  `String (
                                                                  "keyword.other.ocaml punctuation.other.period punctuation.separator.period"));
                                                                  ("match",
                                                                   `String (
                                                                   "\\."))
                                                                  ])
                                                                ]))
                                                      ]))
                                           ]));
                                ("patterns",
                                 `List ([`Assoc ([("include",
                                                   `String ("$self"))])
                                          ]))
                                ]));
                     ("modules",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("begin",
                                                  `String ("\\b(sig)\\b"));
                                                  ("end",
                                                   `String ("\\b(end)\\b"));
                                                  ("beginCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "keyword.other.ocaml"))
                                                               ]))
                                                             ]));
                                                  ("endCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "keyword.other.ocaml"))
                                                               ]))
                                                             ]));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "source.ocaml.interface"))
                                                                    ])
                                                            ]))
                                                  ]);
                                         `Assoc ([("begin",
                                                   `String ("\\b(struct)\\b"));
                                                   ("end",
                                                    `String ("\\b(end)\\b"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.other.ocaml"))
                                                                ]))
                                                              ]));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.other.ocaml"))
                                                                ]))
                                                              ]));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                             ]))
                                                   ])
                                         ]))
                                ]));
                     ("bindings",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("comment",
                                                  `String ("for loop"));
                                                  ("match",
                                                   `String ("\\b(for)[[:space:]]+([[:lower:]_][[:word:]']*)"));
                                                  ("captures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "keyword.ocaml"))
                                                               ]));
                                                             ("2",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "entity.name.function.binding.ocaml"))
                                                                ]))
                                                             ]))
                                                  ]);
                                         `Assoc ([("comment",
                                                   `String ("local open/exception/module"));
                                                   ("match",
                                                    `String ("\\b(let)[[:space:]]+(open|exception|module)\\b(?!')"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.ocaml"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.ocaml"))
                                                                 ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("let expression"));
                                                   ("match",
                                                    `String ("\\b(let)[[:space:]]+(?!lazy\\b(?!'))(rec[[:space:]]+)?(?!rec\\b(?!'))([[:lower:]_][[:word:]']*)(?![[:word:]'])[[:space:]]*(?!,|::|[[:space:]])"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.ocaml"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.ocaml"))
                                                                 ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "entity.name.function.binding.ocaml"))
                                                                 ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("using binding operators"));
                                                   ("match",
                                                    `String ("\\b(let|and)([$&*+\\-/=>@^|<][!?$&*+\\-/=>@^|%:]*)[[:space:]]*(?!lazy\\b(?!'))([[:lower:]_][[:word:]']*)(?![[:word:]'])[[:space:]]*(?!,|::|[[:space:]])"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.ocaml"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.ocaml"))
                                                                 ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "entity.name.function.binding.ocaml"))
                                                                 ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("first class module packing"));
                                                   ("match",
                                                    `String ("\\([[:space:]]*(val)[[:space:]]+([[:lower:]_][[:word:]']*)"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.ocaml"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("patterns",
                                                                 `List (
                                                                 [`Assoc (
                                                                   [("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                                   ]))
                                                                 ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("locally abstract types"));
                                                   ("match",
                                                    `String ("(?:\\(|(:))[[:space:]]*(type)((?:[[:space:]]+[[:lower:]_][[:word:]']*)+)"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.other.ocaml punctuation.other.colon punctuation.colon"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.ocaml"))
                                                                 ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "entity.name.function.binding.ocaml"))
                                                                 ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("optional labeled argument with type"));
                                                   ("begin",
                                                    `String ("(\\?)\\([[:space:]]*([[:lower:]_][[:word:]']*)"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "variable.parameter.optional.ocaml"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "variable.parameter.optional.ocaml"))
                                                                 ]))
                                                              ]));
                                                   ("end", `String ("\\)"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("labeled argument with type"));
                                                   ("begin",
                                                    `String ("(~)\\([[:space:]]*([[:lower:]_][[:word:]']*)"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "variable.parameter.labeled.ocaml"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "variable.parameter.labeled.ocaml"))
                                                                 ]))
                                                              ]));
                                                   ("end", `String ("\\)"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("include",
                                                   `String ("source.ocaml.interface#bindings"))
                                                   ])
                                         ]))
                                ]));
                     ("operators",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("comment",
                                                  `String ("binding operator"));
                                                  ("name",
                                                   `String ("keyword.ocaml"));
                                                  ("match",
                                                   `String ("\\b(let|and)[$&*+\\-/=>@^|<][!?$&*+\\-/=>@^|%:]*"))
                                                  ]);
                                         `Assoc ([("comment",
                                                   `String ("infix symbol"));
                                                   ("name",
                                                    `String ("keyword.operator.ocaml"));
                                                   ("match",
                                                    `String ("[$&*+\\-/=>@^%<][~!?$&*+\\-/=>@^|%<:.]*"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("infix symbol that begins with vertical bar"));
                                                   ("name",
                                                    `String ("keyword.operator.ocaml"));
                                                   ("match",
                                                    `String ("\\|[~!?$&*+\\-/=>@^|%<:.]+"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("vertical bar"));
                                                   ("name",
                                                    `String ("keyword.other.ocaml"));
                                                   ("match",
                                                    `String ("(?<!\\[)(\\|)(?!\\])"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("infix symbol"));
                                                   ("name",
                                                    `String ("keyword.operator.ocaml"));
                                                   ("match",
                                                    `String ("#[~!?$&*+\\-/=>@^|%<:.]+"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("prefix symbol"));
                                                   ("name",
                                                    `String ("keyword.operator.ocaml"));
                                                   ("match",
                                                    `String ("![~!?$&*+\\-/=>@^|%<:.]*"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("prefix symbol"));
                                                   ("name",
                                                    `String ("keyword.operator.ocaml"));
                                                   ("match",
                                                    `String ("[?~][~!?$&*+\\-/=>@^|%<:.]+"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("named operator"));
                                                   ("name",
                                                    `String ("keyword.operator.ocaml"));
                                                   ("match",
                                                    `String ("\\b(or|mod|land|lor|lxor|lsl|lsr|asr)\\b"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("method invocation"));
                                                   ("name",
                                                    `String ("keyword.other.ocaml"));
                                                   ("match", `String ("#"))]);
                                         `Assoc ([("comment",
                                                   `String ("type annotation"));
                                                   ("name",
                                                    `String ("keyword.other.ocaml punctuation.other.colon punctuation.colon"));
                                                   ("match", `String (":"))]);
                                         `Assoc ([("comment",
                                                   `String ("field accessor"));
                                                   ("name",
                                                    `String ("keyword.other.ocaml punctuation.other.period punctuation.separator.period"));
                                                   ("match", `String ("\\."))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("semicolon separator"));
                                                   ("name",
                                                    `String ("keyword.other.ocaml punctuation.separator.terminator punctuation.separator.semicolon"));
                                                   ("match", `String (";"))]);
                                         `Assoc ([("comment",
                                                   `String ("comma separator"));
                                                   ("name",
                                                    `String ("keyword.other.ocaml punctuation.comma punctuation.separator.comma"));
                                                   ("match", `String (","))])
                                         ]))
                                ]));
                     ("keywords",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("comment",
                                                  `String ("reserved ocaml keyword"));
                                                  ("name",
                                                   `String ("keyword.other.ocaml"));
                                                  ("match",
                                                   `String ("\\b(and|as|assert|begin|class|constraint|do|done|downto|else|end|exception|external|for|fun|function|functor|if|in|include|inherit|initializer|lazy|let|match|method|module|mutable|new|nonrec|object|of|open|private|rec|sig|struct|then|to|try|type|val|virtual|when|while|with)\\b(?!')"))
                                                  ])
                                         ]))
                                ]));
                     ("literals",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("comment",
                                                  `String ("boolean literal"));
                                                  ("name",
                                                   `String ("constant.language.boolean.ocaml"));
                                                  ("match",
                                                   `String ("\\b(true|false)\\b"))
                                                  ]);
                                         `Assoc ([("comment",
                                                   `String ("floating point decimal literal with exponent"));
                                                   ("name",
                                                    `String ("constant.numeric.decimal.float.ocaml"));
                                                   ("match",
                                                    `String ("\\b([[:digit:]][[:digit:]_]*(\\.[[:digit:]_]*)?[eE][+-]?[[:digit:]][[:digit:]_]*[g-zG-Z]?)\\b"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("floating point decimal literal"));
                                                   ("name",
                                                    `String ("constant.numeric.decimal.float.ocaml"));
                                                   ("match",
                                                    `String ("\\b([[:digit:]][[:digit:]_]*)(\\.[[:digit:]_]*[g-zG-Z]?\\b|\\.)"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("floating point hexadecimal literal with exponent part"));
                                                   ("name",
                                                    `String ("constant.numeric.hexadecimal.float.ocaml"));
                                                   ("match",
                                                    `String ("\\b((0x|0X)[[:xdigit:]][[:xdigit:]_]*(\\.[[:xdigit:]_]*)?[pP][+-]?[[:digit:]][[:digit:]_]*[g-zG-Z]?)\\b"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("floating point hexadecimal literal"));
                                                   ("name",
                                                    `String ("constant.numeric.hexadecimal.float.ocaml"));
                                                   ("match",
                                                    `String ("\\b((0x|0X)[[:xdigit:]][[:xdigit:]_]*)(\\.[[:xdigit:]_]*[g-zG-Z]?\\b|\\.)"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("decimal integer literal"));
                                                   ("name",
                                                    `String ("constant.numeric.decimal.integer.ocaml"));
                                                   ("match",
                                                    `String ("\\b([[:digit:]][[:digit:]_]*[lLng-zG-Z]?)\\b"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("hexadecimal integer literal"));
                                                   ("name",
                                                    `String ("constant.numeric.hexadecimal.integer.ocaml"));
                                                   ("match",
                                                    `String ("\\b((0x|0X)[[:xdigit:]][[:xdigit:]_]*[lLng-zG-Z]?)\\b"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("octal integer literal"));
                                                   ("name",
                                                    `String ("constant.numeric.octal.integer.ocaml"));
                                                   ("match",
                                                    `String ("\\b((0o|0O)[0-7][0-7_]*[lLng-zG-Z]?)\\b"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("binary integer literal"));
                                                   ("name",
                                                    `String ("constant.numeric.binary.integer.ocaml"));
                                                   ("match",
                                                    `String ("\\b((0b|0B)[0-1][0-1_]*[lLng-zG-Z]?)\\b"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("unit literal"));
                                                   ("name",
                                                    `String ("constant.language.unit.ocaml"));
                                                   ("match",
                                                    `String ("\\(\\)"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("parentheses"));
                                                   ("begin", `String ("\\("));
                                                   ("end", `String ("\\)"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("empty array"));
                                                   ("name",
                                                    `String ("constant.language.array.ocaml"));
                                                   ("match",
                                                    `String ("\\[\\|\\|\\]"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("array"));
                                                   ("begin",
                                                    `String ("\\[\\|"));
                                                   ("end", `String ("\\|\\]"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("empty list"));
                                                   ("name",
                                                    `String ("constant.language.list.ocaml"));
                                                   ("match",
                                                    `String ("\\[\\]"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("list"));
                                                   ("begin", `String ("\\["));
                                                   ("end", `String ("]"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("braces"));
                                                   ("begin", `String ("\\{"));
                                                   ("end", `String ("\\}"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                             ]))
                                                   ])
                                         ]))
                                ]));
                     ("types",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("comment",
                                                  `String ("type parameter"));
                                                  ("name",
                                                   `String ("storage.type.ocaml"));
                                                  ("match",
                                                   `String ("'[[:alpha:]][[:word:]']*\\b|'_\\b"))
                                                  ]);
                                         `Assoc ([("comment",
                                                   `String ("weak type parameter"));
                                                   ("name",
                                                    `String ("storage.type.weak.ocaml"));
                                                   ("match",
                                                    `String ("'_[[:alpha:]][[:word:]']*\\b"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("builtin type"));
                                                   ("name",
                                                    `String ("support.type.ocaml"));
                                                   ("match",
                                                    `String ("\\b(unit|bool|int|int32|int64|nativeint|float|char|bytes|string)\\b"))
                                                   ])
                                         ]))
                                ]));
                     ("identifiers",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("comment",
                                                  `String ("wildcard underscore"));
                                                  ("name",
                                                   `String ("constant.language.ocaml"));
                                                  ("match",
                                                   `String ("\\b_\\b"))
                                                  ]);
                                         `Assoc ([("comment",
                                                   `String ("capital identifier for constructor, exception, or module"));
                                                   ("name",
                                                    `String ("constant.language.capital-identifier.ocaml"));
                                                   ("match",
                                                    `String ("\\b[[:upper:]][[:word:]']*('|\\b)"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("lowercase identifier"));
                                                   ("name",
                                                    `String ("source.ocaml"));
                                                   ("match",
                                                    `String ("\\b[[:lower:]_][[:word:]']*('|\\b)"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("polymorphic variant tag"));
                                                   ("name",
                                                    `String ("constant.language.polymorphic-variant.ocaml"));
                                                   ("match",
                                                    `String ("\\`[[:alpha:]][[:word:]']*\\b"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("empty list (can be used as a constructor)"));
                                                   ("name",
                                                    `String ("constant.language.list.ocaml"));
                                                   ("match",
                                                    `String ("\\[\\]"))
                                                   ])
                                         ]))
                                ]))
                     ]))
          ])


let dune =
`Assoc ([("name", `String ("dune")); ("scopeName", `String ("source.dune"));
          ("fileTypes", `List ([`String ("dune"); `String ("jbuild")]));
          ("patterns",
           `List ([`Assoc ([("include", `String ("#comments"))]);
                    `Assoc ([("name", `String ("meta.stanza.dune"));
                              ("begin",
                               `String ("\\([[:space:]]*(library|rule|executable|executables|rule|ocamllex|ocamlyacc|menhir|install|alias|copy_files|copy_files#|jbuild_version|include)[[:space:]]"));
                              ("end", `String ("\\)"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("meta.class.stanza.dune"))
                                                   ]))
                                         ]));
                              ("patterns",
                               `List ([`Assoc ([("include", `String ("$self"))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("name",
                              `String ("meta.stanza.library.field.dune"));
                              ("begin",
                               `String ("\\([[:space:]]*(name|public_name|synopsis|install_c_headers|ppx_runtime_libraries|c_flags|cxx_flags|c_names|cxx_names|library_flags|c_library_flags|virtual_deps|modes|kind|wrapped|optional|self_build_stubs_archive|no_dynlink|ppx\\.driver)[[:space:]]"));
                              ("end", `String ("\\)"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("keyword.other.dune"))
                                                   ]))
                                         ]));
                              ("patterns",
                               `List ([`Assoc ([("include", `String ("$self"))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("name", `String ("meta.stanza.rule.dune"));
                              ("begin",
                               `String ("\\([[:space:]]*(targets|deps|locks|loc|mode|action)[[:space:]]"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("keyword.other.dune"))
                                                   ]))
                                         ]));
                              ("end", `String ("\\)"));
                              ("patterns",
                               `List ([`Assoc ([("include", `String ("$self"))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("name", `String ("meta.mono-sexp.dune"));
                              ("match",
                               `String ("\\([[:space:]]*(fallback|optional)[[:space:]]*\\)"));
                              ("captures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("keyword.other.dune"))
                                                   ]))
                                         ]))
                              ]);
                    `Assoc ([("name",
                              `String ("meta.stanza.rule.action.dune"));
                              ("begin",
                               `String ("\\([[:space:]]*(run|chdir|setenv|with-stdout-to|with-stderr-to|with-outputs-to|ignore-stdout|ignore-stderr|ignore-outputs|progn|echo|cat|copy|copy#|system|bash|write-file|diff|diff\\?)[[:space:]]"));
                              ("end", `String ("\\)"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("entity.name.function.action.dune"))
                                                   ]))
                                         ]));
                              ("patterns",
                               `List ([`Assoc ([("include", `String ("$self"))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("name", `String ("meta.stanza.install.dune"));
                              ("begin",
                               `String ("\\([[:space:]]*(section)[[:space:]]"));
                              ("end", `String ("\\)"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("keyword.other.dune"))
                                                   ]))
                                         ]));
                              ("patterns",
                               `List ([`Assoc ([("name",
                                                 `String ("constant.language.rule.mode.dune"));
                                                 ("match",
                                                  `String ("\\b(lib|libexec|bin|sbin|toplevel|share|share_root|etc|doc|stublibs|man|misc)\\b"))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("name", `String ("meta.stanza.install.dune"));
                              ("begin",
                               `String ("\\([[:space:]]*(files)[[:space:]]"));
                              ("end", `String ("\\)"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("keyword.other.dune"))
                                                   ]))
                                         ]));
                              ("patterns",
                               `List ([`Assoc ([("include", `String ("$self"))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("name", `String ("meta.library.kind.dune"));
                              ("begin",
                               `String ("\\([[:space:]]*(normal|ppx_deriver|ppx_rewriter)[[:space:]]"));
                              ("end", `String ("\\)"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("constant.language.rule.mode.dune"))
                                                   ]))
                                         ]))
                              ]);
                    `Assoc ([("name",
                              `String ("meta.stanza.executables.dune"));
                              ("begin",
                               `String ("\\([[:space:]]*(name|link_executables|link_flags|modes)[[:space:]]"));
                              ("end", `String ("\\)"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("keyword.other.dune"))
                                                   ]))
                                         ]));
                              ("patterns",
                               `List ([`Assoc ([("include", `String ("$self"))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("name",
                              `String ("meta.stanza.lib-or-exec.buildable.dune"));
                              ("begin",
                               `String ("\\([[:space:]]*(preprocess|preprocessor_deps|lint|modules|modules_without_implementation|libraries|flags|ocamlc_flags|ocamlopt_flags|js_of_ocaml|allow_overlapping_dependencies|per_module)[[:space:]]"));
                              ("end", `String ("\\)"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("keyword.other.dune"))
                                                   ]))
                                         ]));
                              ("patterns",
                               `List ([`Assoc ([("include", `String ("$self"))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("name",
                              `String ("meta.stanza.lib-or-exec.buildable.preprocess.dune"));
                              ("begin",
                               `String ("\\([[:space:]]*(no_preprocessing|action|pps)[[:space:]]"));
                              ("end", `String ("\\)"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("keyword.other.dune"))
                                                   ]))
                                         ]));
                              ("patterns",
                               `List ([`Assoc ([("include", `String ("$self"))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("name",
                              `String ("meta.stanza.lib-or-exec.buildable.preprocess_deps.dune"));
                              ("begin",
                               `String ("\\([[:space:]]*(file|alias|alias_rec|glob_files|files_recursively_in)[[:space:]]"));
                              ("end", `String ("\\)"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("keyword.other.dune"))
                                                   ]))
                                         ]));
                              ("patterns",
                               `List ([`Assoc ([("include", `String ("$self"))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("name",
                              `String ("meta.stanza.lib-or-exec.buildable.libraries.dune"));
                              ("begin",
                               `String ("\\([[:space:]]*(select)[[:space:]]"));
                              ("end", `String ("\\)"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("keyword.other.dune"))
                                                   ]))
                                         ]));
                              ("patterns",
                               `List ([`Assoc ([("include", `String ("$self"))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("name", `String ("constant.numeric.dune"));
                              ("match", `String ("\\b\\d+\\b"))]);
                    `Assoc ([("name", `String ("constant.language.dune"));
                              ("match", `String ("(true|false)"))]);
                    `Assoc ([("name", `String ("keyword.other.dune"));
                              ("match",
                               `String ("[[:space:]](as|from|->)[[:space:]]"))
                              ]);
                    `Assoc ([("name", `String ("keyword.other.dune"));
                              ("match", `String ("(\\!)"))]);
                    `Assoc ([("name", `String ("constant.language.flag.dune"));
                              ("match", `String ("(:\\w+)\\b"))]);
                    `Assoc ([("name",
                              `String ("constant.language.rule.mode.dune"));
                              ("match",
                               `String ("\\b(standard|fallback|promote|promote-until-then)\\b"))
                              ]);
                    `Assoc ([("include", `String ("#string"))]);
                    `Assoc ([("include", `String ("#variable"))]);
                    `Assoc ([("include", `String ("#list"))]);
                    `Assoc ([("include", `String ("#atom"))])]));
          ("repository",
           `Assoc ([("comments",
                     `Assoc ([("patterns",
                               `List ([`Assoc ([("name",
                                                 `String ("comment.block.dune"));
                                                 ("begin", `String ("#\\|"));
                                                 ("beginCaptures",
                                                  `Assoc ([("0",
                                                            `Assoc ([("name",
                                                                    `String (
                                                                    "punctuation.definition.comment.begin.dune"))
                                                                    ]))
                                                            ]));
                                                 ("end", `String ("\\|#"));
                                                 ("endCaptures",
                                                  `Assoc ([("0",
                                                            `Assoc ([("name",
                                                                    `String (
                                                                    "punctuation.definition.comment.end.dune"))
                                                                    ]))
                                                            ]));
                                                 ("patterns",
                                                  `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#comments"))
                                                                    ])
                                                           ]))
                                                 ]);
                                        `Assoc ([("name",
                                                  `String ("comment.sexp.dune"));
                                                  ("begin",
                                                   `String ("#;[[:space:]]*\\("));
                                                  ("end", `String ("\\)"));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#comment-inner"))
                                                                    ])
                                                            ]))
                                                  ]);
                                        `Assoc ([("name",
                                                  `String ("comment.line.dune"));
                                                  ("match", `String (";.*$"))
                                                  ])
                                        ]))
                               ]));
                     ("comment-inner",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("name",
                                                  `String ("comment.sexp.inner.dune"));
                                                  ("begin", `String ("\\("));
                                                  ("end", `String ("\\)"));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#comment-inner"))
                                                                    ])
                                                            ]))
                                                  ])
                                         ]))
                                ]));
                     ("string",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("name",
                                                  `String ("string.quoted.double.dune"));
                                                  ("begin",
                                                   `String ("(?=[^\\\\])(\")"));
                                                  ("beginCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.string.begin.dune"))
                                                               ]))
                                                             ]));
                                                  ("end", `String ("(\")"));
                                                  ("endCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.string.end.dune"))
                                                               ]))
                                                             ]));
                                                  ("patterns",
                                                   `List ([`Assoc ([("name",
                                                                    `String (
                                                                    "constant.character.string.escape.dune"));
                                                                    ("match",
                                                                    `String (
                                                                    "\\\\\""))
                                                                    ]);
                                                            `Assoc ([("include",
                                                                    `String (
                                                                    "#variable"))
                                                                    ])
                                                            ]))
                                                  ])
                                         ]))
                                ]));
                     ("variable",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("name",
                                                  `String ("variable.other.dune"));
                                                  ("match",
                                                   `String ("\\${[^}]*}"))
                                                  ])
                                         ]))
                                ]));
                     ("list",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("name",
                                                  `String ("meta.list.dune"));
                                                  ("begin", `String ("(\\()"));
                                                  ("end", `String ("(\\))"));
                                                  ("captures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "entity.tag.list.parenthesis.dune"))
                                                               ]))
                                                             ]));
                                                  ("comment",
                                                   `String ("ok, for this one, I didn't know what to choose"));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                            ]))
                                                  ])
                                         ]))
                                ]));
                     ("atom",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("name",
                                                  `String ("meta.atom.dune"));
                                                  ("match",
                                                   `String ("\\b[^[[:space:]]]+\\b"))
                                                  ])
                                         ]))
                                ]))
                     ]))
          ])


let shell =
`Assoc ([("fileTypes",
          `List ([`String ("sh"); `String ("bash"); `String ("zsh");
                   `String ("bashrc"); `String ("bash_profile");
                   `String ("bash_login"); `String ("profile");
                   `String ("bash_logout"); `String (".textmate_init")]));
          ("firstLineMatch",
           `String ("^#!.*\\b(bash|zsh|sh|tcsh)|^#.*-\\*-.*\\bshell-script\\b.*-\\*-"));
          ("repository",
           `Assoc ([("keyword",
                     `Assoc ([("patterns",
                               `List ([`Assoc ([("match",
                                                 `String ("(?<=^|;|&|\\s)(?:if|then|else|elif|fi|for|in|do|done|select|case|continue|esac|while|until|return|coproc)(?=\\s|;|&|$)"));
                                                 ("name",
                                                  `String ("keyword.control.shell"))
                                                 ]);
                                        `Assoc ([("match",
                                                  `String ("(?<=^|;|&|\\s)(?:export|declare|typeset|local|readonly)(?=\\s|;|&|$)"));
                                                  ("name",
                                                   `String ("storage.modifier.shell"))
                                                  ])
                                        ]))
                               ]));
                     ("function-definition",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("begin",
                                                  `String ("(?<=^|;|&)\\s*(function)\\s+([^\\s<>;'\"\\\\|$&()]+)(?:\\s*(\\(\\)))?"));
                                                  ("endCaptures",
                                                   `Assoc ([("0",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.function.shell"))
                                                               ]))
                                                             ]));
                                                  ("end", `String (";|&|\\n"));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                            ]));
                                                  ("name",
                                                   `String ("meta.function.shell"));
                                                  ("beginCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "storage.type.function.shell"))
                                                               ]));
                                                             ("2",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "entity.name.function.shell"))
                                                                ]));
                                                             ("3",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.arguments.shell"))
                                                                ]))
                                                             ]))
                                                  ]);
                                         `Assoc ([("begin",
                                                   `String ("(?<=^|;|&)\\s*([^\\s<>;'\"\\\\|$&()]+)\\s*(\\(\\))"));
                                                   ("endCaptures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.function.shell"))
                                                                ]))
                                                              ]));
                                                   ("end",
                                                    `String (";|&|\\n"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                             ]));
                                                   ("name",
                                                    `String ("meta.function.shell"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "entity.name.function.shell"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.arguments.shell"))
                                                                 ]))
                                                              ]))
                                                   ])
                                         ]))
                                ]));
                     ("herestring",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("match",
                                                  `String ("(<<<)\\s*((')[^']*('))"));
                                                  ("name",
                                                   `String ("meta.herestring.shell"));
                                                  ("captures",
                                                   `Assoc ([("3",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.string.begin.shell"))
                                                               ]));
                                                             ("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.operator.herestring.shell"))
                                                                ]));
                                                             ("4",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.shell"))
                                                                ]));
                                                             ("2",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "string.quoted.single.herestring.shell"))
                                                                ]))
                                                             ]))
                                                  ]);
                                         `Assoc ([("match",
                                                   `String ("(<<<)\\s*((\")(\\\\(\"|\\\\)|[^\"])*(\"))"));
                                                   ("name",
                                                    `String ("meta.herestring.shell"));
                                                   ("captures",
                                                    `Assoc ([("3",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.begin.shell"))
                                                                ]));
                                                              ("1",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.operator.herestring.shell"))
                                                                 ]));
                                                              ("6",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.end.shell"))
                                                                 ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "string.quoted.double.herestring.shell"))
                                                                 ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("match",
                                                   `String ("(<<<)\\s*(([^\\s\\\\]|\\\\.)+)"));
                                                   ("name",
                                                    `String ("meta.herestring.shell"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.operator.herestring.shell"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "string.unquoted.herestring.shell"))
                                                                 ]))
                                                              ]))
                                                   ])
                                         ]))
                                ]));
                     ("pathname",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("match",
                                                  `String ("(?<=\\s|:|=|^)~"));
                                                  ("name",
                                                   `String ("keyword.operator.tilde.shell"))
                                                  ]);
                                         `Assoc ([("match",
                                                   `String ("\\*|\\?"));
                                                   ("name",
                                                    `String ("keyword.operator.glob.shell"))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("([?*+@!])(\\()"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.extglob.shell"))
                                                                ]))
                                                              ]));
                                                   ("end", `String ("(\\))"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                             ]));
                                                   ("name",
                                                    `String ("meta.structure.extglob.shell"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.operator.extglob.shell"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.extglob.shell"))
                                                                 ]))
                                                              ]))
                                                   ])
                                         ]))
                                ]));
                     ("pipeline",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("match",
                                                  `String ("(?<=^|;|&|\\s)(time)(?=\\s|;|&|$)"));
                                                  ("name",
                                                   `String ("keyword.other.shell"))
                                                  ]);
                                         `Assoc ([("match", `String ("[|!]"));
                                                   ("name",
                                                    `String ("keyword.operator.pipe.shell"))
                                                   ])
                                         ]))
                                ]));
                     ("compound-command",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("begin",
                                                  `String ("(\\[{2})"));
                                                  ("end",
                                                   `String ("(\\]{2})"));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#logical-expression"))
                                                                    ]);
                                                            `Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                            ]));
                                                  ("name",
                                                   `String ("meta.scope.logical-expression.shell"));
                                                  ("captures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.logical-expression.shell"))
                                                               ]))
                                                             ]))
                                                  ]);
                                         `Assoc ([("begin",
                                                   `String ("(\\({2})"));
                                                   ("endCaptures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.shell"))
                                                                ]))
                                                              ]));
                                                   ("end",
                                                    `String ("(\\){2})"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#math"))
                                                                    ])
                                                             ]));
                                                   ("name",
                                                    `String ("string.other.math.shell"));
                                                   ("beginCaptures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.begin.shell"))
                                                                ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("begin", `String ("(\\()"));
                                                   ("end", `String ("(\\))"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                             ]));
                                                   ("name",
                                                    `String ("meta.scope.subshell.shell"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.subshell.shell"))
                                                                ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("(?<=\\s|^)(\\{)(?=\\s|$)"));
                                                   ("end",
                                                    `String ("(?<=^|;)\\s*(\\})"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                             ]));
                                                   ("name",
                                                    `String ("meta.scope.group.shell"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.group.shell"))
                                                                ]))
                                                              ]))
                                                   ])
                                         ]))
                                ]));
                     ("lines",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("match",
                                                  `String ("\\\\\\n"));
                                                  ("name",
                                                   `String ("constant.character.escape.newline.shell"))
                                                  ])
                                         ]))
                                ]));
                     ("heredoc",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("end",
                                                  `String ("^\\t*(RUBY)(?=\\s|;|&|$)"));
                                                  ("begin",
                                                   `String ("(<<)-\\s*(\"|'|)(RUBY)\\2"));
                                                  ("beginCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "keyword.operator.heredoc.shell"))
                                                               ]));
                                                             ("3",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.control.heredoc-token.shell"))
                                                                ]))
                                                             ]));
                                                  ("contentName",
                                                   `String ("source.ruby.embedded.shell"));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "source.ruby"))
                                                                    ])
                                                            ]));
                                                  ("captures",
                                                   `Assoc ([("0",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.string.shell"))
                                                               ]))
                                                             ]));
                                                  ("endCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "keyword.control.heredoc-token.shell"))
                                                               ]))
                                                             ]));
                                                  ("name",
                                                   `String ("string.unquoted.heredoc.no-indent.ruby.shell"))
                                                  ]);
                                         `Assoc ([("end",
                                                   `String ("^(RUBY)(?=\\s|;|&|$)"));
                                                   ("begin",
                                                    `String ("(<<)\\s*(\"|'|)(RUBY)\\2"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.operator.heredoc.shell"))
                                                                ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.control.heredoc-token.shell"))
                                                                 ]))
                                                              ]));
                                                   ("contentName",
                                                    `String ("source.ruby.embedded.shell"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "source.ruby"))
                                                                    ])
                                                             ]));
                                                   ("captures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.shell"))
                                                                ]))
                                                              ]));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.control.heredoc-token.shell"))
                                                                ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.unquoted.heredoc.ruby.shell"))
                                                   ]);
                                         `Assoc ([("end",
                                                   `String ("^\\t*(PYTHON)(?=\\s|;|&|$)"));
                                                   ("begin",
                                                    `String ("(<<)-\\s*(\"|'|)(PYTHON)\\2"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.operator.heredoc.shell"))
                                                                ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.control.heredoc-token.shell"))
                                                                 ]))
                                                              ]));
                                                   ("contentName",
                                                    `String ("source.python.embedded.shell"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "source.python"))
                                                                    ])
                                                             ]));
                                                   ("captures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.shell"))
                                                                ]))
                                                              ]));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.control.heredoc-token.shell"))
                                                                ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.unquoted.heredoc.no-indent.python.shell"))
                                                   ]);
                                         `Assoc ([("end",
                                                   `String ("^(PYTHON)(?=\\s|;|&|$)"));
                                                   ("begin",
                                                    `String ("(<<)\\s*(\"|'|)(PYTHON)\\2"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.operator.heredoc.shell"))
                                                                ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.control.heredoc-token.shell"))
                                                                 ]))
                                                              ]));
                                                   ("contentName",
                                                    `String ("source.python.embedded.shell"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "source.python"))
                                                                    ])
                                                             ]));
                                                   ("captures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.shell"))
                                                                ]))
                                                              ]));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.control.heredoc-token.shell"))
                                                                ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.unquoted.heredoc.python.shell"))
                                                   ]);
                                         `Assoc ([("end",
                                                   `String ("^\\t*(APPLESCRIPT)(?=\\s|;|&|$)"));
                                                   ("begin",
                                                    `String ("(<<)-\\s*(\"|'|)(APPLESCRIPT)\\2"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.operator.heredoc.shell"))
                                                                ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.control.heredoc-token.shell"))
                                                                 ]))
                                                              ]));
                                                   ("contentName",
                                                    `String ("source.applescript.embedded.shell"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "source.applescript"))
                                                                    ])
                                                             ]));
                                                   ("captures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.shell"))
                                                                ]))
                                                              ]));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.control.heredoc-token.shell"))
                                                                ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.unquoted.heredoc.no-indent.applescript.shell"))
                                                   ]);
                                         `Assoc ([("end",
                                                   `String ("^(APPLESCRIPT)(?=\\s|;|&|$)"));
                                                   ("begin",
                                                    `String ("(<<)\\s*(\"|'|)(APPLESCRIPT)\\2"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.operator.heredoc.shell"))
                                                                ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.control.heredoc-token.shell"))
                                                                 ]))
                                                              ]));
                                                   ("contentName",
                                                    `String ("source.applescript.embedded.shell"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "source.applescript"))
                                                                    ])
                                                             ]));
                                                   ("captures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.shell"))
                                                                ]))
                                                              ]));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.control.heredoc-token.shell"))
                                                                ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.unquoted.heredoc.applescript.shell"))
                                                   ]);
                                         `Assoc ([("end",
                                                   `String ("^\\t*(HTML)(?=\\s|;|&|$)"));
                                                   ("begin",
                                                    `String ("(<<)-\\s*(\"|'|)(HTML)\\2"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.operator.heredoc.shell"))
                                                                ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.control.heredoc-token.shell"))
                                                                 ]))
                                                              ]));
                                                   ("contentName",
                                                    `String ("text.html.embedded.shell"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "text.html.basic"))
                                                                    ])
                                                             ]));
                                                   ("captures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.shell"))
                                                                ]))
                                                              ]));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.control.heredoc-token.shell"))
                                                                ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.unquoted.heredoc.no-indent.html.shell"))
                                                   ]);
                                         `Assoc ([("end",
                                                   `String ("^(HTML)(?=\\s|;|&|$)"));
                                                   ("begin",
                                                    `String ("(<<)\\s*(\"|'|)(HTML)\\2"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.operator.heredoc.shell"))
                                                                ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.control.heredoc-token.shell"))
                                                                 ]))
                                                              ]));
                                                   ("contentName",
                                                    `String ("text.html.embedded.shell"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "text.html.basic"))
                                                                    ])
                                                             ]));
                                                   ("captures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.shell"))
                                                                ]))
                                                              ]));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.control.heredoc-token.shell"))
                                                                ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.unquoted.heredoc.html.shell"))
                                                   ]);
                                         `Assoc ([("end",
                                                   `String ("^\\t*(MARKDOWN)(?=\\s|;|&|$)"));
                                                   ("begin",
                                                    `String ("(<<)-\\s*(\"|'|)(MARKDOWN)\\2"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.operator.heredoc.shell"))
                                                                ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.control.heredoc-token.shell"))
                                                                 ]))
                                                              ]));
                                                   ("contentName",
                                                    `String ("text.html.markdown.embedded.shell"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "text.html.markdown"))
                                                                    ])
                                                             ]));
                                                   ("captures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.shell"))
                                                                ]))
                                                              ]));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.control.heredoc-token.shell"))
                                                                ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.unquoted.heredoc.no-indent.markdown.shell"))
                                                   ]);
                                         `Assoc ([("end",
                                                   `String ("^(MARKDOWN)(?=\\s|;|&|$)"));
                                                   ("begin",
                                                    `String ("(<<)\\s*(\"|'|)(MARKDOWN)\\2"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.operator.heredoc.shell"))
                                                                ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.control.heredoc-token.shell"))
                                                                 ]))
                                                              ]));
                                                   ("contentName",
                                                    `String ("text.html.markdown.embedded.shell"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "text.html.markdown"))
                                                                    ])
                                                             ]));
                                                   ("captures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.shell"))
                                                                ]))
                                                              ]));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.control.heredoc-token.shell"))
                                                                ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.unquoted.heredoc.markdown.shell"))
                                                   ]);
                                         `Assoc ([("end",
                                                   `String ("^\\t*(TEXTILE)(?=\\s|;|&|$)"));
                                                   ("begin",
                                                    `String ("(<<)-\\s*(\"|'|)(TEXTILE)\\2"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.operator.heredoc.shell"))
                                                                ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.control.heredoc-token.shell"))
                                                                 ]))
                                                              ]));
                                                   ("contentName",
                                                    `String ("text.html.textile.embedded.shell"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "text.html.textile"))
                                                                    ])
                                                             ]));
                                                   ("captures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.shell"))
                                                                ]))
                                                              ]));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.control.heredoc-token.shell"))
                                                                ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.unquoted.heredoc.no-indent.textile.shell"))
                                                   ]);
                                         `Assoc ([("end",
                                                   `String ("^(TEXTILE)(?=\\s|;|&|$)"));
                                                   ("begin",
                                                    `String ("(<<)\\s*(\"|'|)(TEXTILE)\\2"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.operator.heredoc.shell"))
                                                                ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.control.heredoc-token.shell"))
                                                                 ]))
                                                              ]));
                                                   ("contentName",
                                                    `String ("text.html.textile.embedded.shell"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "text.html.textile"))
                                                                    ])
                                                             ]));
                                                   ("captures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.shell"))
                                                                ]))
                                                              ]));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.control.heredoc-token.shell"))
                                                                ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.unquoted.heredoc.textile.shell"))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("(<<)-\\s*(\"|'|)\\\\?(\\w+)\\2"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.control.heredoc-token.shell"))
                                                                ]))
                                                              ]));
                                                   ("end",
                                                    `String ("^\\t*(\\3)(?=\\s|;|&|$)"));
                                                   ("name",
                                                    `String ("string.unquoted.heredoc.no-indent.shell"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.operator.heredoc.shell"))
                                                                ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.control.heredoc-token.shell"))
                                                                 ]))
                                                              ]));
                                                   ("captures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.shell"))
                                                                ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("(<<)\\s*(\"|'|)\\\\?(\\w+)\\2"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.control.heredoc-token.shell"))
                                                                ]))
                                                              ]));
                                                   ("end",
                                                    `String ("^(\\3)(?=\\s|;|&|$)"));
                                                   ("name",
                                                    `String ("string.unquoted.heredoc.shell"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.operator.heredoc.shell"))
                                                                ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.control.heredoc-token.shell"))
                                                                 ]))
                                                              ]));
                                                   ("captures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.shell"))
                                                                ]))
                                                              ]))
                                                   ])
                                         ]))
                                ]));
                     ("string",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("match", `String ("\\\\."));
                                                  ("name",
                                                   `String ("constant.character.escape.shell"))
                                                  ]);
                                         `Assoc ([("begin", `String ("'"));
                                                   ("endCaptures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.shell"))
                                                                ]))
                                                              ]));
                                                   ("end", `String ("'"));
                                                   ("name",
                                                    `String ("string.quoted.single.shell"));
                                                   ("beginCaptures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.begin.shell"))
                                                                ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("\\$?\""));
                                                   ("endCaptures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.shell"))
                                                                ]))
                                                              ]));
                                                   ("end", `String ("\""));
                                                   ("patterns",
                                                    `List ([`Assoc ([("match",
                                                                    `String (
                                                                    "\\\\[\\$`\"\\\\\\n]"));
                                                                    ("name",
                                                                    `String (
                                                                    "constant.character.escape.shell"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#variable"))]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#interpolation"))
                                                               ])
                                                             ]));
                                                   ("name",
                                                    `String ("string.quoted.double.shell"));
                                                   ("beginCaptures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.begin.shell"))
                                                                ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("begin", `String ("\\$'"));
                                                   ("endCaptures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.shell"))
                                                                ]))
                                                              ]));
                                                   ("end", `String ("'"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("match",
                                                                    `String (
                                                                    "\\\\(a|b|e|f|n|r|t|v|\\\\|')"));
                                                                    ("name",
                                                                    `String (
                                                                    "constant.character.escape.ansi-c.shell"))
                                                                    ]);
                                                             `Assoc (
                                                             [("match",
                                                               `String (
                                                               "\\\\[0-9]{3}"));
                                                               ("name",
                                                                `String (
                                                                "constant.character.escape.octal.shell"))
                                                               ]);
                                                             `Assoc (
                                                             [("match",
                                                               `String (
                                                               "\\\\x[0-9a-fA-F]{2}"));
                                                               ("name",
                                                                `String (
                                                                "constant.character.escape.hex.shell"))
                                                               ]);
                                                             `Assoc (
                                                             [("match",
                                                               `String (
                                                               "\\\\c."));
                                                               ("name",
                                                                `String (
                                                                "constant.character.escape.control-char.shell"))
                                                               ])
                                                             ]));
                                                   ("name",
                                                    `String ("string.quoted.single.dollar.shell"));
                                                   ("beginCaptures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.begin.shell"))
                                                                ]))
                                                              ]))
                                                   ])
                                         ]))
                                ]));
                     ("logical-expression",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("comment",
                                                  `String ("do we want a special rule for ( expr )?"));
                                                  ("match",
                                                   `String ("=[=~]?|!=?|<|>|&&|\\|\\|"));
                                                  ("name",
                                                   `String ("keyword.operator.logical.shell"))
                                                  ]);
                                         `Assoc ([("match",
                                                   `String ("(?<!\\S)-(nt|ot|ef|eq|ne|l[te]|g[te]|[a-hknoprstuwxzOGLSN])"));
                                                   ("name",
                                                    `String ("keyword.operator.logical.shell"))
                                                   ])
                                         ]))
                                ]));
                     ("comment",
                      `Assoc ([("begin",
                                `String ("(^[ \\t]+)?(?<!\\S)(?=#)(?!#\\{)"));
                                ("end", `String ("(?!\\G)"));
                                ("patterns",
                                 `List ([`Assoc ([("begin", `String ("^(#!)"));
                                                   ("end", `String ("\\n"));
                                                   ("name",
                                                    `String ("comment.line.shebang.shell"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.comment.line.shebang.shell"))
                                                                ]))
                                                              ]))
                                                   ]);
                                          `Assoc ([("begin", `String ("#"));
                                                    ("end", `String ("\\n"));
                                                    ("name",
                                                     `String ("comment.line.number-sign.shell"));
                                                    ("beginCaptures",
                                                     `Assoc ([("0",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.comment.shell"))
                                                                 ]))
                                                               ]))
                                                    ])
                                          ]));
                                ("beginCaptures",
                                 `Assoc ([("1",
                                           `Assoc ([("name",
                                                     `String ("punctuation.whitespace.comment.leading.shell"))
                                                     ]))
                                           ]))
                                ]));
                     ("support",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("match",
                                                  `String ("(?<=^|;|&|\\s)(?::|\\.)(?=\\s|;|&|$)"));
                                                  ("name",
                                                   `String ("support.function.builtin.shell"))
                                                  ]);
                                         `Assoc ([("match",
                                                   `String ("(?<=^|;|&|\\s)(?:alias|bg|bind|break|builtin|caller|cd|command|compgen|complete|dirs|disown|echo|enable|eval|exec|exit|false|fc|fg|getopts|hash|help|history|jobs|kill|let|logout|mapfile|popd|printf|pushd|pwd|read(array)?|readonly|set|shift|shopt|source|suspend|test|times|trap|true|type|ulimit|umask|unalias|unset|wait)(?=\\s|;|&|$)"));
                                                   ("name",
                                                    `String ("support.function.builtin.shell"))
                                                   ])
                                         ]))
                                ]));
                     ("math",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("include",
                                                  `String ("#variable"))]);
                                         `Assoc ([("match",
                                                   `String ("\\+{1,2}|-{1,2}|!|~|\\*{1,2}|/|%|<[<=]?|>[>=]?|==|!=|\\^|\\|{1,2}|&{1,2}|\\?|\\:|,|=|[*/%+\\-&^|]=|<<=|>>="));
                                                   ("name",
                                                    `String ("keyword.operator.arithmetic.shell"))
                                                   ]);
                                         `Assoc ([("match",
                                                   `String ("0[xX]\\h+"));
                                                   ("name",
                                                    `String ("constant.numeric.hex.shell"))
                                                   ]);
                                         `Assoc ([("match", `String ("0\\d+"));
                                                   ("name",
                                                    `String ("constant.numeric.octal.shell"))
                                                   ]);
                                         `Assoc ([("match",
                                                   `String ("\\d{1,2}#[0-9a-zA-Z@_]+"));
                                                   ("name",
                                                    `String ("constant.numeric.other.shell"))
                                                   ]);
                                         `Assoc ([("match", `String ("\\d+"));
                                                   ("name",
                                                    `String ("constant.numeric.integer.shell"))
                                                   ])
                                         ]))
                                ]));
                     ("variable",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("match",
                                                  `String ("(\\$)[a-zA-Z_][a-zA-Z0-9_]*"));
                                                  ("name",
                                                   `String ("variable.other.normal.shell"));
                                                  ("captures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.variable.shell"))
                                                               ]))
                                                             ]))
                                                  ]);
                                         `Assoc ([("match",
                                                   `String ("(\\$)[-*@#?$!0_]"));
                                                   ("name",
                                                    `String ("variable.other.special.shell"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.variable.shell"))
                                                                ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("match",
                                                   `String ("(\\$)[1-9]"));
                                                   ("name",
                                                    `String ("variable.other.positional.shell"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.variable.shell"))
                                                                ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("\\$\\{"));
                                                   ("end", `String ("\\}"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("match",
                                                                    `String (
                                                                    "!|:[-=?+]?|\\*|@|#{1,2}|%{1,2}|/"));
                                                                    ("name",
                                                                    `String (
                                                                    "keyword.operator.expansion.shell"))
                                                                    ]);
                                                             `Assoc (
                                                             [("match",
                                                               `String (
                                                               "(\\[)([^\\]]+)(\\])"));
                                                               ("captures",
                                                                `Assoc (
                                                                [("1",
                                                                  `Assoc (
                                                                  [("name",
                                                                    `String (
                                                                    "punctuation.section.array.shell"))
                                                                    ]));
                                                                  ("3",
                                                                   `Assoc (
                                                                   [("name",
                                                                    `String (
                                                                    "punctuation.section.array.shell"))
                                                                    ]))
                                                                  ]))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#string"))]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#variable"))]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#interpolation"))
                                                               ])
                                                             ]));
                                                   ("name",
                                                    `String ("variable.other.bracket.shell"));
                                                   ("captures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.variable.shell"))
                                                                ]))
                                                              ]))
                                                   ])
                                         ]))
                                ]));
                     ("list",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("match",
                                                  `String (";|&&|&|\\|\\|"));
                                                  ("name",
                                                   `String ("keyword.operator.list.shell"))
                                                  ])
                                         ]))
                                ]));
                     ("redirection",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("begin",
                                                  `String ("[><]\\("));
                                                  ("endCaptures",
                                                   `Assoc ([("0",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.string.end.shell"))
                                                               ]))
                                                             ]));
                                                  ("end", `String ("\\)"));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                            ]));
                                                  ("name",
                                                   `String ("string.interpolated.process-substitution.shell"));
                                                  ("beginCaptures",
                                                   `Assoc ([("0",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.string.begin.shell"))
                                                               ]))
                                                             ]))
                                                  ]);
                                         `Assoc ([("comment",
                                                   `String ("valid: &>word >&word >word [n]>&[n] [n]<word [n]>word [n]>>word [n]<&word (last one is duplicate)"));
                                                   ("match",
                                                    `String ("&>|\\d*>&\\d*|\\d*(>>|>|<)|\\d*<&|\\d*<>"));
                                                   ("name",
                                                    `String ("keyword.operator.redirect.shell"))
                                                   ])
                                         ]))
                                ]));
                     ("interpolation",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("begin",
                                                  `String ("\\$\\({2}"));
                                                  ("endCaptures",
                                                   `Assoc ([("0",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.string.end.shell"))
                                                               ]))
                                                             ]));
                                                  ("end", `String ("\\){2}"));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#math"))
                                                                    ])
                                                            ]));
                                                  ("name",
                                                   `String ("string.other.math.shell"));
                                                  ("beginCaptures",
                                                   `Assoc ([("0",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.string.begin.shell"))
                                                               ]))
                                                             ]))
                                                  ]);
                                         `Assoc ([("begin", `String ("`"));
                                                   ("endCaptures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.shell"))
                                                                ]))
                                                              ]));
                                                   ("end", `String ("`"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("match",
                                                                    `String (
                                                                    "\\\\[`\\\\$]"));
                                                                    ("name",
                                                                    `String (
                                                                    "constant.character.escape.shell"))
                                                                    ]);
                                                             `Assoc (
                                                             [("begin",
                                                               `String (
                                                               "(?<=^|;|&|\\s|`)(#)(?!\\{)"));
                                                               ("end",
                                                                `String (
                                                                "(?=`)|\\n"));
                                                               ("name",
                                                                `String (
                                                                "comment.line.number-sign.shell"));
                                                               ("beginCaptures",
                                                                `Assoc (
                                                                [("1",
                                                                  `Assoc (
                                                                  [("name",
                                                                    `String (
                                                                    "punctuation.definition.comment.shell"))
                                                                    ]))
                                                                  ]))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "$self"))])
                                                             ]));
                                                   ("name",
                                                    `String ("string.interpolated.backtick.shell"));
                                                   ("beginCaptures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.begin.shell"))
                                                                ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("\\$\\("));
                                                   ("endCaptures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.shell"))
                                                                ]))
                                                              ]));
                                                   ("end", `String ("\\)"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("begin",
                                                                    `String (
                                                                    "(?<=^|;|&|\\s|\\()(#)(?!\\{)"));
                                                                    ("end",
                                                                    `String (
                                                                    "(?=\\))|\\n"));
                                                                    ("name",
                                                                    `String (
                                                                    "comment.line.number-sign.shell"));
                                                                    ("beginCaptures",
                                                                    `Assoc (
                                                                    [("1",
                                                                    `Assoc (
                                                                    [("name",
                                                                    `String (
                                                                    "punctuation.definition.comment.shell"))
                                                                    ]))]))]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "$self"))])
                                                             ]));
                                                   ("name",
                                                    `String ("string.interpolated.dollar.shell"));
                                                   ("beginCaptures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.begin.shell"))
                                                                ]))
                                                              ]))
                                                   ])
                                         ]))
                                ]));
                     ("loop",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("begin",
                                                  `String ("(?<=^|;|&|\\s)(for)\\s+(?=\\({2})"));
                                                  ("end",
                                                   `String ("(?<=^|;|&|\\s)(done)(?=\\s|;|&|$|\\))"));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                            ]));
                                                  ("name",
                                                   `String ("meta.scope.for-loop.shell"));
                                                  ("captures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "keyword.control.shell"))
                                                               ]))
                                                             ]))
                                                  ]);
                                         `Assoc ([("begin",
                                                   `String ("(?<=^|;|&|\\s)(for)\\s+([^\\s\\\\]+)(?=\\s|;|&|$)"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.control.shell"))
                                                                ]))
                                                              ]));
                                                   ("end",
                                                    `String ("(?<=^|;|&|\\s)(done)(?=\\s|;|&|$|\\))"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                             ]));
                                                   ("name",
                                                    `String ("meta.scope.for-in-loop.shell"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.control.shell"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "variable.other.loop.shell"))
                                                                 ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("(?<=^|;|&|\\s)(while|until)(?=\\s|;|&|$)"));
                                                   ("end",
                                                    `String ("(?<=^|;|&|\\s)(done)(?=\\s|;|&|$|\\))"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                             ]));
                                                   ("name",
                                                    `String ("meta.scope.while-loop.shell"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.control.shell"))
                                                                ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("(?<=^|;|&|\\s)(select)\\s+([^\\s\\\\]+)(?=\\s|;|&|$)"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.control.shell"))
                                                                ]))
                                                              ]));
                                                   ("end",
                                                    `String ("(?<=^|;|&|\\s)(done)(?=\\s|;|&|$|\\))"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                             ]));
                                                   ("name",
                                                    `String ("meta.scope.select-block.shell"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.control.shell"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "variable.other.loop.shell"))
                                                                 ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("(?<=^|;|&|\\s)(case)(?=\\s|;|&|$)"));
                                                   ("end",
                                                    `String ("(?<=^|;|&|\\s)(esac)(?=\\s|;|&|$|\\))"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("begin",
                                                                    `String (
                                                                    "(?<=^|;|&|\\s)(?:in)(?=\\s|;|&|$)"));
                                                                    ("end",
                                                                    `String (
                                                                    "(?<=^|;|&|\\s)(?=(?:esac)(?:\\s|;|&|$|\\)))"));
                                                                    ("patterns",
                                                                    `List (
                                                                    [`Assoc (
                                                                    [("include",
                                                                    `String (
                                                                    "#comment"))
                                                                    ]);
                                                                    `Assoc (
                                                                    [("include",
                                                                    `String (
                                                                    "#case-clause"))
                                                                    ]);
                                                                    `Assoc (
                                                                    [("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])]));
                                                                    ("name",
                                                                    `String (
                                                                    "meta.scope.case-body.shell"));
                                                                    ("beginCaptures",
                                                                    `Assoc (
                                                                    [("1",
                                                                    `Assoc (
                                                                    [("name",
                                                                    `String (
                                                                    "keyword.control.shell"))
                                                                    ]))]))]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "$self"))])
                                                             ]));
                                                   ("name",
                                                    `String ("meta.scope.case-block.shell"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.control.shell"))
                                                                ]))
                                                              ]))
                                                   ]);
                                         `Assoc ([("end",
                                                   `String ("(?<=^|;|&|\\s)(fi)(?=\\s|;|&|$|\\))"));
                                                   ("begin",
                                                    `String ("(^|(?<=[&;|]))\\s*(if)(?=\\s|;|&|$)"));
                                                   ("beginCaptures",
                                                    `Assoc ([("2",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.control.shell"))
                                                                ]))
                                                              ]));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                             ]));
                                                   ("comment",
                                                    `String ("Restrict match to avoid matching in lines like `dd if=/dev/sda1 \226\128\166`"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.control.shell"))
                                                                ]))
                                                              ]));
                                                   ("name",
                                                    `String ("meta.scope.if-block.shell"))
                                                   ])
                                         ]))
                                ]));
                     ("case-clause",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("begin",
                                                  `String ("(?=\\S)"));
                                                  ("endCaptures",
                                                   `Assoc ([("0",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.terminator.case-clause.shell"))
                                                               ]))
                                                             ]));
                                                  ("end", `String (";;"));
                                                  ("patterns",
                                                   `List ([`Assoc ([("begin",
                                                                    `String (
                                                                    "(\\(|(?=\\S))"));
                                                                    ("end",
                                                                    `String (
                                                                    "\\)"));
                                                                    ("patterns",
                                                                    `List (
                                                                    [`Assoc (
                                                                    [("match",
                                                                    `String (
                                                                    "\\|"));
                                                                    ("name",
                                                                    `String (
                                                                    "punctuation.separator.pipe-sign.shell"))
                                                                    ]);
                                                                    `Assoc (
                                                                    [("include",
                                                                    `String (
                                                                    "#string"))
                                                                    ]);
                                                                    `Assoc (
                                                                    [("include",
                                                                    `String (
                                                                    "#variable"))
                                                                    ]);
                                                                    `Assoc (
                                                                    [("include",
                                                                    `String (
                                                                    "#interpolation"))
                                                                    ]);
                                                                    `Assoc (
                                                                    [("include",
                                                                    `String (
                                                                    "#pathname"))
                                                                    ])]));
                                                                    ("name",
                                                                    `String (
                                                                    "meta.scope.case-pattern.shell"));
                                                                    ("captures",
                                                                    `Assoc (
                                                                    [("0",
                                                                    `Assoc (
                                                                    [("name",
                                                                    `String (
                                                                    "punctuation.definition.case-pattern.shell"))
                                                                    ]))]))]);
                                                            `Assoc ([("begin",
                                                                    `String (
                                                                    "(?<=\\))"));
                                                                    ("end",
                                                                    `String (
                                                                    "(?=;;)"));
                                                                    ("patterns",
                                                                    `List (
                                                                    [`Assoc (
                                                                    [("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])]));
                                                                    ("name",
                                                                    `String (
                                                                    "meta.scope.case-clause-body.shell"))
                                                                    ])
                                                            ]));
                                                  ("name",
                                                   `String ("meta.scope.case-clause.shell"))
                                                  ])
                                         ]))
                                ]))
                     ]));
          ("keyEquivalent", `String ("^~S"));
          ("uuid", `String ("DDEEA3ED-6B1C-11D9-8B10-000D93589AF6"));
          ("patterns",
           `List ([`Assoc ([("include", `String ("#comment"))]);
                    `Assoc ([("include", `String ("#pipeline"))]);
                    `Assoc ([("include", `String ("#list"))]);
                    `Assoc ([("include", `String ("#compound-command"))]);
                    `Assoc ([("include", `String ("#loop"))]);
                    `Assoc ([("include", `String ("#string"))]);
                    `Assoc ([("include", `String ("#function-definition"))]);
                    `Assoc ([("include", `String ("#variable"))]);
                    `Assoc ([("include", `String ("#interpolation"))]);
                    `Assoc ([("include", `String ("#heredoc"))]);
                    `Assoc ([("include", `String ("#herestring"))]);
                    `Assoc ([("include", `String ("#redirection"))]);
                    `Assoc ([("include", `String ("#pathname"))]);
                    `Assoc ([("include", `String ("#keyword"))]);
                    `Assoc ([("include", `String ("#support"))]);
                    `Assoc ([("include", `String ("#lines"))])]));
          ("scopeName", `String ("source.shell"))])


let opam =
`Assoc ([("name", `String ("opam"));
          ("scopeName", `String ("source.ocaml.opam"));
          ("fileTypes", `List ([`String ("opam")]));
          ("patterns",
           `List ([`Assoc ([("include", `String ("#comments"))]);
                    `Assoc ([("include", `String ("#fields"))]);
                    `Assoc ([("include", `String ("#values"))])]));
          ("repository",
           `Assoc ([("comments",
                     `Assoc ([("patterns",
                               `List ([`Assoc ([("comment",
                                                 `String ("block comment"));
                                                 ("name",
                                                  `String ("comment.block.opam"));
                                                 ("begin", `String ("\\(\\*"));
                                                 ("end", `String ("\\*\\)"))]);
                                        `Assoc ([("comment",
                                                  `String ("line comment"));
                                                  ("name",
                                                   `String ("comment.line.opam"));
                                                  ("begin", `String ("#"));
                                                  ("end", `String ("$"))])
                                        ]))
                               ]));
                     ("fields",
                      `Assoc ([("comment", `String ("labeled field"));
                                ("match",
                                 `String ("^([[:word:]-]*[[:alpha:]][[:word:]-]*)(:)"));
                                ("captures",
                                 `Assoc ([("1",
                                           `Assoc ([("name",
                                                     `String ("entity.name.tag.opam"))
                                                     ]));
                                           ("2",
                                            `Assoc ([("name",
                                                      `String ("keyword.operator.opam"))
                                                      ]))
                                           ]))
                                ]));
                     ("values",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("comment",
                                                  `String ("boolean literal"));
                                                  ("name",
                                                   `String ("constant.language.opam"));
                                                  ("match",
                                                   `String ("\\b(true|false)\\b"))
                                                  ]);
                                         `Assoc ([("comment",
                                                   `String ("integer literal"));
                                                   ("name",
                                                    `String ("constant.numeric.decimal.opam"));
                                                   ("match",
                                                    `String ("(\\b|\\-?)[[:digit:]]+\\b"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("double-quote string literal"));
                                                   ("name",
                                                    `String ("string.quoted.double.opam"));
                                                   ("begin", `String ("\""));
                                                   ("end", `String ("\""));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#string-elements"))
                                                                    ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("triple-double-quote string literal"));
                                                   ("name",
                                                    `String ("string.quoted.triple-double.opam"));
                                                   ("begin",
                                                    `String ("\"\"\""));
                                                   ("end", `String ("\"\"\""));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#string-elements"))
                                                                    ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("operator"));
                                                   ("name",
                                                    `String ("keyword.operator.opam"));
                                                   ("match",
                                                    `String ("[!=<>\\|&?:]+"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("identifier"));
                                                   ("match",
                                                    `String ("\\b([[:word:]+-]+)\\b"));
                                                   ("name",
                                                    `String ("variable.parameter.opam"))
                                                   ])
                                         ]))
                                ]));
                     ("string-elements",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("comment",
                                                  `String ("escaped backslash"));
                                                  ("name",
                                                   `String ("constant.character.escape.opam"));
                                                  ("match",
                                                   `String ("\\\\\\\\"))
                                                  ]);
                                         `Assoc ([("comment",
                                                   `String ("escaped quote or whitespace"));
                                                   ("name",
                                                    `String ("constant.character.escape.opam"));
                                                   ("match",
                                                    `String ("\\\\[\"ntbr\\n]"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("character from decimal ASCII code"));
                                                   ("name",
                                                    `String ("constant.character.escape.opam"));
                                                   ("match",
                                                    `String ("\\\\[[:digit:]]{3}"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("character from hexadecimal ASCII code"));
                                                   ("name",
                                                    `String ("constant.character.escape.opam"));
                                                   ("match",
                                                    `String ("\\\\x[[:xdigit:]]{2}"))
                                                   ]);
                                         `Assoc ([("comment",
                                                   `String ("variable interpolation"));
                                                   ("name",
                                                    `String ("constant.variable.opam"));
                                                   ("begin", `String ("%\\{"));
                                                   ("end", `String ("}\\%"))]);
                                         `Assoc ([("comment",
                                                   `String ("unknown escape sequence"));
                                                   ("name",
                                                    `String ("invalid.illegal.unknown-escape.opam"));
                                                   ("match",
                                                    `String ("\\\\."))
                                                   ])
                                         ]))
                                ]))
                     ]))
          ])


let python =
`Assoc ([("author", `String ("Matt Morrison @MattDMo mattdmo@pigimal.com"));
          ("bundleUUID", `String ("EB590797-FBEE-4BEA-A140-8339AFD2CE1B"));
          ("comment",
           `String ("To make PythonImproved your default Python syntax, open a .py file and select View|Syntax|Open all with current extension as...|PythonImproved."));
          ("fileTypes",
           `List ([`String ("py"); `String ("py3"); `String ("rpy");
                    `String ("pyw"); `String ("cpy"); `String ("SConstruct");
                    `String ("Sconstruct"); `String ("sconstruct");
                    `String ("SConscript")]));
          ("firstLineMatch", `String ("^#!/.*\\bpython[0-9.-]*\\b"));
          ("foldingStartMarker",
           `String ("^\\s*(((?:async\\s+)?def)|class)\\s+([.[:alnum:]_ <]+)\\s*(\\((.*)\\))?\\s*:|\\{\\s*$|\\(\\s*$|\\[\\s*$|^\\s*\"\"\"(?=.)(?!.*\"\"\")"));
          ("foldingStopMarker",
           `String ("^\\s*$|^\\s*\\}|^\\s*\\]|^\\s*\\)|^\\s*\"\"\"\\s*$"));
          ("keyEquivalent", `String ("^~P")); ("name", `String ("python"));
          ("patterns",
           `List ([`Assoc ([("match",
                             `String ("(?<!^from\\s|^import\\s)(\\b\\.{3}\\b)"));
                             ("name",
                              `String ("support.type.ellipsis.python"))
                             ]);
                    `Assoc ([("captures",
                              `Assoc ([("2",
                                        `Assoc ([("name",
                                                  `String ("support.ipython.cell-number.python"))
                                                  ]))
                                        ]));
                              ("match", `String ("(^In \\[(\\d+)\\]\\:)"));
                              ("name", `String ("support.ipython.in.python"))
                              ]);
                    `Assoc ([("captures",
                              `Assoc ([("2",
                                        `Assoc ([("name",
                                                  `String ("support.ipython.cell-number.python"))
                                                  ]))
                                        ]));
                              ("match", `String ("(^Out\\[(\\d+)\\]\\:)"));
                              ("name", `String ("support.ipython.out.python"))
                              ]);
                    `Assoc ([("include", `String ("#comments"))]);
                    `Assoc ([("comment",
                              `String ("Match identifiers in ALL_CAPS as constants, except when followed by `.`, `(`, `'`, or `\"`."));
                              ("match",
                               `String ("\\b([[:upper:]_][[:upper:][:digit:]_]*)\\b(?![\\.\\(\\'\\\"])"));
                              ("name",
                               `String ("constant.other.allcaps.python"))
                              ]);
                    `Assoc ([("match", `String ("\\b(?i:(0x\\h+)L)"));
                              ("name",
                               `String ("constant.numeric.integer.hexadecimal.long.python"))
                              ]);
                    `Assoc ([("match", `String ("\\b(?i:(0x\\h+))"));
                              ("name",
                               `String ("constant.numeric.integer.hexadecimal.python"))
                              ]);
                    `Assoc ([("match", `String ("\\b(?i:(0b[01]+)L)"));
                              ("name",
                               `String ("constant.numeric.integer.binary.long.python"))
                              ]);
                    `Assoc ([("match", `String ("\\b(?i:(0b[01]+))"));
                              ("name",
                               `String ("constant.numeric.integer.binary.python"))
                              ]);
                    `Assoc ([("match", `String ("\\b(?i:(0[o]?[0-7]+)L)"));
                              ("name",
                               `String ("constant.numeric.integer.octal.long.python"))
                              ]);
                    `Assoc ([("match", `String ("\\b(?i:(0[o]?[0-7]+))"));
                              ("name",
                               `String ("constant.numeric.integer.octal.python"))
                              ]);
                    `Assoc ([("comment", `String ("Not quite perfect..."));
                              ("match",
                               `String ("\\b(?i:(((\\d+(\\.(?=[^[:alpha:]_])\\d*)?|(?<=[^[:alnum:]_])\\.\\d+)(e[\\-\\+]?\\d+)?))J)"));
                              ("name",
                               `String ("constant.numeric.complex.python"))
                              ]);
                    `Assoc ([("comment",
                              `String ("Ummm... why do we have three of these? This is one..."));
                              ("match",
                               `String ("\\b(?i:(\\d+\\.\\d*(e[\\-\\+]?\\d+)?))(?=[^[:alpha:]_])"));
                              ("name",
                               `String ("constant.numeric.float.python"))
                              ]);
                    `Assoc ([("comment", `String ("This is two..."));
                              ("match",
                               `String ("(?<=[^[:alnum:]_])(?i:(\\.\\d+(e[\\-\\+]?\\d+)?))"));
                              ("name",
                               `String ("constant.numeric.float.python"))
                              ]);
                    `Assoc ([("comment", `String ("And this is three..."));
                              ("match",
                               `String ("\\b(?i:(\\d+e[\\-\\+]?\\d+))"));
                              ("name",
                               `String ("constant.numeric.float.python"))
                              ]);
                    `Assoc ([("match", `String ("\\b(?i:([1-9]+[0-9]*|0)L)"));
                              ("name",
                               `String ("constant.numeric.integer.decimal.long.python"))
                              ]);
                    `Assoc ([("match", `String ("\\b([1-9]+[0-9]*|0)"));
                              ("name",
                               `String ("constant.numeric.integer.decimal.python"))
                              ]);
                    `Assoc ([("match",
                              `String ("\\b(None|True|False|Ellipsis|NotImplemented)\\b"));
                              ("name", `String ("constant.language.python"))]);
                    `Assoc ([("match", `String ("\\b(global|nonlocal)\\b"));
                              ("name",
                               `String ("storage.modifier.declaration.python"))
                              ]);
                    `Assoc ([("match", `String ("\\b(?:(import|from|as))\\b"));
                              ("name",
                               `String ("keyword.control.import.python"))
                              ]);
                    `Assoc ([("comment",
                              `String ("keyword operators that evaluate to True or False"));
                              ("match", `String ("\\b(and|in|is|not|or)\\b"));
                              ("name",
                               `String ("keyword.operator.logical.python"))
                              ]);
                    `Assoc ([("comment",
                              `String ("keywords that do not fit into other groups."));
                              ("match", `String ("\\b(assert|del)\\b"));
                              ("name", `String ("keyword.other.python"))]);
                    `Assoc ([("match", `String ("<>"));
                              ("name",
                               `String ("invalid.deprecated.operator.python"))
                              ]);
                    `Assoc ([("match",
                              `String ("(?<!\\.)(apply|buffer|coerce|intern)\\s*(?=\\()"));
                              ("name",
                               `String ("invalid.deprecated.function.python"))
                              ]);
                    `Assoc ([("match",
                              `String ("<\\=|>\\=|\\=\\=|<|>|\\!\\="));
                              ("name",
                               `String ("keyword.operator.comparison.python"))
                              ]);
                    `Assoc ([("match",
                              `String ("\\+\\=|-\\=|\\*\\=|/\\=|//\\=|%\\=|&\\=|\\|\\=|\\^\\=|>>\\=|<<\\=|\\*\\*\\=|@\\="));
                              ("name",
                               `String ("keyword.operator.assignment.augmented.python"))
                              ]);
                    `Assoc ([("match",
                              `String ("\\+|\\-|\\*|\\*\\*|/|//|%|<<|>>|&|\\||\\^|~|(?!^)@"));
                              ("name",
                               `String ("keyword.operator.arithmetic.python"))
                              ]);
                    `Assoc ([("match", `String ("\\="));
                              ("name",
                               `String ("keyword.operator.assignment.python"))
                              ]);
                    `Assoc ([("begin",
                              `String ("\\s*(class)\\s+(?=[[:alpha:]_][[:alnum:]_]*\\s*\\:)"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("storage.type.class.python"))
                                                   ]))
                                         ]));
                              ("contentName",
                               `String ("entity.name.type.class.python"));
                              ("end", `String ("\\s*(:)"));
                              ("endCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("punctuation.section.class.begin.python"))
                                                   ]))
                                         ]));
                              ("name",
                               `String ("meta.class.old-style.python"));
                              ("patterns",
                               `List ([`Assoc ([("include",
                                                 `String ("#entity_name_class"))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("begin",
                              `String ("\\s*(class)\\s+(?=[[:alpha:]_][[:alnum:]_]*\\s*\\()"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("storage.type.class.python"))
                                                   ]))
                                         ]));
                              ("end",
                               `String ("(\\))\\s*(?:(\\:)|(.*$\\n?))"));
                              ("endCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.inheritance.end.python"))
                                                   ]));
                                         ("2",
                                          `Assoc ([("name",
                                                    `String ("punctuation.section.class.begin.python"))
                                                    ]));
                                         ("3",
                                          `Assoc ([("name",
                                                    `String ("invalid.illegal.missing-section-begin.python"))
                                                    ]))
                                         ]));
                              ("name", `String ("meta.class.python"));
                              ("patterns",
                               `List ([`Assoc ([("begin",
                                                 `String ("(?=[[:alpha:]_][[:alnum:]_]*)"));
                                                 ("contentName",
                                                  `String ("entity.name.type.class.python"));
                                                 ("end",
                                                  `String ("(?![[:alnum:]_])"));
                                                 ("patterns",
                                                  `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#entity_name_class"))
                                                                    ])
                                                           ]))
                                                 ]);
                                        `Assoc ([("begin", `String ("(\\()"));
                                                  ("beginCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.inheritance.begin.python"))
                                                               ]))
                                                             ]));
                                                  ("contentName",
                                                   `String ("meta.class.inheritance.python"));
                                                  ("end",
                                                   `String ("(?=\\)|:)"));
                                                  ("patterns",
                                                   `List ([`Assoc ([("begin",
                                                                    `String (
                                                                    "(?<=\\(|,)\\s*"));
                                                                    ("contentName",
                                                                    `String (
                                                                    "entity.other.inherited-class.python"));
                                                                    ("end",
                                                                    `String (
                                                                    "\\s*(?:(,)|(?=\\)))"));
                                                                    ("endCaptures",
                                                                    `Assoc (
                                                                    [("1",
                                                                    `Assoc (
                                                                    [("name",
                                                                    `String (
                                                                    "punctuation.separator.inheritance.python"))
                                                                    ]))]));
                                                                    ("patterns",
                                                                    `List (
                                                                    [`Assoc (
                                                                    [("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])]))])
                                                            ]))
                                                  ])
                                        ]))
                              ]);
                    `Assoc ([("begin",
                              `String ("\\s*(class)\\s+(?=[[:alpha:]_][[:alnum:]_]*)"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("storage.type.class.python"))
                                                   ]))
                                         ]));
                              ("end", `String ("(\\()|\\s*($\\n?|#.*$\\n?)"));
                              ("endCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.inheritance.begin.python"))
                                                   ]));
                                         ("2",
                                          `Assoc ([("name",
                                                    `String ("invalid.illegal.missing-inheritance.python"))
                                                    ]))
                                         ]));
                              ("name", `String ("meta.class.python"));
                              ("patterns",
                               `List ([`Assoc ([("begin",
                                                 `String ("(?=[[:alpha:]_][[:alnum:]_]*)"));
                                                 ("contentName",
                                                  `String ("entity.name.type.class.python"));
                                                 ("end",
                                                  `String ("(?![[:alnum:]_])"));
                                                 ("patterns",
                                                  `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#entity_name_function"))
                                                                    ])
                                                           ]))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("begin",
                              `String ("\\s*(?:(async)\\s+)?(def)\\s+(?=[[:alpha:]_][[:alnum:]_]*\\s*\\()"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("storage.modifier.async.python"))
                                                   ]));
                                         ("2",
                                          `Assoc ([("name",
                                                    `String ("storage.type.function.python"))
                                                    ]))
                                         ]));
                              ("end", `String ("(\\:)"));
                              ("endCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("punctuation.section.function.begin.python"))
                                                   ]))
                                         ]));
                              ("name", `String ("meta.function.python"));
                              ("patterns",
                               `List ([`Assoc ([("begin",
                                                 `String ("(?=[[:alpha:]_][[:alnum:]_]*)"));
                                                 ("contentName",
                                                  `String ("entity.name.function.python"));
                                                 ("end",
                                                  `String ("(?![[:alnum:]_])"));
                                                 ("patterns",
                                                  `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#entity_name_function"))
                                                                    ])
                                                           ]))
                                                 ]);
                                        `Assoc ([("begin", `String ("(\\()"));
                                                  ("beginCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.parameters.begin.python"))
                                                               ]))
                                                             ]));
                                                  ("contentName",
                                                   `String ("meta.function.parameters.python"));
                                                  ("end",
                                                   `String ("(?=\\)\\s*(?:\\:|-\\>))"));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#annotated_arguments"))
                                                                    ]);
                                                            `Assoc ([("include",
                                                                    `String (
                                                                    "#keyword_arguments"))
                                                                    ]);
                                                            `Assoc ([("include",
                                                                    `String (
                                                                    "#comments"))
                                                                    ]);
                                                            `Assoc ([("captures",
                                                                    `Assoc (
                                                                    [("1",
                                                                    `Assoc (
                                                                    [("name",
                                                                    `String (
                                                                    "variable.parameter.function.language.python"))
                                                                    ]));
                                                                    ("2",
                                                                    `Assoc (
                                                                    [("name",
                                                                    `String (
                                                                    "variable.parameter.function.python"))
                                                                    ]));
                                                                    ("3",
                                                                    `Assoc (
                                                                    [("name",
                                                                    `String (
                                                                    "punctuation.separator.parameters.python"))
                                                                    ]))]));
                                                                    ("match",
                                                                    `String (
                                                                    "\\b(?:(self|cls)|([[:alpha:]_][[:alnum:]_]*))\\s*(?:(,)|(?=[\\n\\)]))"))
                                                                    ])
                                                            ]))
                                                  ]);
                                        `Assoc ([("begin",
                                                  `String ("(\\))\\s*(\\->)"));
                                                  ("beginCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.parameters.end.python"))
                                                               ]));
                                                             ("2",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.separator.annotation.result.python"))
                                                                ]))
                                                             ]));
                                                  ("end", `String ("(?=\\:)"));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                            ]))
                                                  ])
                                        ]))
                              ]);
                    `Assoc ([("begin",
                              `String ("\\s*(?:(async)\\s+)?(def)\\s+(?=[[:alpha:]_][[:alnum:]_]*)"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("storage.modifier.async.python"))
                                                   ]));
                                         ("2",
                                          `Assoc ([("name",
                                                    `String ("storage.type.function.python"))
                                                    ]))
                                         ]));
                              ("end", `String ("(\\()|\\s*($\\n?|#.*$\\n?)"));
                              ("endCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.parameters.begin.python"))
                                                   ]));
                                         ("2",
                                          `Assoc ([("name",
                                                    `String ("invalid.illegal.missing-parameters.python"))
                                                    ]))
                                         ]));
                              ("name", `String ("meta.function.python"));
                              ("patterns",
                               `List ([`Assoc ([("begin",
                                                 `String ("(?=[[:alpha:]_][[:alnum:]_]*)"));
                                                 ("contentName",
                                                  `String ("entity.name.function.python"));
                                                 ("end",
                                                  `String ("(?![[:alnum:]_])"));
                                                 ("patterns",
                                                  `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#entity_name_function"))
                                                                    ])
                                                           ]))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("captures",
                              `Assoc ([("1",
                                        `Assoc ([("name",
                                                  `String ("storage.modifier.async.python"))
                                                  ]));
                                        ("2",
                                         `Assoc ([("name",
                                                   `String ("storage.type.function.python"))
                                                   ]));
                                        ("3",
                                         `Assoc ([("name",
                                                   `String ("storage.type.function.inline.python"))
                                                   ]))
                                        ]));
                              ("match",
                               `String ("\\b(?:(?:(async)\\s+)?(def)|(lambda))\\b"))
                              ]);
                    `Assoc ([("comment",
                              `String ("Keywords that delimit flow blocks or alter flow from within a block. This block should be matched *after* meta.function.python to let `async def` be matched *first*."));
                              ("match",
                               `String ("(?x) \\b(\n  async | await | break | continue | elif | else | except | finally |\n  for | if | pass | raise | return | try | while | with |\n  (yield(?:\\s+from)?)\n)\\b"));
                              ("name",
                               `String ("keyword.control.flow.python"))
                              ]);
                    `Assoc ([("begin", `String ("(lambda)(?=\\s+|:)"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("storage.type.function.inline.python"))
                                                   ]))
                                         ]));
                              ("end", `String ("(\\:)"));
                              ("endCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.parameters.end.python"))
                                                   ]));
                                         ("2",
                                          `Assoc ([("name",
                                                    `String ("punctuation.section.function.begin.python"))
                                                    ]));
                                         ("3",
                                          `Assoc ([("name",
                                                    `String ("invalid.illegal.missing-section-begin.python"))
                                                    ]))
                                         ]));
                              ("name",
                               `String ("meta.function.inline.python"));
                              ("patterns",
                               `List ([`Assoc ([("begin", `String ("\\s+"));
                                                 ("contentName",
                                                  `String ("meta.function.inline.parameters.python"));
                                                 ("end", `String ("(?=\\:)"));
                                                 ("patterns",
                                                  `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#keyword_arguments"))
                                                                    ]);
                                                           `Assoc ([("captures",
                                                                    `Assoc (
                                                                    [("1",
                                                                    `Assoc (
                                                                    [("name",
                                                                    `String (
                                                                    "variable.parameter.function.python"))
                                                                    ]));
                                                                    ("2",
                                                                    `Assoc (
                                                                    [("name",
                                                                    `String (
                                                                    "punctuation.separator.parameters.python"))
                                                                    ]))]));
                                                                    ("match",
                                                                    `String (
                                                                    "\\b([[:alpha:]_][[:alnum:]_]*)\\s*(?:(,)|(?=[\\n\\)\\:]))"))
                                                                    ])
                                                           ]))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("begin",
                              `String ("^\\s*(?=@\\s*[[:alpha:]_][[:alnum:]_]*(?:\\s*\\.\\s*[[:alpha:]_][[:alnum:]_]*)*\\s*\\()"));
                              ("comment",
                               `String ("a decorator may be a function call which returns a decorator."));
                              ("end", `String ("(?<=\\))"));
                              ("endCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.arguments.end.python"))
                                                   ]))
                                         ]));
                              ("name",
                               `String ("meta.function.decorator.python"));
                              ("patterns",
                               `List ([`Assoc ([("begin",
                                                 `String ("(?=(@)\\s*[[:alpha:]_][[:alnum:]_]*(?:\\s*\\.\\s*[[:alpha:]_][[:alnum:]_]*)*\\s*\\()"));
                                                 ("beginCaptures",
                                                  `Assoc ([("1",
                                                            `Assoc ([("name",
                                                                    `String (
                                                                    "punctuation.definition.decorator.python"))
                                                                    ]))
                                                            ]));
                                                 ("contentName",
                                                  `String ("entity.name.function.decorator.python"));
                                                 ("end",
                                                  `String ("(?=\\s*\\()"));
                                                 ("patterns",
                                                  `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#dotted_name"))
                                                                    ])
                                                           ]))
                                                 ]);
                                        `Assoc ([("begin", `String ("(\\()"));
                                                  ("beginCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.arguments.begin.python"))
                                                               ]))
                                                             ]));
                                                  ("contentName",
                                                   `String ("meta.function.decorator.arguments.python"));
                                                  ("end",
                                                   `String ("(?=(\\)))"));
                                                  ("endCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.arguments.end.python"))
                                                               ]))
                                                             ]));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#keyword_arguments"))
                                                                    ]);
                                                            `Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                            ]))
                                                  ])
                                        ]))
                              ]);
                    `Assoc ([("begin",
                              `String ("^\\s*(?=@\\s*[[:alpha:]_][[:alnum:]_]*(?:\\s*\\.\\s*[[:alpha:]_][[:alnum:]_]*)*)"));
                              ("contentName",
                               `String ("entity.name.function.decorator.python"));
                              ("end", `String ("(?=\\s|$\\n?|#)"));
                              ("name",
                               `String ("meta.function.decorator.python"));
                              ("patterns",
                               `List ([`Assoc ([("begin",
                                                 `String ("(?=(@)\\s*[[:alpha:]_][[:alnum:]_]*(\\s*\\.\\s*[[:alpha:]_][[:alnum:]_]*)*)"));
                                                 ("beginCaptures",
                                                  `Assoc ([("1",
                                                            `Assoc ([("name",
                                                                    `String (
                                                                    "punctuation.definition.decorator.python"))
                                                                    ]))
                                                            ]));
                                                 ("end",
                                                  `String ("(?=\\s|$\\n?|#)"));
                                                 ("patterns",
                                                  `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#dotted_name"))
                                                                    ])
                                                           ]))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("begin", `String ("(?<=\\)|\\])\\s*(\\()"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.arguments.begin.python"))
                                                   ]))
                                         ]));
                              ("contentName",
                               `String ("meta.function-call.arguments.python"));
                              ("end", `String ("(\\))"));
                              ("endCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.arguments.end.python"))
                                                   ]))
                                         ]));
                              ("name", `String ("meta.function-call.python"));
                              ("patterns",
                               `List ([`Assoc ([("include",
                                                 `String ("#keyword_arguments"))
                                                 ]);
                                        `Assoc ([("include",
                                                  `String ("$self"))])
                                        ]))
                              ]);
                    `Assoc ([("include", `String ("#builtin_types"))]);
                    `Assoc ([("include", `String ("#builtin_functions_name"))
                              ]);
                    `Assoc ([("include", `String ("#builtin_functions_call"))
                              ]);
                    `Assoc ([("include",
                              `String ("#errors_warnings_exceptions"))]);
                    `Assoc ([("include", `String ("#docstrings"))]);
                    `Assoc ([("include", `String ("#magic_function_names"))]);
                    `Assoc ([("include", `String ("#magic_function_calls"))]);
                    `Assoc ([("include", `String ("#magic_variable_names"))]);
                    `Assoc ([("begin",
                              `String ("\\b(self|cls)\\b\\s*(?=(\\())"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("variable.language.python"))
                                                   ]));
                                         ("2",
                                          `Assoc ([("name",
                                                    `String ("punctuation.definition.arguments.begin.python"))
                                                    ]))
                                         ]));
                              ("end", `String ("(\\))"));
                              ("endCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.arguments.end.python"))
                                                   ]))
                                         ]));
                              ("name", `String ("meta.function-call.python"));
                              ("patterns",
                               `List ([`Assoc ([("begin", `String ("(\\()"));
                                                 ("beginCaptures",
                                                  `Assoc ([("1",
                                                            `Assoc ([("name",
                                                                    `String (
                                                                    "punctuation.definition.arguments.begin.python"))
                                                                    ]))
                                                            ]));
                                                 ("contentName",
                                                  `String ("meta.function-call.arguments.python"));
                                                 ("end",
                                                  `String ("(?=(\\)))"));
                                                 ("endCaptures",
                                                  `Assoc ([("1",
                                                            `Assoc ([("name",
                                                                    `String (
                                                                    "punctuation.definition.arguments.end.python"))
                                                                    ]))
                                                            ]));
                                                 ("patterns",
                                                  `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#keyword_arguments"))
                                                                    ]);
                                                           `Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                           ]))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("include", `String ("#language_variables"))]);
                    `Assoc ([("include", `String ("#generic_object_names"))]);
                    `Assoc ([("begin",
                              `String ("(?:\\.)?([[:alpha:]_][[:alnum:]_]*)\\s*(?=(\\())"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("meta.function-call.generic.python"))
                                                   ]));
                                         ("2",
                                          `Assoc ([("name",
                                                    `String ("punctuation.definition.arguments.begin.python"))
                                                    ]))
                                         ]));
                              ("end", `String ("(\\))"));
                              ("endCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.arguments.end.python"))
                                                   ]))
                                         ]));
                              ("name", `String ("meta.function-call.python"));
                              ("patterns",
                               `List ([`Assoc ([("begin",
                                                 `String ("(?=[[:alpha:]_][[:alnum:]_]*(?:\\.[[:alpha:]_][[:alnum:]_]*)*\\s*\\()"));
                                                 ("end",
                                                  `String ("(?=\\s*\\()"));
                                                 ("patterns",
                                                  `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#dotted_name"))
                                                                    ])
                                                           ]))
                                                 ]);
                                        `Assoc ([("begin", `String ("(\\()"));
                                                  ("beginCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.arguments.begin.python"))
                                                               ]))
                                                             ]));
                                                  ("contentName",
                                                   `String ("meta.function-call.arguments.python"));
                                                  ("end",
                                                   `String ("(?=(\\)))"));
                                                  ("endCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.arguments.end.python"))
                                                               ]))
                                                             ]));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#keyword_arguments"))
                                                                    ]);
                                                            `Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                            ]))
                                                  ]);
                                        `Assoc ([("begin", `String ("\\G"));
                                                  ("end", `String ("(?=\\()"));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#dotted_name"))
                                                                    ])
                                                            ]))
                                                  ])
                                        ]))
                              ]);
                    `Assoc ([("comment",
                              `String ("Py2 print statement that should only be matched after function calls"));
                              ("match",
                               `String ("(?<!\\.)\\b(print)(?=\\s|$)"));
                              ("name", `String ("keyword.other.print.python"))
                              ]);
                    `Assoc ([("begin",
                              `String ("(?=[[:alpha:]_][[:alnum:]_]*(?:\\s*\\.\\s*[[:alpha:]_][[:alnum:]_]*)*\\s*\\[)"));
                              ("end", `String ("(\\])"));
                              ("endCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.arguments.end.python"))
                                                   ]))
                                         ]));
                              ("name", `String ("meta.item-access.python"));
                              ("patterns",
                               `List ([`Assoc ([("begin",
                                                 `String ("(?=[[:alpha:]_][[:alnum:]_]*(?:\\s*\\.\\s*[[:alpha:]_][[:alnum:]_]*)*\\s*\\[)"));
                                                 ("end",
                                                  `String ("(?=\\s*\\[)"));
                                                 ("patterns",
                                                  `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#dotted_name"))
                                                                    ])
                                                           ]))
                                                 ]);
                                        `Assoc ([("begin", `String ("(\\[)"));
                                                  ("beginCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.arguments.begin.python"))
                                                               ]))
                                                             ]));
                                                  ("contentName",
                                                   `String ("meta.item-access.arguments.python"));
                                                  ("end",
                                                   `String ("(?=(\\]))"));
                                                  ("endCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.arguments.end.python"))
                                                               ]))
                                                             ]));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                            ]))
                                                  ]);
                                        `Assoc ([("begin", `String ("\\G"));
                                                  ("end", `String ("(?=\\[)"));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#dotted_name"))
                                                                    ])
                                                            ]))
                                                  ])
                                        ]))
                              ]);
                    `Assoc ([("captures",
                              `Assoc ([("1",
                                        `Assoc ([("name",
                                                  `String ("storage.type.class.python"))
                                                  ]))
                                        ]));
                              ("match", `String ("\\b(class)\\b"))]);
                    `Assoc ([("include", `String ("#line_continuation"))]);
                    `Assoc ([("include", `String ("#string_quoted_single"))]);
                    `Assoc ([("include", `String ("#string_quoted_double"))]);
                    `Assoc ([("include", `String ("#dotted_name"))]);
                    `Assoc ([("begin", `String ("(\\()"));
                              ("end", `String ("(\\))"));
                              ("patterns",
                               `List ([`Assoc ([("include", `String ("$self"))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("captures",
                              `Assoc ([("1",
                                        `Assoc ([("name",
                                                  `String ("punctuation.definition.list.begin.python"))
                                                  ]));
                                        ("2",
                                         `Assoc ([("name",
                                                   `String ("meta.empty-list.python"))
                                                   ]));
                                        ("3",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.list.end.python"))
                                                   ]))
                                        ]));
                              ("match", `String ("(\\[)(\\s*(\\]))\\b"))]);
                    `Assoc ([("begin", `String ("(\\[)"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.list.begin.python"))
                                                   ]))
                                         ]));
                              ("end", `String ("(\\])"));
                              ("endCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.list.end.python"))
                                                   ]))
                                         ]));
                              ("name", `String ("meta.structure.list.python"));
                              ("patterns",
                               `List ([`Assoc ([("begin",
                                                 `String ("(?<=\\[|\\,)\\s*(?![\\],])"));
                                                 ("contentName",
                                                  `String ("meta.structure.list.item.python"));
                                                 ("end",
                                                  `String ("\\s*(?:(,)|(?=\\]))"));
                                                 ("endCaptures",
                                                  `Assoc ([("1",
                                                            `Assoc ([("name",
                                                                    `String (
                                                                    "punctuation.separator.list.python"))
                                                                    ]))
                                                            ]));
                                                 ("patterns",
                                                  `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                           ]))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("captures",
                              `Assoc ([("1",
                                        `Assoc ([("name",
                                                  `String ("punctuation.definition.tuple.begin.python"))
                                                  ]));
                                        ("2",
                                         `Assoc ([("name",
                                                   `String ("meta.empty-tuple.python"))
                                                   ]));
                                        ("3",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.tuple.end.python"))
                                                   ]))
                                        ]));
                              ("match", `String ("\\b(\\()(\\s*(\\)))\\b"));
                              ("name",
                               `String ("meta.structure.tuple.python"))
                              ]);
                    `Assoc ([("captures",
                              `Assoc ([("1",
                                        `Assoc ([("name",
                                                  `String ("punctuation.definition.dictionary.begin.python"))
                                                  ]));
                                        ("2",
                                         `Assoc ([("name",
                                                   `String ("meta.empty-dictionary.python"))
                                                   ]));
                                        ("3",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.dictionary.end.python"))
                                                   ]))
                                        ]));
                              ("match", `String ("(\\{)(\\s*(\\}))"));
                              ("name",
                               `String ("meta.structure.dictionary.python"))
                              ]);
                    `Assoc ([("begin", `String ("(\\{)"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.dictionary.begin.python"))
                                                   ]))
                                         ]));
                              ("end", `String ("(\\})"));
                              ("endCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.dictionary.end.python"))
                                                   ]))
                                         ]));
                              ("name",
                               `String ("meta.structure.dictionary.python"));
                              ("patterns",
                               `List ([`Assoc ([("begin",
                                                 `String ("(?<=\\{|\\,|^)\\s*(?![\\},])"));
                                                 ("contentName",
                                                  `String ("meta.structure.dictionary.key.python"));
                                                 ("end",
                                                  `String ("\\s*(?:(?=\\})|(\\:))"));
                                                 ("endCaptures",
                                                  `Assoc ([("1",
                                                            `Assoc ([("name",
                                                                    `String (
                                                                    "punctuation.separator.valuepair.dictionary.python"))
                                                                    ]))
                                                            ]));
                                                 ("patterns",
                                                  `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                           ]))
                                                 ]);
                                        `Assoc ([("begin",
                                                  `String ("(?<=\\:|^)\\s*"));
                                                  ("contentName",
                                                   `String ("meta.structure.dictionary.value.python"));
                                                  ("end",
                                                   `String ("\\s*(?:(?=\\})|(,))"));
                                                  ("endCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.separator.dictionary.python"))
                                                               ]))
                                                             ]));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                            ]))
                                                  ])
                                        ]))
                              ])
                    ]));
          ("repository",
           `Assoc ([("annotated_arguments",
                     `Assoc ([("begin",
                               `String ("\\b([[:alpha:]_][[:alnum:]_]*)\\s*(:)|(?=\\()"));
                               ("beginCaptures",
                                `Assoc ([("1",
                                          `Assoc ([("name",
                                                    `String ("variable.parameter.function.python"))
                                                    ]));
                                          ("2",
                                           `Assoc ([("name",
                                                     `String ("punctuation.separator.annotation.python"))
                                                     ]))
                                          ]));
                               ("end",
                                `String ("\\s*(?:(,)|(?=$\\n?|[\\)\\:]))"));
                               ("endCaptures",
                                `Assoc ([("1",
                                          `Assoc ([("name",
                                                    `String ("punctuation.separator.parameters.python"))
                                                    ]))
                                          ]));
                               ("patterns",
                                `List ([`Assoc ([("include",
                                                  `String ("#annotated_group"))
                                                  ]);
                                         `Assoc ([("match", `String ("="));
                                                   ("name",
                                                    `String ("keyword.operator.assignment.python"))
                                                   ]);
                                         `Assoc ([("include",
                                                   `String ("$self"))])
                                         ]))
                               ]));
                     ("annotated_group",
                      `Assoc ([("begin", `String ("(\\()"));
                                ("beginCaptures",
                                 `Assoc ([("1",
                                           `Assoc ([("name",
                                                     `String ("punctuation.definition.parameters-group.begin.python"))
                                                     ]))
                                           ]));
                                ("end", `String ("(\\))"));
                                ("endCaptures",
                                 `Assoc ([("1",
                                           `Assoc ([("name",
                                                     `String ("punctuation.definition.parameters-group.end.python"))
                                                     ]))
                                           ]));
                                ("patterns",
                                 `List ([`Assoc ([("begin",
                                                   `String ("\\b([[:alpha:]_][[:alnum:]_]*)\\s*(:)"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "variable.parameter.function.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.separator.annotation.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("\\s*(?:(,)|(?=$\\n?|\\)))"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.separator.parameters.python"))
                                                                ]))
                                                              ]));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])
                                                             ]))
                                                   ]);
                                          `Assoc ([("begin",
                                                    `String ("\\b([[:alpha:]_][[:alnum:]_]*)"));
                                                    ("beginCaptures",
                                                     `Assoc ([("1",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "variable.parameter.function.python"))
                                                                 ]))
                                                               ]));
                                                    ("end",
                                                     `String ("\\s*(?:(,)|(?=$\\n?|\\)))"));
                                                    ("endCaptures",
                                                     `Assoc ([("1",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.separator.parameters.python"))
                                                                 ]))
                                                               ]))
                                                    ]);
                                          `Assoc ([("include",
                                                    `String ("#comments"))])
                                          ]))
                                ]));
                     ("builtin_functions_call",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("begin",
                                                  `String ("(?x)\n  (?<!\\.)\\b(\n    __import__ | abs | all | any | ascii | basestring | bin | bool |\n    bytearray | bytes | callable | chr | classmethod | cmp | compile |\n    complex | delattr | dict | dir | divmod | enumerate | eval | exec |\n    execfile | file | filter | float | format | frozenset | getattr |\n    globals | hasattr | hash | help | hex | id | input | int |\n    isinstance | issubclass | iter | len | list | locals | long | map |\n    max | memoryview | min | next | object | oct | open | ord | pow |\n    print | property | range | raw_input | reduce | reload | repr |\n    reversed | round | set | setattr | slice | sorted | staticmethod |\n    str | sum | super | tuple | type | unichr | unicode | vars |\n    xrange | zip)\n  \\b\\s*(?=(\\())"));
                                                  ("beginCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "support.function.builtin.call.python"))
                                                               ]));
                                                             ("2",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.arguments.begin.python"))
                                                                ]))
                                                             ]));
                                                  ("end", `String ("(\\))"));
                                                  ("endCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.arguments.end.python"))
                                                               ]))
                                                             ]));
                                                  ("name",
                                                   `String ("meta.function-call.python"));
                                                  ("patterns",
                                                   `List ([`Assoc ([("begin",
                                                                    `String (
                                                                    "(?=[[:alpha:]_][[:alnum:]_]*(?:\\s*\\.\\s*[[:alpha:]_][[:alnum:]_]*)*\\s*\\()"));
                                                                    ("end",
                                                                    `String (
                                                                    "(?=\\s*\\()"));
                                                                    ("patterns",
                                                                    `List (
                                                                    [`Assoc (
                                                                    [("include",
                                                                    `String (
                                                                    "#dotted_name"))
                                                                    ])]))]);
                                                            `Assoc ([("begin",
                                                                    `String (
                                                                    "(\\()"));
                                                                    ("beginCaptures",
                                                                    `Assoc (
                                                                    [("1",
                                                                    `Assoc (
                                                                    [("name",
                                                                    `String (
                                                                    "punctuation.definition.arguments.begin.python"))
                                                                    ]))]));
                                                                    ("contentName",
                                                                    `String (
                                                                    "meta.function-call.arguments.python"));
                                                                    ("end",
                                                                    `String (
                                                                    "(?=\\))"));
                                                                    ("endCaptures",
                                                                    `Assoc (
                                                                    [("0",
                                                                    `Assoc (
                                                                    [("name",
                                                                    `String (
                                                                    "punctuation.definition.arguments.end.python"))
                                                                    ]))]));
                                                                    ("patterns",
                                                                    `List (
                                                                    [`Assoc (
                                                                    [("include",
                                                                    `String (
                                                                    "#keyword_arguments"))
                                                                    ]);
                                                                    `Assoc (
                                                                    [("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])]))])
                                                            ]))
                                                  ])
                                         ]))
                                ]));
                     ("builtin_functions_name",
                      `Assoc ([("match",
                                `String ("(?x)\n  (?<!\\.|@)\n  \\b(\n    __import__ | abs | all | any | ascii | basestring | bin | bool |\n    bytearray | bytes | callable | chr | classmethod | cmp | compile |\n    complex | delattr | dict | dir | divmod | enumerate | eval | exec |\n    execfile | file | filter | float | format | frozenset | getattr |\n    globals | hasattr | hash | help | hex | id | input | int |\n    isinstance | issubclass | iter | len | list | locals | long | map |\n    max | memoryview | min | next | object | oct | open | ord | pow |\n    property | range | raw_input | reduce | reload | repr |\n    reversed | round | set | setattr | slice | sorted | staticmethod |\n    str | sum | super | tuple | type | unichr | unicode | vars |\n    xrange | zip)\n  \\b\\s*(?!(\\())"));
                                ("name",
                                 `String ("support.function.builtin.name.python"))
                                ]));
                     ("builtin_types",
                      `Assoc ([("comment",
                                `String ("These are from https://docs.python.org/X/library/functions.html where X is 2.7 or 3.5 and the item is a class. Also stdtypes.html"));
                                ("match",
                                 `String ("(?x)\n  (?<!\\.)\n  \\b(\n    bool | buffer | bytearray | bytes | complex | dict | float |\n    frozenset | int | list | long | memoryview | object | property |\n    range | set | slice | str | tuple | type | unicode | xrange)\n  \\b(?!(\\s*\\())"));
                                ("name", `String ("support.type.python"))]));
                     ("character-class",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("match",
                                                  `String ("\\\\[wWsSdDhH]|\\."));
                                                  ("name",
                                                   `String ("constant.character.character-class.regex.python"))
                                                  ]);
                                         `Assoc ([("match", `String ("\\\\."));
                                                   ("name",
                                                    `String ("constant.character.escape.backslash.regex.python"))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("(\\[)(\\^)?"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.character-class.regex.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "keyword.operator.negation.regex.python"))
                                                                 ]))
                                                              ]));
                                                   ("end", `String ("(\\])"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.character-class.regex.python"))
                                                                ]))
                                                              ]));
                                                   ("name",
                                                    `String ("constant.other.character-class.set.regex.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#character-class"))
                                                                    ]);
                                                             `Assoc (
                                                             [("captures",
                                                               `Assoc (
                                                               [("2",
                                                                 `Assoc (
                                                                 [("name",
                                                                   `String (
                                                                   "constant.character.escape.backslash.regex.python"))
                                                                   ]));
                                                                 ("4",
                                                                  `Assoc (
                                                                  [("name",
                                                                    `String (
                                                                    "constant.character.escape.backslash.regex.python"))
                                                                    ]))
                                                                 ]));
                                                               ("match",
                                                                `String (
                                                                "((\\\\.)|.)\\-((\\\\.)|[^\\]])"));
                                                               ("name",
                                                                `String (
                                                                "constant.other.character-class.range.regex.python"))
                                                               ])
                                                             ]))
                                                   ])
                                         ]))
                                ]));
                     ("comments",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("captures",
                                                  `Assoc ([("1",
                                                            `Assoc ([("name",
                                                                    `String (
                                                                    "punctuation.definition.comment.python"))
                                                                    ]));
                                                            ("2",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "comment.line.note.notation.python"))
                                                               ]))
                                                            ]));
                                                  ("match",
                                                   `String ("(#+)\\s*(BUG|FIXME|TODO|XXX).*$"));
                                                  ("name",
                                                   `String ("comment.line.note.python"))
                                                  ]);
                                         `Assoc ([("captures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.comment.python"))
                                                               ]))
                                                             ]));
                                                   ("match",
                                                    `String ("(#+).*$"));
                                                   ("name",
                                                    `String ("comment.line.number-sign.python"))
                                                   ])
                                         ]))
                                ]));
                     ("constant_placeholder",
                      `Assoc ([("match",
                                `String ("(?i:%(\\([[:lower:]_]+\\))?#?0?\\-?[ ]?\\+?([0-9]*|\\*)(\\.([0-9]*|\\*))?[hL]?[[:lower:]%])"));
                                ("name",
                                 `String ("constant.other.placeholder.python"))
                                ]));
                     ("docstrings",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("begin",
                                                  `String ("^\\s*(?=[uU]?[rR]?\"\"\")"));
                                                  ("end",
                                                   `String ("(?<=\"\"\")"));
                                                  ("name",
                                                   `String ("comment.block.python"));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#string_quoted_double"))
                                                                    ])
                                                            ]))
                                                  ]);
                                         `Assoc ([("begin",
                                                   `String ("^\\s*(?=[uU]?[rR]?''')"));
                                                   ("end",
                                                    `String ("(?<=''')"));
                                                   ("name",
                                                    `String ("comment.block.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#string_quoted_single"))
                                                                    ])
                                                             ]))
                                                   ])
                                         ]))
                                ]));
                     ("dotted_name",
                      `Assoc ([("begin",
                                `String ("(?x)(?=\n  (?:\\.(?!\\s+import)\\s*)?\n  [[:alpha:]_][[:alnum:]_]*\n  (?:\\s*\\.\\s*[[:alpha:]_][[:alnum:]_]*)*\n)"));
                                ("end",
                                 `String ("(?![[:alnum:]_\\.\\s])|(?=(?<!\\.)\\s+[^.])|$"));
                                ("patterns",
                                 `List ([`Assoc ([("begin",
                                                   `String ("(\\.)(?=[[:alpha:]_][[:alnum:]_]*)"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "meta.dot.python"))
                                                                ]))
                                                              ]));
                                                   ("end",
                                                    `String ("(?![[:alnum:]_])"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#builtin_functions_name"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#magic_function_names"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#magic_variable_names"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#generic_names"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#illegal_names"))
                                                               ])
                                                             ]))
                                                   ]);
                                          `Assoc ([("begin",
                                                    `String ("(?<!\\.)(?=[[:alpha:]_][[:alnum:]_]*)"));
                                                    ("end",
                                                     `String ("(?![[:alnum:]_])"));
                                                    ("patterns",
                                                     `List ([`Assoc (
                                                              [("include",
                                                                `String (
                                                                "#builtin_types"))
                                                                ]);
                                                              `Assoc (
                                                              [("include",
                                                                `String (
                                                                "#builtin_functions_name"))
                                                                ]);
                                                              `Assoc (
                                                              [("include",
                                                                `String (
                                                                "#builtin_functions_call"))
                                                                ]);
                                                              `Assoc (
                                                              [("include",
                                                                `String (
                                                                "#errors_warnings_exceptions"))
                                                                ]);
                                                              `Assoc (
                                                              [("include",
                                                                `String (
                                                                "#magic_function_names"))
                                                                ]);
                                                              `Assoc (
                                                              [("include",
                                                                `String (
                                                                "#magic_function_calls"))
                                                                ]);
                                                              `Assoc (
                                                              [("include",
                                                                `String (
                                                                "#magic_variable_names"))
                                                                ]);
                                                              `Assoc (
                                                              [("include",
                                                                `String (
                                                                "#language_variables"))
                                                                ]);
                                                              `Assoc (
                                                              [("include",
                                                                `String (
                                                                "#generic_names"))
                                                                ]);
                                                              `Assoc (
                                                              [("include",
                                                                `String (
                                                                "#illegal_names"))
                                                                ])
                                                              ]))
                                                    ])
                                          ]))
                                ]));
                     ("entity_name_class",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("include",
                                                  `String ("#generic_names"))
                                                  ]);
                                         `Assoc ([("include",
                                                   `String ("#illegal_names"))
                                                   ])
                                         ]))
                                ]));
                     ("entity_name_function",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("include",
                                                  `String ("#builtin_functions_name"))
                                                  ]);
                                         `Assoc ([("include",
                                                   `String ("#magic_function_names"))
                                                   ]);
                                         `Assoc ([("include",
                                                   `String ("#illegal_names"))
                                                   ])
                                         ]))
                                ]));
                     ("errors_warnings_exceptions",
                      `Assoc ([("match",
                                `String ("(?x)\n\\b(\n  (\n      Arithmetic | Assertion | Attribute | Buffer | BlockingIO |\n      BrokenPipe | ChildProcess | (Connection(Aborted | Refused | Reset)?) |\n      EOF | Environment | FileExists | FileNotFound | FloatingPoint | IO |\n      Import | Indentation | Index | Interrupted | IsADirectory |\n      NotADirectory | Permission | ProcessLookup | Timeout | Key | Lookup |\n      Memory | Name | NotImplemented | OS | Overflow | Reference | Runtime |\n      Recursion | Standard | Syntax | System | Tab | Type | UnboundLocal |\n      Unicode(Encode | Decode | Translate)? | Value | VMS | Windows |\n      ZeroDivision | ([[:alpha:]_][[:alnum:]_]*))\n    ?Error\n    |\n    (\n      (Pending)?Deprecation | Bytes | Future | Import | Resource |\n      Runtime | Syntax | Unicode | User | [[:alpha:]_][[:alnum:]_]*)\n    ?Warning\n    |\n    SystemExit | Stop(Async)?Iteration | NotImplemented |\n    KeyboardInterrupt | GeneratorExit\n    |\n    ([[:alpha:]_][[:alnum:]_]*)\n    ?Exception\n  )\n\\b"));
                                ("name",
                                 `String ("support.type.exception.python"))
                                ]));
                     ("escaped_char",
                      `Assoc ([("captures",
                                `Assoc ([("1",
                                          `Assoc ([("name",
                                                    `String ("constant.character.escape.hex.python"))
                                                    ]));
                                          ("10",
                                           `Assoc ([("name",
                                                     `String ("constant.character.escape.linefeed.python"))
                                                     ]));
                                          ("11",
                                           `Assoc ([("name",
                                                     `String ("constant.character.escape.return.python"))
                                                     ]));
                                          ("12",
                                           `Assoc ([("name",
                                                     `String ("constant.character.escape.tab.python"))
                                                     ]));
                                          ("13",
                                           `Assoc ([("name",
                                                     `String ("constant.character.escape.vertical-tab.python"))
                                                     ]));
                                          ("2",
                                           `Assoc ([("name",
                                                     `String ("constant.character.escape.octal.python"))
                                                     ]));
                                          ("3",
                                           `Assoc ([("name",
                                                     `String ("constant.character.escape.newline.python"))
                                                     ]));
                                          ("4",
                                           `Assoc ([("name",
                                                     `String ("constant.character.escape.backslash.python"))
                                                     ]));
                                          ("5",
                                           `Assoc ([("name",
                                                     `String ("constant.character.escape.double-quote.python"))
                                                     ]));
                                          ("6",
                                           `Assoc ([("name",
                                                     `String ("constant.character.escape.single-quote.python"))
                                                     ]));
                                          ("7",
                                           `Assoc ([("name",
                                                     `String ("constant.character.escape.bell.python"))
                                                     ]));
                                          ("8",
                                           `Assoc ([("name",
                                                     `String ("constant.character.escape.backspace.python"))
                                                     ]));
                                          ("9",
                                           `Assoc ([("name",
                                                     `String ("constant.character.escape.formfeed.python"))
                                                     ]))
                                          ]));
                                ("match",
                                 `String ("(?x)\n  (\\\\x[\\h]{2}) |\n  (\\\\[0-7]{3}) |\n  (\\\\\\n) |\n  (\\\\\\\\) |\n  (\\\\\") |\n  (\\\\') |\n  (\\\\a) |\n  (\\\\b) |\n  (\\\\f) |\n  (\\\\n) |\n  (\\\\r) |\n  (\\\\t) |\n  (\\\\v)"))
                                ]));
                     ("escaped_char_raw_double",
                      `Assoc ([("match", `String ("\\\\\""));
                                ("name",
                                 `String ("constant.character.escape.quote.python"))
                                ]));
                     ("escaped_char_raw_single",
                      `Assoc ([("match", `String ("\\\\'"));
                                ("name",
                                 `String ("constant.character.escape.quote.python"))
                                ]));
                     ("escaped_unicode_char",
                      `Assoc ([("captures",
                                `Assoc ([("1",
                                          `Assoc ([("name",
                                                    `String ("constant.character.escape.unicode.32-bit-hex.python"))
                                                    ]));
                                          ("2",
                                           `Assoc ([("name",
                                                     `String ("constant.character.escape.unicode.16-bit-hex.python"))
                                                     ]));
                                          ("3",
                                           `Assoc ([("name",
                                                     `String ("constant.character.escape.unicode.name.python"))
                                                     ]))
                                          ]));
                                ("match",
                                 `String ("(\\\\U[\\h]{8})|(\\\\u[\\h]{4})|(\\\\N\\{[a-zA-Z0-9\\, ]+\\})"))
                                ]));
                     ("generic_names",
                      `Assoc ([("match",
                                `String ("[[:alpha:]_][[:alnum:]_]*"))]));
                     ("generic_object_names",
                      `Assoc ([("match",
                                `String ("(\\.\\b([[:alpha:]_][[:alnum:]_]*)\\b(?!\\(|\\[)|\\b([[:alpha:]_][[:alnum:]_]*)\\b\\.)"))
                                ]));
                     ("illegal_names",
                      `Assoc ([("comment",
                                `String ("from Lib/keyword.py, in kwlist. `async` and `await` not keywords until Python 3.7 (according to PEP-0492)"));
                                ("match",
                                 `String ("(?x)\n\\b (\n  False | None | True | and | as | assert | break | class | continue | def |\n  del | elif | else | except | exec | finally | for | from | global | if |\n  import | in | is | lambda | nonlocal | not | or | pass | print | raise |\n  return | try | while | with | yield)\n\\b"));
                                ("name",
                                 `String ("invalid.illegal.name.python"))
                                ]));
                     ("keyword_arguments",
                      `Assoc ([("begin",
                                `String ("\\b([[:alpha:]_][[:alnum:]_]*)\\s*(=)(?!=)"));
                                ("beginCaptures",
                                 `Assoc ([("1",
                                           `Assoc ([("name",
                                                     `String ("variable.parameter.function.keyword.python"))
                                                     ]));
                                           ("2",
                                            `Assoc ([("name",
                                                      `String ("keyword.operator.assignment.python"))
                                                      ]))
                                           ]));
                                ("end", `String ("\\s*(?:(,)|(?=[\\)\\:]))"));
                                ("endCaptures",
                                 `Assoc ([("1",
                                           `Assoc ([("name",
                                                     `String ("punctuation.separator.parameters.python"))
                                                     ]))
                                           ]));
                                ("patterns",
                                 `List ([`Assoc ([("include",
                                                   `String ("$self"))])
                                          ]))
                                ]));
                     ("language_variables",
                      `Assoc ([("captures",
                                `Assoc ([("1",
                                          `Assoc ([("name",
                                                    `String ("variable.language.python"))
                                                    ]))
                                          ]));
                                ("match",
                                 `String ("(?<!\\.)\\b(self|cls)\\b(?:\\.|\\()?"))
                                ]));
                     ("line_continuation",
                      `Assoc ([("captures",
                                `Assoc ([("1",
                                          `Assoc ([("name",
                                                    `String ("punctuation.separator.continuation.line.python"))
                                                    ]))
                                          ]));
                                ("match", `String ("(\\\\)(.*)$\\n?"))]));
                     ("magic_function_calls",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("begin",
                                                  `String ("(?x)\n  (\\.)?\n  \\b(\n    __(?:\n      abs | add | aenter | aexit | aiter | and | anext | await | bool |\n      bytes | call | ceil | cmp | coerce | complex | contains | copy |\n      deepcopy | del | delattr | delete | delitem | delslice | dir | div |\n      divmod | enter | eq | exit | float | floor | floordiv | format | ge |\n      get | getattr | getattribute | getinitargs | getitem | getnewargs |\n      getnewargs_ex | getslice | getstate | gt | hash | hex | iadd | iand |\n      idiv | idivmod | ifloordiv | ilshift | imatmul | imod | imul | index |\n      init | instancecheck | int | invert | iop | ior | ipow | irshift |\n      isub | iter | itruediv | ixor | le | len | length_hint | long |\n      lshift | lt | matmul | missing | mod | mul | ne | neg | new | next |\n      nonzero | oct | op | or | pos | pow | prepare | radd | rand | rcmp |\n      rdiv | rdivmod | reduce | reduce_ex | repr | reversed | rfloordiv |\n      rlshift | rmatmul | rmod | rmul | rop | ror | round | rpow | rrshift |\n      rshift | rsub | rtruediv | rxor | set | setattr | setitem | setslice |\n      setstate | sizeof | str | sub | subclasscheck | truediv | trunc |\n      unicode | xor)\n    __)\n  \\s*(?=(\\())"));
                                                  ("beginCaptures",
                                                   `Assoc ([("2",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "support.function.magic.call.python"))
                                                               ]));
                                                             ("4",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.arguments.begin.python"))
                                                                ]))
                                                             ]));
                                                  ("end", `String ("(\\))"));
                                                  ("endCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.arguments.end.python"))
                                                               ]))
                                                             ]));
                                                  ("name",
                                                   `String ("meta.function-call.python"));
                                                  ("patterns",
                                                   `List ([`Assoc ([("begin",
                                                                    `String (
                                                                    "(?=[[:alpha:]_][[:alnum:]_]*(?:\\s*\\.\\s*[[:alpha:]_][[:alnum:]_]*)*\\s*\\()"));
                                                                    ("end",
                                                                    `String (
                                                                    "(?=\\s*\\()"));
                                                                    ("patterns",
                                                                    `List (
                                                                    [`Assoc (
                                                                    [("include",
                                                                    `String (
                                                                    "#dotted_name"))
                                                                    ])]))]);
                                                            `Assoc ([("begin",
                                                                    `String (
                                                                    "(\\()"));
                                                                    ("beginCaptures",
                                                                    `Assoc (
                                                                    [("1",
                                                                    `Assoc (
                                                                    [("name",
                                                                    `String (
                                                                    "punctuation.definition.arguments.begin.python"))
                                                                    ]))]));
                                                                    ("contentName",
                                                                    `String (
                                                                    "meta.function-call.arguments.python"));
                                                                    ("end",
                                                                    `String (
                                                                    "(?=\\))"));
                                                                    ("endCaptures",
                                                                    `Assoc (
                                                                    [("0",
                                                                    `Assoc (
                                                                    [("name",
                                                                    `String (
                                                                    "punctuation.definition.arguments.end.python"))
                                                                    ]))]));
                                                                    ("patterns",
                                                                    `List (
                                                                    [`Assoc (
                                                                    [("include",
                                                                    `String (
                                                                    "#keyword_arguments"))
                                                                    ]);
                                                                    `Assoc (
                                                                    [("include",
                                                                    `String (
                                                                    "$self"))
                                                                    ])]))])
                                                            ]))
                                                  ])
                                         ]))
                                ]));
                     ("magic_function_names",
                      `Assoc ([("captures",
                                `Assoc ([("2",
                                          `Assoc ([("name",
                                                    `String ("support.function.magic.name.python"))
                                                    ]))
                                          ]));
                                ("comment",
                                 `String ("these methods have magic interpretation by python and are generally called indirectly through syntactic constructs. Names are from https://docs.python.org/X/reference/datamodel.html where X is 2.7 and 3.5 See also http://www.rafekettler.com/magicmethods.html"));
                                ("match",
                                 `String ("(?x)\n(def|\\.)?\n\\s*\\b(\n  __(?:\n    abs | add | aenter | aexit | aiter | and | anext | await | bool |\n    bytes | call | ceil | cmp | coerce | complex | contains | copy |\n    deepcopy | del | delattr | delete | delitem | delslice | dir | div |\n    divmod | enter | eq | exit | float | floor | floordiv | format | ge |\n    get | getattr | getattribute | getinitargs | getitem | getnewargs |\n    getnewargs_ex | getslice | getstate | gt | hash | hex | iadd | iand |\n    idiv | idivmod | ifloordiv | ilshift | imatmul | imod | imul | index |\n    init | instancecheck | int | invert | iop | ior | ipow | irshift |\n    isub | iter | itruediv | ixor | le | len | length_hint | long |\n    lshift | lt | matmul | missing | mod | mul | ne | neg | new | next |\n    nonzero | oct | op | or | pos | pow | prepare | radd | rand | rcmp |\n    rdiv | rdivmod | reduce | reduce_ex | repr | reversed | rfloordiv |\n    rlshift | rmatmul | rmod | rmul | rop | ror | round | rpow | rrshift |\n    rshift | rsub | rtruediv | rxor | set | setattr | setitem | setslice |\n    setstate | sizeof | str | sub | subclasscheck | truediv | trunc |\n    unicode | xor)\n  __)\n\\b"))
                                ]));
                     ("magic_variable_names",
                      `Assoc ([("captures",
                                `Assoc ([("2",
                                          `Assoc ([("name",
                                                    `String ("support.variable.magic.python"))
                                                    ]))
                                          ]));
                                ("comment",
                                 `String ("magic attributes which a class/module may have."));
                                ("match",
                                 `String ("(?x)\n(\\.)?\n\\b(\n  __(?:\n    all | annotations | bases | class | closure | code | debug |\n    defaults | dict | doc | file | func | globals | kwdefaults |\n    members | metaclass | methods | module | mro | name | qualname |\n    self | slots | subclasses | version | weakref)\n  __) \\b"))
                                ]));
                     ("regular_expressions",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("include",
                                                  `String ("source.regexp.python.improved"))
                                                  ])
                                         ]))
                                ]));
                     ("string_formatting",
                      `Assoc ([("captures",
                                `Assoc ([("11",
                                          `Assoc ([("name",
                                                    `String ("constant.numeric.integer.octal.python"))
                                                    ]));
                                          ("12",
                                           `Assoc ([("name",
                                                     `String ("constant.numeric.integer.hexadecimal.python"))
                                                     ]));
                                          ("13",
                                           `Assoc ([("name",
                                                     `String ("constant.numeric.integer.binary.python"))
                                                     ]));
                                          ("14",
                                           `Assoc ([("name",
                                                     `String ("attribute.name"))
                                                     ]));
                                          ("16",
                                           `Assoc ([("name",
                                                     `String ("attribute.identifier"))
                                                     ]));
                                          ("6",
                                           `Assoc ([("name",
                                                     `String ("identifier"))]));
                                          ("8",
                                           `Assoc ([("name",
                                                     `String ("constant.numeric.integer.decimal.python"))
                                                     ]))
                                          ]));
                                ("comment",
                                 `String ("Attempt from @sprt to add support for new-style string formatting."));
                                ("match",
                                 `String ("(?x)\n(?<![^\\{]\\{)\n\\{\n(?<fieldname>\n  (\n    (?<argname>\n      (\n        (?<identifier>([[:alpha:]_][[:alnum:]_]*)) |\n        (?<integer>\n          ([1-9]\\d* | 0) |\n          (\n            0\n            (\n              (?i:\n                ([o]?[0-7]+) |\n                ([x][0-9a-f]+) |\n                ([b][01]+)\n              )\n            )\n          )\n        )\n      )\n    )?\n  )\n  (\n    (?<attributename>\n      (\\.\\g<identifier>)\n    ) |\n    \\[\n    (\n      (?<elementindex>\n        (\n          (\\g<integer>) |\n          (?<indexstring>[^\\]\\}\\{]+)\n        )\n      )\n    )\n    \\]\n  )*\n)?\n(\n  ((?<conversion>(\\![rsa])))\n)?\n(\n  (?<formatspec>\n    (\n      \\:\n      (\n        (?<fill>.)?\n        (?<align>([<>=\\^]))\n      )?\n      (?<sign>([\\ +-]))?\n      \\#?0?\n      (?<width>\n        (\\g<integer>)\n      )?\n      ,?\n      (?<precision>\n        \\.\n        (\\g<integer>)\n      )?\n      (?<type>([bcdEeFfGgnosXx%]))?\n    )?\n  )\n)?\n\\}\n(?!\\}[^\\}])"))
                                ]));
                     ("string_quoted_double",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("begin",
                                                  `String ("([uU]r)(\"\"\")"));
                                                  ("beginCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "storage.type.string.python"))
                                                               ]));
                                                             ("2",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.begin.python"))
                                                                ]))
                                                             ]));
                                                  ("end",
                                                   `String ("((?<=\"\"\")(\")\"\"|\"\"\")"));
                                                  ("endCaptures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.string.end.python"))
                                                               ]));
                                                             ("2",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "meta.empty-string.double.python"))
                                                                ]))
                                                             ]));
                                                  ("name",
                                                   `String ("string.quoted.double.block.unicode-raw-regex.python"));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                            `Assoc ([("include",
                                                                    `String (
                                                                    "#escaped_char_raw_double"))
                                                                    ]);
                                                            `Assoc ([("include",
                                                                    `String (
                                                                    "#regular_expressions"))
                                                                    ])
                                                            ]))
                                                  ]);
                                         `Assoc ([("begin",
                                                   `String ("([uU]R)(\"\"\")"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("((?<=\"\"\")(\")\"\"|\"\"\")"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.double.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.double.block.unicode-raw.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_double"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("([bB]r)(\"\"\")"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("((?<=\"\"\")(\")\"\"|\"\"\")"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.double.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.double.block.bytes-raw-regex.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_double"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#regular_expressions"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("([bB]R)(\"\"\")"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("((?<=\"\"\")(\")\"\"|\"\"\")"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.double.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.double.block.bytes-raw.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_double"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("(r)(\"\"\")"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("((?<=\"\"\")(\")\"\"|\"\"\")"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.double.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.double.block.raw-regex.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_double"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#regular_expressions"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("(R)(\"\"\")"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("((?<=\"\"\")(\")\"\"|\"\"\")"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.double.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.double.block.raw.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_double"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("([uU])(\"\"\")"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("comment",
                                                    `String ("double quoted unicode string"));
                                                   ("end",
                                                    `String ("((?<=\"\"\")(\")\"\"|\"\"\")"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.double.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.double.block.unicode.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_unicode_char"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("([bB])(\"\"\")"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("comment",
                                                    `String ("double quoted bytes string"));
                                                   ("end",
                                                    `String ("((?<=\"\"\")(\")\"\"|\"\"\")"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.double.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.double.block.bytes.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_unicode_char"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("([uU]r)(\")"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("((?<=\")(\")|\")|(\\n)"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.double.python"))
                                                                 ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "invalid.illegal.unclosed-string.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.double.single-line.unicode-raw-regex.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_double"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#regular_expressions"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("([uU]R)(\")"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("((?<=\")(\")|\")|(\\n)"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.double.python"))
                                                                 ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "invalid.illegal.unclosed-string.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.double.single-line.unicode-raw.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_double"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("([bB]r)(\")"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("((?<=\")(\")|\")|(\\n)"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.double.python"))
                                                                 ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "invalid.illegal.unclosed-string.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.double.single-line.bytes-raw-regex.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_double"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#regular_expressions"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("([bB]R)(\")"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("((?<=\")(\")|\")|(\\n)"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.double.python"))
                                                                 ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "invalid.illegal.unclosed-string.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.double.single-line.bytes-raw.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_double"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("(r)(\")"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("((?<=\")(\")|\")|(\\n)"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.double.python"))
                                                                 ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "invalid.illegal.unclosed-string.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.double.single-line.raw-regex.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_double"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#regular_expressions"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("(R)(\")"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("((?<=\")(\")|\")|(\\n)"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.double.python"))
                                                                 ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "invalid.illegal.unclosed-string.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.double.single-line.raw.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_double"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("([uU])(\")"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("comment",
                                                    `String ("double quoted unicode string"));
                                                   ("end",
                                                    `String ("((?<=\")(\")|\")|(\\n)"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.double.python"))
                                                                 ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "invalid.illegal.unclosed-string.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.double.single-line.unicode.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_unicode_char"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("([bB])(\")"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("comment",
                                                    `String ("double quoted bytes string"));
                                                   ("end",
                                                    `String ("((?<=\")(\")|\")|(\\n)"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.double.python"))
                                                                 ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "invalid.illegal.unclosed-string.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.double.single-line.bytes.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_unicode_char"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("(\"\"\")"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.begin.python"))
                                                                ]))
                                                              ]));
                                                   ("comment",
                                                    `String ("double quoted string"));
                                                   ("end",
                                                    `String ("((?<=\"\"\")(\")\"\"|\"\"\")"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.double.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.double.block.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_unicode_char"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin", `String ("(\")"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.begin.python"))
                                                                ]))
                                                              ]));
                                                   ("comment",
                                                    `String ("double quoted string"));
                                                   ("end",
                                                    `String ("((?<=\")(\")|\")|(\\n)"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.double.python"))
                                                                 ]));
                                                              ("3",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "invalid.illegal.unclosed-string.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.double.single-line.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_unicode_char"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char"))
                                                               ])
                                                             ]))
                                                   ])
                                         ]))
                                ]));
                     ("string_quoted_single",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("captures",
                                                  `Assoc ([("1",
                                                            `Assoc ([("name",
                                                                    `String (
                                                                    "punctuation.definition.string.begin.python"))
                                                                    ]));
                                                            ("2",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.string.end.python"))
                                                               ]));
                                                            ("3",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "meta.empty-string.single.python"))
                                                               ]))
                                                            ]));
                                                  ("match",
                                                   `String ("(?<!')(')(('))(?!')"));
                                                  ("name",
                                                   `String ("string.quoted.single.single-line.python"))
                                                  ]);
                                         `Assoc ([("begin",
                                                   `String ("([uU]r)(''')"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("((?<=''')(')''|''')"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.single.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.single.block.unicode-raw-regex.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_single"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#regular_expressions"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("([uU]R)(''')"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("((?<=''')(')''|''')"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.single.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.single.block.unicode-raw.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_single"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("([bB]r)(''')"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("((?<=''')(')''|''')"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.single.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.single.block.bytes-raw-regex.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_single"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#regular_expressions"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("([bB]R)(''')"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("((?<=''')(')''|''')"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.single.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.single.block.bytes-raw.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_single"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("(r)(''')"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("((?<=''')(')''|''')"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.single.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.single.block.raw-regex.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_single"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#regular_expressions"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("(R)(''')"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("((?<=''')(')''|''')"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.single.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.single.block.raw.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_single"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("([uU])(''')"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("((?<=''')(')''|''')"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.single.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.single.block.unicode.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_unicode_char"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("([bB])(''')"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("comment",
                                                    `String ("single quoted bytes string"));
                                                   ("end",
                                                    `String ("((?<=''')(')''|''')"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.single.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.single.block.bytes.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_unicode_char"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("([uU]r)(')"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("(')|(\\n)"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "invalid.illegal.unclosed-string.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.single.single-line.unicode-raw-regex.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_single"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#regular_expressions"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("([uU]R)(')"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("(')|(\\n)"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "invalid.illegal.unclosed-string.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.single.single-line.unicode-raw.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_single"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("([bB]r)(')"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("(')|(\\n)"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "invalid.illegal.unclosed-string.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.single.single-line.bytes-raw-regex.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_single"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#regular_expressions"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("([bB]R)(')"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("(')|(\\n)"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "invalid.illegal.unclosed-string.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.single.single-line.bytes-raw.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_single"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("(r)(')"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("(')|(\\n)"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "invalid.illegal.unclosed-string.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.single.single-line.raw-regex.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_single"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#regular_expressions"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("(R)(')"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("(')|(\\n)"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "invalid.illegal.unclosed-string.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.single.single-line.raw.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char_raw_single"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("([uU])(')"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("comment",
                                                    `String ("single quoted unicode string"));
                                                   ("end",
                                                    `String ("(')|(\\n)"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "invalid.illegal.unclosed-string.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.single.single-line.unicode.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_unicode_char"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin",
                                                   `String ("([bB])(')"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.python"))
                                                                 ]))
                                                              ]));
                                                   ("comment",
                                                    `String ("single quoted bytes string"));
                                                   ("end",
                                                    `String ("(')|(\\n)"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "invalid.illegal.unclosed-string.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.single.single-line.bytes.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_unicode_char"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin", `String ("(''')"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.begin.python"))
                                                                ]))
                                                              ]));
                                                   ("comment",
                                                    `String ("single quoted string"));
                                                   ("end",
                                                    `String ("((?<=''')(')''|''')"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.single.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.single.block.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_unicode_char"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char"))
                                                               ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin", `String ("(')"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.begin.python"))
                                                                ]))
                                                              ]));
                                                   ("comment",
                                                    `String ("single quoted string"));
                                                   ("end",
                                                    `String ("(')|(\\n)"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.python"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "invalid.illegal.unclosed-string.python"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.single.single-line.python"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#constant_placeholder"))
                                                                    ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_unicode_char"))
                                                               ]);
                                                             `Assoc (
                                                             [("include",
                                                               `String (
                                                               "#escaped_char"))
                                                               ])
                                                             ]))
                                                   ])
                                         ]))
                                ]));
                     ("strings",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("include",
                                                  `String ("#string_quoted_double"))
                                                  ]);
                                         `Assoc ([("include",
                                                   `String ("#string_quoted_single"))
                                                   ])
                                         ]))
                                ]))
                     ]));
          ("scopeName", `String ("source.python"));
          ("uuid", `String ("11B0273F-0284-4483-B17B-4B8D0A9294CC"))])


let go =
`Assoc ([("comment", `String ("Go language"));
          ("fileTypes", `List ([`String ("go")]));
          ("foldingStartMarker",
           `String ("(?x)/\\*\\*(?!\\*)|^(?![^{]*?//|[^{]*?/\\*(?!.*?\\*/.*?\\{)).*?\\{\\s*($|//|/\\*(?!.*?\\*/.*\\S))"));
          ("foldingStopMarker", `String ("(?<!\\*)\\*\\*/|^\\s*\\}"));
          ("keyEquivalent", `String ("^~G")); ("name", `String ("Go"));
          ("patterns",
           `List ([`Assoc ([("captures",
                             `Assoc ([("0",
                                       `Assoc ([("name",
                                                 `String ("punctuation.definition.comment.go"))
                                                 ]))
                                       ]));
                             ("match", `String ("/\\*\\*/"));
                             ("name", `String ("comment.block.empty.go"))]);
                    `Assoc ([("include", `String ("text.html.javadoc"))]);
                    `Assoc ([("begin",
                              `String ("(?x)^\\s*\n\t\t\t\t\t((?:\\b(public|private|protected|static|final|native|synchronized|abstract|export)\\b\\s*)*) # modifier\n\t\t\t\t\t(class|interface)\\s+\n\t\t\t\t\t(\\w+)\\s* # identifier\n\t\t\t\t\t(?:\\(\\s*([^\\)]+)\\s*\\)|)\\s* # Template type\n\t\t\t\t\t(?:\n\t\t\t\t\t  \\s*(:)\\s*\n\t\t\t\t\t  (\\w+)\n\t\t\t\t\t  (?:\\s*,\\s*(\\w+))?\n\t\t\t\t\t  (?:\\s*,\\s*(\\w+))?\n\t\t\t\t\t  (?:\\s*,\\s*(\\w+))?\n\t\t\t\t\t  (?:\\s*,\\s*(\\w+))?\n\t\t\t\t\t  (?:\\s*,\\s*(\\w+))?\n\t\t\t\t\t  (?:\\s*,\\s*(\\w+))?\n\t\t\t\t\t)? # super class\n\t\t\t\t\t"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("storage.modifier.go"))
                                                   ]));
                                         ("10",
                                          `Assoc ([("name",
                                                    `String ("entity.other.inherited-class.go"))
                                                    ]));
                                         ("11",
                                          `Assoc ([("name",
                                                    `String ("entity.other.inherited-class.go"))
                                                    ]));
                                         ("12",
                                          `Assoc ([("name",
                                                    `String ("entity.other.inherited-class.go"))
                                                    ]));
                                         ("13",
                                          `Assoc ([("name",
                                                    `String ("entity.other.inherited-class.go"))
                                                    ]));
                                         ("3",
                                          `Assoc ([("name",
                                                    `String ("storage.type.structure.go"))
                                                    ]));
                                         ("4",
                                          `Assoc ([("name",
                                                    `String ("entity.name.type.class.go"))
                                                    ]));
                                         ("5",
                                          `Assoc ([("name",
                                                    `String ("storage.type.template.go"))
                                                    ]));
                                         ("6",
                                          `Assoc ([("name",
                                                    `String ("punctuation.separator.inheritance.go"))
                                                    ]));
                                         ("7",
                                          `Assoc ([("name",
                                                    `String ("entity.other.inherited-class.go"))
                                                    ]));
                                         ("8",
                                          `Assoc ([("name",
                                                    `String ("entity.other.inherited-class.go"))
                                                    ]));
                                         ("9",
                                          `Assoc ([("name",
                                                    `String ("entity.other.inherited-class.go"))
                                                    ]))
                                         ]));
                              ("end", `String ("(?={)"));
                              ("name", `String ("meta.definition.class.go"));
                              ("patterns",
                               `List ([`Assoc ([("begin",
                                                 `String ("\\b(_|:)\\b"));
                                                 ("captures",
                                                  `Assoc ([("1",
                                                            `Assoc ([("name",
                                                                    `String (
                                                                    "storage.modifier.go"))
                                                                    ]))
                                                            ]));
                                                 ("end", `String ("(?={)"));
                                                 ("name",
                                                  `String ("meta.definition.class.extends.go"));
                                                 ("patterns",
                                                  `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#all-types"))
                                                                    ])
                                                           ]))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("begin",
                              `String ("(?x)^\\s*\n\t\t\t\t\t((?:\\b(public|private|protected|static|final|native|synchronized|abstract|export)\\b\\s*)*) # modifier\n\t\t\t\t\t(struct)\\s+\n\t\t\t\t\t(\\w+)\\s* # identifier\n\t\t\t\t\t(?:\\(\\s*([^\\)]+)\\s*\\)|)\\s* # Template type\n\t\t\t\t\t"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("storage.modifier.go"))
                                                   ]));
                                         ("3",
                                          `Assoc ([("name",
                                                    `String ("storage.type.structure.go"))
                                                    ]));
                                         ("4",
                                          `Assoc ([("name",
                                                    `String ("entity.name.type.struct.go"))
                                                    ]));
                                         ("5",
                                          `Assoc ([("name",
                                                    `String ("storage.type.template.go"))
                                                    ]))
                                         ]));
                              ("end", `String ("(?={)"));
                              ("name", `String ("meta.definition.struct.go"));
                              ("patterns",
                               `List ([`Assoc ([("begin",
                                                 `String ("\\b(_|:)\\b"));
                                                 ("captures",
                                                  `Assoc ([("1",
                                                            `Assoc ([("name",
                                                                    `String (
                                                                    "storage.modifier.go"))
                                                                    ]))
                                                            ]));
                                                 ("end", `String ("(?={)"));
                                                 ("name",
                                                  `String ("meta.definition.class.extends.go"));
                                                 ("patterns",
                                                  `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#all-types"))
                                                                    ])
                                                           ]))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("begin",
                              `String ("(?x)^\\s*\n\t\t\t\t\t((?:\\b(public|private|protected|static|final|native|synchronized|abstract|threadsafe|transient|export)\\b\\s*)*) # modifier\n\t\t\t\t\t(\\b(this))\\s* # identifier\n\t\t\t\t\t(?!.*;)  # abort if line has a ;\n\t\t\t\t\t(?=\\()"));
                              ("captures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("storage.modifier.go"))
                                                   ]));
                                         ("3",
                                          `Assoc ([("name",
                                                    `String ("entity.name.function.constructor.go"))
                                                    ]))
                                         ]));
                              ("end", `String ("(?={)"));
                              ("name",
                               `String ("meta.definition.constructor.go"));
                              ("patterns",
                               `List ([`Assoc ([("include", `String ("$base"))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("begin",
                              `String ("(?x)\n    \t\t\t\t(?:  ^                                 # begin-of-line\n    \t\t\t\t  |  (?: (?<!else|new|=) )             #  or word + space before name\n    \t\t\t\t)\n\t\t\t\t\t((?:\\b(?:public|private|protected|static|final|native|synchronized|abstract|threadsafe|transient|export)\\b\\s*)*) # modifier\n    \t\t\t\t(~this) # actual name\n    \t\t\t\t \\s*(\\()                           # start bracket or end-of-line\n    \t\t\t"));
                              ("captures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("storage.modifier.go"))
                                                   ]));
                                         ("2",
                                          `Assoc ([("name",
                                                    `String ("entity.name.function.destructor.go"))
                                                    ]))
                                         ]));
                              ("end", `String ("\\)"));
                              ("endCaptures",
                               `Assoc ([("0",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.parameters.go"))
                                                   ]))
                                         ]));
                              ("name",
                               `String ("meta.definition.destructor.go"));
                              ("patterns",
                               `List ([`Assoc ([("include", `String ("$base"))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("begin",
                              `String ("(?x)^\\s*\n\t\t\t\t\t((?:\\b(?:public|private|protected|static|final|native|lazy|synchronized|abstract|threadsafe|transient|export)\\b\\s*)*) # modifier\n\t\t\t\t\t(\\b(?:void|boolean|byte|char|short|int|float|long|double|[\\w_]+[\\w0-9_]*|(?:\\w+\\.)*[A-Z]\\w+)\\b(?:<(?:(?:(?:\\w+\\.)*[A-Z]\\w+)(?:\\s*,\\s*)?)+>|(?:\\[\\s*\\])*)?)\\s* # type\n\t\t\t\t\t(\\w+)\\s* # identifier\n\t\t\t\t\t(?!.*;)  # abort if line has a ;\n\t\t\t\t\t(?=\\()"));
                              ("beginCaptures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("storage.modifier.go"))
                                                   ]));
                                         ("2",
                                          `Assoc ([("name",
                                                    `String ("storage.type.structure.go"))
                                                    ]));
                                         ("3",
                                          `Assoc ([("name",
                                                    `String ("entity.name.function.go"))
                                                    ]))
                                         ]));
                              ("end", `String ("(?={)"));
                              ("name", `String ("meta.definition.method.go"));
                              ("patterns",
                               `List ([`Assoc ([("include", `String ("$base"))
                                                 ])
                                        ]))
                              ]);
                    `Assoc ([("match", `String ("\\b([A-Z][A-Z0-9_]+)\\b"));
                              ("name", `String ("constant.other.go"))]);
                    `Assoc ([("include", `String ("#comments"))]);
                    `Assoc ([("include", `String ("#all-types"))]);
                    `Assoc ([("match", `String ("<-"));
                              ("name",
                               `String ("constant.language.chsendrecv.go"))
                              ]);
                    `Assoc ([("match",
                              `String ("\\b(private|protected|public|export)\\b"));
                              ("name",
                               `String ("storage.modifier.access-control.go"))
                              ]);
                    `Assoc ([("match",
                              `String ("\\b(auto|static|override|final|const|abstract|volatile|synchronized|lazy|map|seq|gen)\\b"));
                              ("name", `String ("storage.modifier.go"))]);
                    `Assoc ([("match",
                              `String ("\\b(template|interface|class|enum|struct|union|range)\\b"));
                              ("name", `String ("storage.type.structure.go"))
                              ]);
                    `Assoc ([("match",
                              `String ("\\b(var|ushort|int|uint|long|ulong|float|void|byte|ubyte|double|bit|char|wchar|ucent|cent|short|bool|dchar|real|ireal|ifloat|idouble|creal|cfloat|cdouble|lazy)\\b"));
                              ("name", `String ("storage.type.go"))]);
                    `Assoc ([("match",
                              `String ("\\b(try|catch|finally|throw)\\b"));
                              ("name",
                               `String ("keyword.control.exception.go"))
                              ]);
                    `Assoc ([("match",
                              `String ("\\b(return|break|select|case|continue|default|do|while|for|switch|if|else)\\b"));
                              ("name", `String ("keyword.control.go"))]);
                    `Assoc ([("match",
                              `String ("\\b(if|else|switch|iftype)\\b"));
                              ("name",
                               `String ("keyword.control.conditional.go"))
                              ]);
                    `Assoc ([("match",
                              `String ("\\b(goto|break|continue|go)\\b"));
                              ("name", `String ("keyword.control.branch.go"))
                              ]);
                    `Assoc ([("match",
                              `String ("\\b(while|for|do|foreach(_reverse)?)\\b"));
                              ("name", `String ("keyword.control.repeat.go"))
                              ]);
                    `Assoc ([("match",
                              `String ("\\b(version|return|with|invariant|body|scope|in|ta|chan|out|inout|asm|mixin|delegate|type|func)\\b"));
                              ("name",
                               `String ("keyword.control.statement.go"))
                              ]);
                    `Assoc ([("match", `String ("\\b(pragma)\\b"));
                              ("name", `String ("keyword.control.pragma.go"))
                              ]);
                    `Assoc ([("match", `String ("\\b(alias|typedef)\\b"));
                              ("name", `String ("keyword.control.alias.go"))]);
                    `Assoc ([("match", `String ("\\b(import)\\b"));
                              ("name", `String ("keyword.control.import.go"))
                              ]);
                    `Assoc ([("captures",
                              `Assoc ([("1",
                                        `Assoc ([("name",
                                                  `String ("keyword.control.module.go"))
                                                  ]));
                                        ("2",
                                         `Assoc ([("name",
                                                   `String ("entity.name.function.package.go"))
                                                   ]))
                                        ]));
                              ("match",
                               `String ("^\\s*(module)\\s+([^ ;]+?);"));
                              ("name", `String ("meta.module.go"))]);
                    `Assoc ([("match", `String ("\\b(true|false)\\b"));
                              ("name",
                               `String ("constant.language.boolean.go"))
                              ]);
                    `Assoc ([("match",
                              `String ("\\b(__FILE__|__LINE__|__DATE__|__TIME__|__TIMESTAMP__|nil|_)\\b"));
                              ("name", `String ("constant.language.go"))]);
                    `Assoc ([("match", `String ("\\b(this|super)\\b"));
                              ("name", `String ("variable.language.go"))]);
                    `Assoc ([("match",
                              `String ("\\b((0(x|X)[0-9a-fA-F]*)|(([0-9]+\\.?[0-9]*)|(\\.[0-9]+))((e|E)(\\+|-)?[0-9]+)?)([LlFfUuDd]|UL|ul)?\\b"));
                              ("name", `String ("constant.numeric.go"))]);
                    `Assoc ([("include", `String ("#string_escaped_char"))]);
                    `Assoc ([("include", `String ("#strings"))]);
                    `Assoc ([("match", `String ("(==|!=|<=|>=|<>|<|>)"));
                              ("name",
                               `String ("keyword.operator.comparison.go"))
                              ]);
                    `Assoc ([("match", `String ("(\\-\\-|\\+\\+)"));
                              ("name",
                               `String ("keyword.operator.increment-decrement.go"))
                              ]);
                    `Assoc ([("match", `String ("(\\-|\\+|\\*|\\/|~|%)"));
                              ("name",
                               `String ("keyword.operator.arithmetic.go"))
                              ]);
                    `Assoc ([("match", `String ("(!|&&|\\|\\|)"));
                              ("name",
                               `String ("keyword.operator.logical.go"))
                              ]);
                    `Assoc ([("match",
                              `String ("\\b(opNeg|opCom|opPostInc|opPostDec|opCast|opAdd|opSub|opSub_r|opMul|opDiv|opDiv_r|opMod|opMod_r|opAnd|opOr|opXor|opShl|opShl_r|opShr|opShr_r|opUShr|opUShr_r|opCat|opCat_r|opEquals|opEquals|opCmp|opCmp|opCmp|opCmp|opAddAssign|opSubAssign|opMulAssign|opDivAssign|opModAssign|opAndAssign|opOrAssign|opXorAssign|opShlAssign|opShrAssign|opUShrAssign|opCatAssign|opIndex|opIndexAssign|opCall|opSlice|opSliceAssign|opPos|opAdd_r|opMul_r|opAnd_r|opOr_r|opXor_r)\\b"));
                              ("name",
                               `String ("keyword.operator.overload.go"))
                              ]);
                    `Assoc ([("match",
                              `String ("\\b(new|delete|typeof|typeid|cast|align|is|make|expect)\\b"));
                              ("name", `String ("keyword.operator.go"))]);
                    `Assoc ([("match", `String ("\\b(new|throws)\\b"));
                              ("name", `String ("keyword.other.class-fns.go"))
                              ]);
                    `Assoc ([("match", `String ("\\b(package|extern)\\b"));
                              ("name", `String ("keyword.other.external.go"))
                              ]);
                    `Assoc ([("match",
                              `String ("\\b(deprecated|unittest|debug)\\b"));
                              ("name", `String ("keyword.other.debug.go"))]);
                    `Assoc ([("match",
                              `String ("\\b(u_char|u_short|u_int|u_long|ushort|uint|u_quad_t|quad_t|qaddr_t|caddr_t|daddr_t|dev_t|fixpt_t|blkcnt_t|blksize_t|gid_t|in_addr_t|in_port_t|ino_t|key_t|mode_t|nlink_t|id_t|pid_t|off_t|segsz_t|swblk_t|uid_t|id_t|clock_t|size_t|ssize_t|time_t|useconds_t|suseconds_t)\\b"));
                              ("name", `String ("support.type.sys-types.c"))]);
                    `Assoc ([("match",
                              `String ("\\b(pthread_attr_t|pthread_cond_t|pthread_condattr_t|pthread_mutex_t|pthread_mutexattr_t|pthread_once_t|pthread_rwlock_t|pthread_rwlockattr_t|pthread_t|pthread_key_t)\\b"));
                              ("name", `String ("support.type.pthread.c"))]);
                    `Assoc ([("match",
                              `String ("\\b(int8|int16|int32|int64|uint8|uint16|uint32|uint64|int_least8|int_least16|int_least32|int_least64|uint_least8|uint_least16|uint_least32|uint_least64|int_fast8|int_fast16|int_fast32|int_fast64|uint_fast8|uint_fast16|uint_fast32|uint_fast64|intptr|uintptr|intmax|intmax|uintmax|uintmax|float64|float32)\\b"));
                              ("name", `String ("support.type.stdint.c"))])
                    ]));
          ("repository",
           `Assoc ([("all-types",
                     `Assoc ([("patterns",
                               `List ([`Assoc ([("include",
                                                 `String ("#support-type-built-ins-d"))
                                                 ]);
                                        `Assoc ([("include",
                                                  `String ("#storage-type-d"))
                                                  ])
                                        ]))
                               ]));
                     ("comments",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("begin", `String ("/\\*"));
                                                  ("captures",
                                                   `Assoc ([("0",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.comment.go"))
                                                               ]))
                                                             ]));
                                                  ("end", `String ("\\*/"));
                                                  ("name",
                                                   `String ("comment.block.go"))
                                                  ]);
                                         `Assoc ([("begin", `String ("/\\+"));
                                                   ("captures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.comment.go"))
                                                                ]))
                                                              ]));
                                                   ("end", `String ("\\+/"));
                                                   ("name",
                                                    `String ("comment.block.nested.go"))
                                                   ]);
                                         `Assoc ([("captures",
                                                   `Assoc ([("1",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.comment.go"))
                                                               ]))
                                                             ]));
                                                   ("match",
                                                    `String ("(//).*$\\n?"));
                                                   ("name",
                                                    `String ("comment.line.double-slash.go"))
                                                   ])
                                         ]))
                                ]));
                     ("constant_placeholder",
                      `Assoc ([("match",
                                `String ("(?i:%(\\([a-z_]+\\))?#?0?\\-?[ ]?\\+?([0-9]*|\\*)(\\.([0-9]*|\\*))?[hL]?[a-z%])"));
                                ("name",
                                 `String ("constant.other.placeholder.go"))
                                ]));
                     ("regular_expressions",
                      `Assoc ([("comment",
                                `String ("Change disabled to 1 to turn off syntax highlighting in \226\128\156r\226\128\157 strings."));
                                ("disabled", `Int (1));
                                ("patterns",
                                 `List ([`Assoc ([("include",
                                                   `String ("source.regexp.python"))
                                                   ])
                                          ]))
                                ]));
                     ("statement-remainder",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("begin", `String ("\\("));
                                                  ("end", `String ("(?=\\))"));
                                                  ("name",
                                                   `String ("meta.definition.param-list.go"));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#all-types"))
                                                                    ])
                                                            ]))
                                                  ]);
                                         `Assoc ([("begin",
                                                   `String ("(throws)"));
                                                   ("captures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "keyword.other.class-fns.go"))
                                                                ]))
                                                              ]));
                                                   ("end", `String ("(?={)"));
                                                   ("name",
                                                    `String ("meta.definition.throws.go"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#all-types"))
                                                                    ])
                                                             ]))
                                                   ])
                                         ]))
                                ]));
                     ("storage-type-d",
                      `Assoc ([("match",
                                `String ("\\b(void|byte|short|char|int|long|float|string|double|boolean|([a-z]\\w+\\.)*[A-Z]\\w+)\\b"));
                                ("name", `String ("storage.type.go"))]));
                     ("string_escaped_char",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("match",
                                                  `String ("\\\\(\\\\|[abefnprtv'\"?]|[0-3]\\d{,2}|x[0-9a-fA-F]{2}|u[0-9a-fA-F]{4}|U[0-9a-fA-F]{8}|&\\w+;)"));
                                                  ("name",
                                                   `String ("constant.character.escape.go"))
                                                  ]);
                                         `Assoc ([("match", `String ("\\\\."));
                                                   ("name",
                                                    `String ("invalid.illegal.unknown-escape.go"))
                                                   ])
                                         ]))
                                ]));
                     ("strings",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("begin", `String ("\""));
                                                  ("beginCaptures",
                                                   `Assoc ([("0",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.string.begin.go"))
                                                               ]))
                                                             ]));
                                                  ("end", `String ("\""));
                                                  ("endCaptures",
                                                   `Assoc ([("0",
                                                             `Assoc (
                                                             [("name",
                                                               `String (
                                                               "punctuation.definition.string.end.go"))
                                                               ]))
                                                             ]));
                                                  ("name",
                                                   `String ("string.quoted.double.go"));
                                                  ("patterns",
                                                   `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#string_escaped_char"))
                                                                    ])
                                                            ]))
                                                  ]);
                                         `Assoc ([("begin",
                                                   `String ("(r)(\")"));
                                                   ("beginCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "storage.type.string.go"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "punctuation.definition.string.begin.go"))
                                                                 ]))
                                                              ]));
                                                   ("end",
                                                    `String ("((?<=\")(\")|\")"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.go"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.double.go"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.double.raw.go"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#regular_expressions"))
                                                                    ])
                                                             ]))
                                                   ]);
                                         `Assoc ([("begin", `String ("`"));
                                                   ("beginCaptures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.begin.go"))
                                                                ]))
                                                              ]));
                                                   ("end",
                                                    `String ("((?<=`)(`)|`)"));
                                                   ("endCaptures",
                                                    `Assoc ([("1",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.go"))
                                                                ]));
                                                              ("2",
                                                               `Assoc (
                                                               [("name",
                                                                 `String (
                                                                 "meta.empty-string.double.go"))
                                                                 ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.double.raw.backtick.go"))
                                                   ]);
                                         `Assoc ([("begin", `String ("'"));
                                                   ("beginCaptures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.begin.go"))
                                                                ]))
                                                              ]));
                                                   ("end", `String ("'"));
                                                   ("endCaptures",
                                                    `Assoc ([("0",
                                                              `Assoc (
                                                              [("name",
                                                                `String (
                                                                "punctuation.definition.string.end.go"))
                                                                ]))
                                                              ]));
                                                   ("name",
                                                    `String ("string.quoted.single.go"));
                                                   ("patterns",
                                                    `List ([`Assoc ([("include",
                                                                    `String (
                                                                    "#string_escaped_char"))
                                                                    ])
                                                             ]))
                                                   ])
                                         ]))
                                ]));
                     ("support-type-built-ins-classes-d",
                      `Assoc ([("match",
                                `String ("\\b(print|println|assert|panic|panicln)\\b"));
                                ("name",
                                 `String ("support.type.built-ins.functions.go"))
                                ]));
                     ("support-type-built-ins-d",
                      `Assoc ([("patterns",
                                `List ([`Assoc ([("include",
                                                  `String ("#support-type-built-ins-exceptions-d"))
                                                  ]);
                                         `Assoc ([("include",
                                                   `String ("#support-type-built-ins-classes-d"))
                                                   ]);
                                         `Assoc ([("include",
                                                   `String ("#support-type-built-ins-interfaces-d"))
                                                   ]);
                                         `Assoc ([("include",
                                                   `String ("#support-type-built-ins-structs-d"))
                                                   ])
                                         ]))
                                ]));
                     ("support-type-built-ins-exceptions-d",
                      `Assoc ([("match", `String ("\\b(__todo__)\\b"));
                                ("name",
                                 `String ("support.type.built-ins.exceptions.go"))
                                ]));
                     ("support-type-built-ins-interfaces-d",
                      `Assoc ([("match", `String ("\\b(__todo__)\\b"));
                                ("name",
                                 `String ("support.type.built-ins.interfaces.go"))
                                ]));
                     ("support-type-built-ins-structs-d",
                      `Assoc ([("match", `String ("\\b(__todo__)\\b"));
                                ("name",
                                 `String ("support.type.built-ins.structs.go"))
                                ]))
                     ]));
          ("scopeName", `String ("source.go"));
          ("uuid", `String ("B64C47C0-FDE6-434B-A547-B6D05DC2CC90"))])


let diff =
`Assoc ([("fileTypes",
          `List ([`String ("patch"); `String ("diff"); `String ("rej")]));
          ("firstLineMatch",
           `String ("(?x)^\n\t\t(===\\ modified\\ file\n\t\t|==== \\s* // .+ \\s - \\s .+ \\s+ ====\n\t\t|Index:\\ \n\t\t|---\\ [^%\\n]\n\t\t|\\*\\*\\*.*\\d{4}\\s*$\n\t\t|\\d+(,\\d+)* (a|d|c) \\d+(,\\d+)* $\n\t\t|diff\\ --git\\ \n\t\t|commit\\ [0-9a-f]{40}$\n\t\t)"));
          ("keyEquivalent", `String ("^~D")); ("name", `String ("Diff"));
          ("patterns",
           `List ([`Assoc ([("captures",
                             `Assoc ([("1",
                                       `Assoc ([("name",
                                                 `String ("punctuation.definition.separator.diff"))
                                                 ]))
                                       ]));
                             ("match",
                              `String ("^((\\*{15})|(={67})|(-{3}))$\\n?"));
                             ("name", `String ("meta.separator.diff"))]);
                    `Assoc ([("match",
                              `String ("^\\d+(,\\d+)*(a|d|c)\\d+(,\\d+)*$\\n?"));
                              ("name", `String ("meta.diff.range.normal"))]);
                    `Assoc ([("captures",
                              `Assoc ([("1",
                                        `Assoc ([("name",
                                                  `String ("punctuation.definition.range.diff"))
                                                  ]));
                                        ("2",
                                         `Assoc ([("name",
                                                   `String ("meta.toc-list.line-number.diff"))
                                                   ]));
                                        ("3",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.range.diff"))
                                                   ]))
                                        ]));
                              ("match",
                               `String ("^(@@)\\s*(.+?)\\s*(@@)($\\n?)?"));
                              ("name", `String ("meta.diff.range.unified"))]);
                    `Assoc ([("captures",
                              `Assoc ([("3",
                                        `Assoc ([("name",
                                                  `String ("punctuation.definition.range.diff"))
                                                  ]));
                                        ("4",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.range.diff"))
                                                   ]));
                                        ("6",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.range.diff"))
                                                   ]));
                                        ("7",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.range.diff"))
                                                   ]))
                                        ]));
                              ("match",
                               `String ("^(((\\-{3}) .+ (\\-{4}))|((\\*{3}) .+ (\\*{4})))$\\n?"));
                              ("name", `String ("meta.diff.range.context"))]);
                    `Assoc ([("match", `String ("^diff --git a/.*$\\n?"));
                              ("name", `String ("meta.diff.header.git"))]);
                    `Assoc ([("match",
                              `String ("^diff (-|\\S+\\s+\\S+).*$\\n?"));
                              ("name", `String ("meta.diff.header.command"))]);
                    `Assoc ([("captures",
                              `Assoc ([("4",
                                        `Assoc ([("name",
                                                  `String ("punctuation.definition.from-file.diff"))
                                                  ]));
                                        ("6",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.from-file.diff"))
                                                   ]));
                                        ("7",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.from-file.diff"))
                                                   ]))
                                        ]));
                              ("match",
                               `String ("(^(((-{3}) .+)|((\\*{3}) .+))$\\n?|^(={4}) .+(?= - ))"));
                              ("name", `String ("meta.diff.header.from-file"))
                              ]);
                    `Assoc ([("captures",
                              `Assoc ([("2",
                                        `Assoc ([("name",
                                                  `String ("punctuation.definition.to-file.diff"))
                                                  ]));
                                        ("3",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.to-file.diff"))
                                                   ]));
                                        ("4",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.to-file.diff"))
                                                   ]))
                                        ]));
                              ("match",
                               `String ("(^(\\+{3}) .+$\\n?| (-) .* (={4})$\\n?)"));
                              ("name", `String ("meta.diff.header.to-file"))]);
                    `Assoc ([("captures",
                              `Assoc ([("3",
                                        `Assoc ([("name",
                                                  `String ("punctuation.definition.inserted.diff"))
                                                  ]));
                                        ("6",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.inserted.diff"))
                                                   ]))
                                        ]));
                              ("match",
                               `String ("^(((>)( .*)?)|((\\+).*))$\\n?"));
                              ("name", `String ("markup.inserted.diff"))]);
                    `Assoc ([("captures",
                              `Assoc ([("1",
                                        `Assoc ([("name",
                                                  `String ("punctuation.definition.inserted.diff"))
                                                  ]))
                                        ]));
                              ("match", `String ("^(!).*$\\n?"));
                              ("name", `String ("markup.changed.diff"))]);
                    `Assoc ([("captures",
                              `Assoc ([("3",
                                        `Assoc ([("name",
                                                  `String ("punctuation.definition.deleted.diff"))
                                                  ]));
                                        ("6",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.deleted.diff"))
                                                   ]))
                                        ]));
                              ("match",
                               `String ("^(((<)( .*)?)|((-).*))$\\n?"));
                              ("name", `String ("markup.deleted.diff"))]);
                    `Assoc ([("begin", `String ("^(#)"));
                              ("captures",
                               `Assoc ([("1",
                                         `Assoc ([("name",
                                                   `String ("punctuation.definition.comment.diff"))
                                                   ]))
                                         ]));
                              ("comment",
                               `String ("Git produces unified diffs with embedded comments\""));
                              ("end", `String ("\\n"));
                              ("name",
                               `String ("comment.line.number-sign.diff"))
                              ]);
                    `Assoc ([("match",
                              `String ("^index [0-9a-f]{7,40}\\.\\.[0-9a-f]{7,40}.*$\\n?"));
                              ("name", `String ("meta.diff.index.git"))]);
                    `Assoc ([("captures",
                              `Assoc ([("1",
                                        `Assoc ([("name",
                                                  `String ("punctuation.separator.key-value.diff"))
                                                  ]));
                                        ("2",
                                         `Assoc ([("name",
                                                   `String ("meta.toc-list.file-name.diff"))
                                                   ]))
                                        ]));
                              ("match", `String ("^Index(:) (.+)$\\n?"));
                              ("name", `String ("meta.diff.index"))]);
                    `Assoc ([("match", `String ("^Only in .*: .*$\\n?"));
                              ("name", `String ("meta.diff.only-in"))])
                    ]));
          ("scopeName", `String ("source.diff"));
          ("uuid", `String ("7E848FF4-708E-11D9-97B4-0011242E4184"))])

