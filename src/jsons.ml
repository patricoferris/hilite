let ocaml_interface =
  {|{
  "name": "OCaml Interface",
  "scopeName": "source.ocaml.interface",
  "fileTypes": ["mli", "eliomi"],
  "patterns": [
    { "include": "source.ocaml#directives" },
    { "include": "source.ocaml#comments" },
    { "include": "source.ocaml#attributes" },
    { "include": "source.ocaml#extensions" },
    { "include": "#bindings" },
    { "include": "source.ocaml#operators" },
    { "include": "#keywords" },
    { "include": "source.ocaml#types" },
    { "include": "source.ocaml#identifiers" }
  ],
  "repository": {
    "bindings": {
      "comment": "bindings that are shared between .ml and .mli syntaxes",
      "patterns": [
        {
          "comment": "optional labeled argument",
          "name": "variable.parameter.optional.ocaml",
          "match": "\\?([[:lower:]_][[:word:]']*)?"
        },
        {
          "comment": "labeled argument",
          "name": "variable.parameter.labeled.ocaml",
          "match": "~([[:lower:]_][[:word:]']*)?"
        },
        {
          "comment": "type declaration",
          "match": "\\b(type)[[:space:]]+(nonrec[[:space:]]+)?(_[[:space:]]+|[+-]?'[[:alpha:]][[:word:]']*[[:space:]]+|\\(.*\\)[[:space:]]+)?([[:lower:]_][[:word:]']*)",
          "captures": {
            "1": { "name": "keyword.ocaml" },
            "2": { "name": "keyword.ocaml" },
            "3": { "patterns": [{ "include": "$base" }] },
            "4": { "name": "entity.name.function.binding.ocaml" }
          }
        },
        {
          "comment": "and declaration for let bindings, type declarations, class bindings, class type definitions, or module constraints",
          "match": "\\b(and)[[:space:]]+(?!(?:module|type|lazy)\\b(?!'))(virtual[[:space:]]+)?(_[[:space:]]+|'[[:alpha:]][[:word:]']*[[:space:]]+|\\(.*\\)[[:space:]]+)?([[:lower:]_][[:word:]']*)(?![[:word:]'])[[:space:]]*(?!,|::|[[:space:]])",
          "captures": {
            "1": { "name": "keyword.ocaml" },
            "2": { "name": "keyword.ocaml" },
            "3": { "patterns": [{ "include": "$base" }] },
            "4": { "name": "entity.name.function.binding.ocaml" }
          }
        },
        {
          "comment": "external declaration",
          "begin": "\\b(external)[[:space:]]+([[:lower:]_][[:word:]']*)?",
          "beginCaptures": {
            "1": { "name": "keyword.ocaml" },
            "2": { "name": "entity.name.function.binding.ocaml" }
          },
          "end": "(?<=]|\")[[:space:]]*(?:$|(?=]))",
          "patterns": [
            {
              "comment": "string literal",
              "name": "string.quoted.double.ocaml",
              "begin": "\"",
              "end": "\""
            },
            { "include": "$base" }
          ]
        },
        {
          "comment": "val declaration for class instance variables",
          "match": "\\b(val)[[:space:]]+(virtual)[[:space:]]+(mutable)[[:space:]]+([[:lower:]_][[:word:]']*)",
          "captures": {
            "1": { "name": "keyword.ocaml" },
            "2": { "name": "keyword.ocaml" },
            "3": { "name": "keyword.ocaml" },
            "4": { "name": "entity.name.function.binding.ocaml" }
          }
        },
        {
          "comment": "val declaration for let bindings or class instance variables",
          "match": "\\b(val|val!)[[:space:]]+(mutable[[:space:]]+)?(virtual[[:space:]]+)?([[:lower:]_][[:word:]']*)",
          "captures": {
            "1": { "name": "keyword.ocaml" },
            "2": { "name": "keyword.ocaml" },
            "3": { "name": "keyword.ocaml" },
            "4": { "name": "entity.name.function.binding.ocaml" }
          }
        },
        {
          "comment": "class method declaration",
          "match": "\\b(method)[[:space:]]+(virtual)[[:space:]]+(private)[[:space:]]+([[:lower:]_][[:word:]']*)",
          "captures": {
            "1": { "name": "keyword.ocaml" },
            "2": { "name": "keyword.ocaml" },
            "3": { "name": "keyword.ocaml" },
            "4": { "name": "entity.name.function.binding.ocaml" }
          }
        },
        {
          "comment": "class method declaration",
          "match": "\\b(method|method!)[[:space:]]+(private[[:space:]]+)?(virtual[[:space:]]+)?([[:lower:]_][[:word:]']*)",
          "captures": {
            "1": { "name": "keyword.ocaml" },
            "2": { "name": "keyword.ocaml" },
            "3": { "name": "keyword.ocaml" },
            "4": { "name": "entity.name.function.binding.ocaml" }
          }
        },
        {
          "comment": "class specification or class type definition with type parameters",
          "match": "\\b(class)[[:space:]]*([[:space:]]+type)?([[:space:]]+virtual)?[[:space:]]*(\\[.*\\])[[:space:]]*([[:lower:]_][[:word:]']*)",
          "captures": {
            "1": { "name": "keyword.ocaml" },
            "2": { "name": "keyword.ocaml" },
            "3": { "name": "keyword.ocaml" },
            "4": { "patterns": [{ "include": "$base" }] },
            "5": { "name": "entity.name.function.binding.ocaml" }
          }
        },
        {
          "comment": "class specification or class type definition",
          "match": "\\b(class)[[:space:]]+(type[[:space:]]+)?(virtual[[:space:]]+)?([[:lower:]_][[:word:]']*)",
          "captures": {
            "1": { "name": "keyword.ocaml" },
            "2": { "name": "keyword.ocaml" },
            "3": { "name": "keyword.ocaml" },
            "4": { "name": "entity.name.function.binding.ocaml" }
          }
        },
        {
          "comment": "named self in object",
          "match": "\\b(object)[[:space:]]*\\([[:space:]]*([[:lower:]_][[:word:]']*)",
          "captures": {
            "1": { "name": "keyword.ocaml" },
            "2": { "name": "entity.name.function.binding.ocaml" }
          }
        },
        {
          "comment": "module type of",
          "begin": "\\b(module)[[:space:]]+(type)[[:space:]]+(of)\\b",
          "beginCaptures": {
            "1": { "name": "keyword.ocaml" },
            "2": { "name": "keyword.ocaml" },
            "3": { "name": "keyword.ocaml" }
          },
          "end": "(?=val|external|type|exception|class|module|open|include|=)",
          "patterns": [{ "include": "source.ocaml" }]
        }
      ]
    },

    "keywords": {
      "patterns": [
        {
          "comment": "reserved ocaml keyword (in interfaces)",
          "name": "keyword.other.ocaml.interface",
          "match": "\\b(and|as|class|constraint|end|exception|external|functor|in|include|inherit|let[[:space:]]+open|method|module|mutable|nonrec|object|of|open|private|rec|sig|type|val|virtual|with)\\b(?!')"
        }
      ]
    }
  }
}
|}

let ocaml =
  {|{
  "name": "OCaml",
  "scopeName": "source.ocaml",
  "fileTypes": ["ml", "eliom", ".ocamlinit"],
  "patterns": [
    { "include": "#directives" },
    { "include": "#comments" },
    { "include": "#strings" },
    { "include": "#characters" },
    { "include": "#attributes" },
    { "include": "#extensions" },
    { "include": "#modules" },
    { "include": "#bindings" },
    { "include": "#operators" },
    { "include": "#keywords" },
    { "include": "#literals" },
    { "include": "#types" },
    { "include": "#identifiers" }
  ],
  "repository": {
    "directives": {
      "patterns": [
        {
          "comment": "line number directive",
          "begin": "^[[:space:]]*(#)[[:space:]]*([[:digit:]]+)",
          "end": "$",
          "beginCaptures": {
            "1": { "name": "keyword.other.ocaml" },
            "2": { "name": "constant.numeric.decimal.integer.ocaml" }
          },
          "contentName": "comment.line.directive.ocaml"
        },
            {
              "comment": "general, loading codes",
              "begin": "^[[:space:]]*(#)[[:space:]]*(help|quit|cd|directory|remove_directory|load_rec|load|use|mod_use)",
              "end": "$",
              "beginCaptures": {
                "1": { "name": "keyword.other.ocaml" },
                "2": { "name": "keyword.other.ocaml" }
              },
              "patterns": [{ "include": "#strings" }]
            },
            {
              "comment": "environment queries",
              "begin": "^[[:space:]]*(#)[[:space:]]*(show_class_type|show_class|show_exception|show_module_type|show_module|show_type|show_val|show)",
              "end": "$",
              "beginCaptures": {
                "1": { "name": "keyword.other.ocaml" },
                "2": { "name": "keyword.other.ocaml" }
              },
              "patterns": [
                { "include": "#types" },
                { "include": "#identifiers" }
              ]
            },
            {
              "comment": "pretty-printing, tracing",
              "begin": "^[[:space:]]*(#)[[:space:]]*(install_printer|print_depth|print_length|remove_printer|trace|untrace_all|untrace)",
              "end": "$",
              "beginCaptures": {
                "1": { "name": "keyword.other.ocaml" },
                "2": { "name": "keyword.other.ocaml" }
              },
              "patterns": [
                { "include": "#literals" },
                { "include": "#identifiers" }
              ]
            },
            {
              "comment": "compiler options",
              "begin": "^[[:space:]]*(#)[[:space:]]*(labels|ppx|principal|rectypes|warn_error|warnings)",
              "end": "$",
              "beginCaptures": {
                "1": { "name": "keyword.other.ocaml" },
                "2": { "name": "keyword.other.ocaml" }
              },
              "patterns": [
                { "include": "#strings" },
                { "include": "#literals" }
              ]
            },
        {
          "comment": "topfind directives",
          "begin": "^[[:space:]]*(#)[[:space:]]*(require|list|camlp4o|camlp4r|predicates|thread)",
          "end": "$",
          "beginCaptures": {
            "1": { "name": "keyword.other.ocaml" },
            "2": { "name": "keyword.other.ocaml" }
          },
          "patterns": [{ "include": "#strings" }]
        },
        {
          "comment": "cppo directives",
          "begin": "^[[:space:]]*(#)[[:space:]]*(define|undef|ifdef|ifndef|if|else|elif|endif|include|warning|error|ext|endext)",
          "end": "$",
          "beginCaptures": {
            "1": { "name": "keyword.other.ocaml" },
            "2": { "name": "keyword.other.ocaml" }
          },
          "patterns": [
            { "name": "keyword.other.ocaml", "match": "\\b(defined)\\b" },
            { "name": "keyword.other.ocaml", "match": "\\\\" },
            { "include": "#comments" },
            { "include": "#strings" },
            { "include": "#characters" },
            { "include": "#keywords" },
            { "include": "#operators" },
            { "include": "#literals" },
            { "include": "#types" },
            { "include": "#identifiers" }
          ]
        }
      ]
    },

    "comments": {
      "patterns": [
        {
          "comment": "empty comment",
          "name": "comment.block.ocaml",
          "match": "\\(\\*\\*\\)"
        },
        {
          "comment": "ocamldoc comment",
          "name": "comment.doc.ocaml",
          "begin": "\\(\\*\\*",
          "end": "\\*\\)",
          "patterns": [
            { "include": "source.ocaml.ocamldoc#markup" },
            { "include": "#strings-in-comments" },
            { "include": "#comments" }
          ]
        },
        {
          "comment": "Cinaps comment",
          "begin": "\\(\\*\\$",
          "end": "\\*\\)",
          "beginCaptures": {"1" : { "name": "comment.cinaps.ocaml" }},
          "endCaptures": {"1" : { "name": "comment.cinaps.ocaml" }},
          "patterns": [{ "include": "$self" }]
        },
        {
          "comment": "block comment",
          "name": "comment.block.ocaml",
          "begin": "\\(\\*",
          "end": "\\*\\)",
          "patterns": [
            { "include": "#strings-in-comments" },
            { "include": "#comments" }
          ]
        }
      ]
    },

    "strings-in-comments": {
      "patterns": [
        {
          "comment": "char literal",
          "match": "'(\\\\)?.'"
        },
        {
          "comment": "string literal",
          "begin": "\"",
          "end": "\"",
          "patterns": [{ "match": "\\\\\\\\" }, { "match": "\\\\\"" }]
        },
        {
          "comment": "quoted string literal",
          "begin": "\\{[[:lower:]_]*\\|",
          "end": "\\|[[:lower:]_]*\\}"
        }
      ]
    },

    "strings": {
      "patterns": [
        {
          "comment": "quoted string literal",
          "name": "string.quoted.braced.ocaml",
          "begin": "\\{(%%?[[:alpha:]_][[:word:]']*(\\.[[:alpha:]_][[:word:]']*)*[[:space:]]*)?[[:lower:]_]*\\|",
          "end": "\\|[[:lower:]_]*\\}",
          "beginCaptures": {
            "1": { "name": "keyword.other.extension.ocaml" }
          }
        },
        {
          "comment": "string literal",
          "name": "string.quoted.double.ocaml",
          "begin": "\"",
          "end": "\"",
          "patterns": [
            {
              "comment": "escaped newline",
              "name": "constant.character.escape.ocaml",
              "match": "\\\\$"
            },
            {
              "comment": "escaped backslash",
              "name": "constant.character.escape.ocaml",
              "match": "\\\\\\\\"
            },
            {
              "comment": "escaped quote or whitespace",
              "name": "constant.character.escape.ocaml",
              "match": "\\\\[\"'ntbr ]"
            },
            {
              "comment": "character from decimal ASCII code",
              "name": "constant.character.escape.ocaml",
              "match": "\\\\[[:digit:]]{3}"
            },
            {
              "comment": "character from hexadecimal ASCII code",
              "name": "constant.character.escape.ocaml",
              "match": "\\\\x[[:xdigit:]]{2}"
            },
            {
              "comment": "character from octal ASCII code",
              "name": "constant.character.escape.ocaml",
              "match": "\\\\o[0-3][0-7]{2}"
            },
            {
              "comment": "unicode character escape sequence",
              "name": "constant.character.escape.ocaml",
              "match": "\\\\u\\{[[:xdigit:]]{1,6}\\}"
            },
            {
              "comment": "printf format string",
              "name": "constant.character.printf.ocaml",
              "match": "%[-0+ #]*([[:digit:]]+|\\*)?(.([[:digit:]]+|\\*))?[lLn]?[diunlLNxXosScCfFeEgGhHBbat!%@,]"
            },
            {
              "comment": "unknown escape sequence",
              "name": "invalid.illegal.unknown-escape.ocaml",
              "match": "\\\\."
            }
          ]
        }
      ]
    },

    "characters": {
      "patterns": [
        {
          "comment": "character literal from escaped backslash",
          "name": "string.quoted.single.ocaml",
          "match": "'(\\\\\\\\)'",
          "captures": { "1": { "name": "constant.character.escape.ocaml" } }
        },
        {
          "comment": "character literal from escaped quote or whitespace",
          "name": "string.quoted.single.ocaml",
          "match": "'(\\\\[\"'ntbr ])'",
          "captures": { "1": { "name": "constant.character.escape.ocaml" } }
        },
        {
          "comment": "character literal from decimal ASCII code",
          "name": "string.quoted.single.ocaml",
          "match": "'(\\\\[[:digit:]]{3})'",
          "captures": { "1": { "name": "constant.character.escape.ocaml" } }
        },
        {
          "comment": "character literal from hexadecimal ASCII code",
          "name": "string.quoted.single.ocaml",
          "match": "'(\\\\x[[:xdigit:]]{2})'",
          "captures": { "1": { "name": "constant.character.escape.ocaml" } }
        },
        {
          "comment": "character literal from octal ASCII code",
          "name": "string.quoted.single.ocaml",
          "match": "'(\\\\o[0-3][0-7]{2})'",
          "captures": { "1": { "name": "constant.character.escape.ocaml" } }
        },
        {
          "comment": "character literal from unknown escape sequence",
          "name": "string.quoted.single.ocaml",
          "match": "'(\\\\.)'",
          "captures": {
            "1": { "name": "invalid.illegal.unknown-escape.ocaml" }
          }
        },
        {
          "comment": "character literal",
          "name": "string.quoted.single.ocaml",
          "match": "'.'"
        }
      ]
    },

    "attributes": {
      "begin": "\\[(@|@@|@@@)[[:space:]]*([[:alpha:]_]+(\\.[[:word:]']+)*)",
      "end": "\\]",
      "beginCaptures": {
        "1": { "name": "keyword.operator.attribute.ocaml" },
        "2": {
          "name": "keyword.other.attribute.ocaml",
          "patterns": [
            {
              "name": "keyword.other.ocaml punctuation.other.period punctuation.separator.period",
              "match": "\\."
            }
          ]
        }
      },
      "patterns": [{ "include": "$self" }]
    },

    "extensions": {
      "begin": "\\[(%|%%)[[:space:]]*([[:alpha:]_]+(\\.[[:word:]']+)*)",
      "end": "\\]",
      "beginCaptures": {
        "1": { "name": "keyword.operator.extension.ocaml" },
        "2": {
          "name": "keyword.other.extension.ocaml",
          "patterns": [
            {
              "name": "keyword.other.ocaml punctuation.other.period punctuation.separator.period",
              "match": "\\."
            }
          ]
        }
      },
      "patterns": [{ "include": "$self" }]
    },

    "modules": {
      "patterns": [
        {
          "begin": "\\b(sig)\\b",
          "end": "\\b(end)\\b",
          "beginCaptures": {"1" : { "name": "keyword.other.ocaml" }},
          "endCaptures": {"1" : { "name": "keyword.other.ocaml" }},
          "patterns": [{ "include": "source.ocaml.interface" }]
        },
        {
          "begin": "\\b(struct)\\b",
          "end": "\\b(end)\\b",
          "beginCaptures": {"1" : { "name": "keyword.other.ocaml" }},
          "endCaptures": { "1" : { "name": "keyword.other.ocaml" }},
          "patterns": [{ "include": "$self" }]
        }
      ]
    },

    "bindings": {
      "patterns": [
        {
          "comment": "for loop",
          "match": "\\b(for)[[:space:]]+([[:lower:]_][[:word:]']*)",
          "captures": {
            "1": { "name": "keyword.ocaml" },
            "2": { "name": "entity.name.function.binding.ocaml" }
          }
        },
        {
          "comment": "local open/exception/module",
          "match": "\\b(let)[[:space:]]+(open|exception|module)\\b(?!')",
          "captures": {
            "1": { "name": "keyword.ocaml" },
            "2": { "name": "keyword.ocaml" }
          }
        },
        {
          "comment": "let expression",
          "match": "\\b(let)[[:space:]]+(?!lazy\\b(?!'))(rec[[:space:]]+)?(?!rec\\b(?!'))([[:lower:]_][[:word:]']*)(?![[:word:]'])[[:space:]]*(?!,|::|[[:space:]])",
          "captures": {
            "1": { "name": "keyword.ocaml" },
            "2": { "name": "keyword.ocaml" },
            "3": { "name": "entity.name.function.binding.ocaml" }
          }
        },
        {
          "comment": "using binding operators",
          "match": "\\b(let|and)([$&*+\\-/=>@^|<][!?$&*+\\-/=>@^|%:]*)[[:space:]]*(?!lazy\\b(?!'))([[:lower:]_][[:word:]']*)(?![[:word:]'])[[:space:]]*(?!,|::|[[:space:]])",
          "captures": {
            "1": { "name": "keyword.ocaml" },
            "2": { "name": "keyword.ocaml" },
            "3": { "name": "entity.name.function.binding.ocaml" }
          }
        },
        {
          "comment": "first class module packing",
          "match": "\\([[:space:]]*(val)[[:space:]]+([[:lower:]_][[:word:]']*)",
          "captures": {
            "1": { "name": "keyword.ocaml" },
            "2": { "patterns": [{ "include": "$self" }] }
          }
        },
        {
          "comment": "locally abstract types",
          "match": "(?:\\(|(:))[[:space:]]*(type)((?:[[:space:]]+[[:lower:]_][[:word:]']*)+)",
          "captures": {
            "1": {
              "name": "keyword.other.ocaml punctuation.other.colon punctuation.colon"
            },
            "2": { "name": "keyword.ocaml" },
            "3": { "name": "entity.name.function.binding.ocaml" }
          }
        },
        {
          "comment": "optional labeled argument with type",
          "begin": "(\\?)\\([[:space:]]*([[:lower:]_][[:word:]']*)",
          "beginCaptures": {
            "1": { "name": "variable.parameter.optional.ocaml" },
            "2": { "name": "variable.parameter.optional.ocaml" }
          },
          "end": "\\)",
          "patterns": [{ "include": "$self" }]
        },
        {
          "comment": "labeled argument with type",
          "begin": "(~)\\([[:space:]]*([[:lower:]_][[:word:]']*)",
          "beginCaptures": {
            "1": { "name": "variable.parameter.labeled.ocaml" },
            "2": { "name": "variable.parameter.labeled.ocaml" }
          },
          "end": "\\)",
          "patterns": [{ "include": "$self" }]
        },
        { "include": "source.ocaml.interface#bindings" }
      ]
    },

    "operators": {
      "patterns": [
        {
          "comment": "binding operator",
          "name": "keyword.ocaml",
          "match": "\\b(let|and)[$&*+\\-/=>@^|<][!?$&*+\\-/=>@^|%:]*"
        },
        {
          "comment": "infix symbol",
          "name": "keyword.operator.ocaml",
          "match": "[$&*+\\-/=>@^%<][~!?$&*+\\-/=>@^|%<:.]*"
        },
        {
          "comment": "infix symbol that begins with vertical bar",
          "name": "keyword.operator.ocaml",
          "match": "\\|[~!?$&*+\\-/=>@^|%<:.]+"
        },
        {
          "comment": "vertical bar",
          "name": "keyword.other.ocaml",
          "match": "(?<!\\[)(\\|)(?!\\])"
        },
        {
          "comment": "infix symbol",
          "name": "keyword.operator.ocaml",
          "match": "#[~!?$&*+\\-/=>@^|%<:.]+"
        },
        {
          "comment": "prefix symbol",
          "name": "keyword.operator.ocaml",
          "match": "![~!?$&*+\\-/=>@^|%<:.]*"
        },
        {
          "comment": "prefix symbol",
          "name": "keyword.operator.ocaml",
          "match": "[?~][~!?$&*+\\-/=>@^|%<:.]+"
        },
        {
          "comment": "named operator",
          "name": "keyword.operator.ocaml",
          "match": "\\b(or|mod|land|lor|lxor|lsl|lsr|asr)\\b"
        },
        {
          "comment": "method invocation",
          "name": "keyword.other.ocaml",
          "match": "#"
        },
        {
          "comment": "type annotation",
          "name": "keyword.other.ocaml punctuation.other.colon punctuation.colon",
          "match": ":"
        },
        {
          "comment": "field accessor",
          "name": "keyword.other.ocaml punctuation.other.period punctuation.separator.period",
          "match": "\\."
        },
        {
          "comment": "semicolon separator",
          "name": "keyword.other.ocaml punctuation.separator.terminator punctuation.separator.semicolon",
          "match": ";"
        },
        {
          "comment": "comma separator",
          "name": "keyword.other.ocaml punctuation.comma punctuation.separator.comma",
          "match": ","
        }
      ]
    },

    "keywords": {
      "patterns": [
        {
          "comment": "reserved ocaml keyword",
          "name": "keyword.other.ocaml",
          "match": "\\b(and|as|assert|begin|class|constraint|do|done|downto|else|end|exception|external|for|fun|function|functor|if|in|include|inherit|initializer|lazy|let|match|method|module|mutable|new|nonrec|object|of|open|private|rec|sig|struct|then|to|try|type|val|virtual|when|while|with)\\b(?!')"
        }
      ]
    },

    "literals": {
      "patterns": [
        {
          "comment": "boolean literal",
          "name": "constant.language.boolean.ocaml",
          "match": "\\b(true|false)\\b"
        },

        {
          "comment": "floating point decimal literal with exponent",
          "name": "constant.numeric.decimal.float.ocaml",
          "match": "\\b([[:digit:]][[:digit:]_]*(\\.[[:digit:]_]*)?[eE][+-]?[[:digit:]][[:digit:]_]*[g-zG-Z]?)\\b"
        },
        {
          "comment": "floating point decimal literal",
          "name": "constant.numeric.decimal.float.ocaml",
          "match": "\\b([[:digit:]][[:digit:]_]*)(\\.[[:digit:]_]*[g-zG-Z]?\\b|\\.)"
        },
        {
          "comment": "floating point hexadecimal literal with exponent part",
          "name": "constant.numeric.hexadecimal.float.ocaml",
          "match": "\\b((0x|0X)[[:xdigit:]][[:xdigit:]_]*(\\.[[:xdigit:]_]*)?[pP][+-]?[[:digit:]][[:digit:]_]*[g-zG-Z]?)\\b"
        },
        {
          "comment": "floating point hexadecimal literal",
          "name": "constant.numeric.hexadecimal.float.ocaml",
          "match": "\\b((0x|0X)[[:xdigit:]][[:xdigit:]_]*)(\\.[[:xdigit:]_]*[g-zG-Z]?\\b|\\.)"
        },

        {
          "comment": "decimal integer literal",
          "name": "constant.numeric.decimal.integer.ocaml",
          "match": "\\b([[:digit:]][[:digit:]_]*[lLng-zG-Z]?)\\b"
        },
        {
          "comment": "hexadecimal integer literal",
          "name": "constant.numeric.hexadecimal.integer.ocaml",
          "match": "\\b((0x|0X)[[:xdigit:]][[:xdigit:]_]*[lLng-zG-Z]?)\\b"
        },
        {
          "comment": "octal integer literal",
          "name": "constant.numeric.octal.integer.ocaml",
          "match": "\\b((0o|0O)[0-7][0-7_]*[lLng-zG-Z]?)\\b"
        },

        {
          "comment": "binary integer literal",
          "name": "constant.numeric.binary.integer.ocaml",
          "match": "\\b((0b|0B)[0-1][0-1_]*[lLng-zG-Z]?)\\b"
        },

        {
          "comment": "unit literal",
          "name": "constant.language.unit.ocaml",
          "match": "\\(\\)"
        },
        {
          "comment": "parentheses",
          "begin": "\\(",
          "end": "\\)",
          "patterns": [{ "include": "$self" }]
        },

        {
          "comment": "empty array",
          "name": "constant.language.array.ocaml",
          "match": "\\[\\|\\|\\]"
        },
        {
          "comment": "array",
          "begin": "\\[\\|",
          "end": "\\|\\]",
          "patterns": [{ "include": "$self" }]
        },

        {
          "comment": "empty list",
          "name": "constant.language.list.ocaml",
          "match": "\\[\\]"
        },
        {
          "comment": "list",
          "begin": "\\[",
          "end": "]",
          "patterns": [{ "include": "$self" }]
        },
        {
          "comment": "braces",
          "begin": "\\{",
          "end": "\\}",
          "patterns": [{ "include": "$self" }]
        }
      ]
    },

    "types": {
      "patterns": [
        {
          "comment": "type parameter",
          "name": "storage.type.ocaml",
          "match": "'[[:alpha:]][[:word:]']*\\b|'_\\b"
        },
        {
          "comment": "weak type parameter",
          "name": "storage.type.weak.ocaml",
          "match": "'_[[:alpha:]][[:word:]']*\\b"
        },
        {
          "comment": "builtin type",
          "name": "support.type.ocaml",
          "match": "\\b(unit|bool|int|int32|int64|nativeint|float|char|bytes|string)\\b"
        }
      ]
    },

    "identifiers": {
      "patterns": [
        {
          "comment": "wildcard underscore",
          "name": "constant.language.ocaml",
          "match": "\\b_\\b"
        },
        {
          "comment": "capital identifier for constructor, exception, or module",
          "name": "constant.language.capital-identifier.ocaml",
          "match": "\\b[[:upper:]][[:word:]']*('|\\b)"
        },
        {
          "comment": "lowercase identifier",
          "name": "source.ocaml",
          "match": "\\b[[:lower:]_][[:word:]']*('|\\b)"
        },
        {
          "comment": "polymorphic variant tag",
          "name": "constant.language.polymorphic-variant.ocaml",
          "match": "\\`[[:alpha:]][[:word:]']*\\b"
        },
        {
          "comment": "empty list (can be used as a constructor)",
          "name": "constant.language.list.ocaml",
          "match": "\\[\\]"
        }
      ]
    }
  }
}
|}

let dune =
  {|{
  "name": "dune",
  "scopeName": "source.dune",
  "fileTypes": [
    "dune",
    "jbuild"
  ],
  "patterns": [
    {
      "include": "#comments"
    },
    {
      "name": "meta.stanza.dune",
      "begin": "\\([[:space:]]*(library|rule|executable|executables|rule|ocamllex|ocamlyacc|menhir|install|alias|copy_files|copy_files#|jbuild_version|include)[[:space:]]",
      "end": "\\)",
      "beginCaptures": {
        "1": {
          "name": "meta.class.stanza.dune"
        }
      },
      "patterns": [
        {
          "include": "$self"
        }
      ]
    },
    {
      "name": "meta.stanza.library.field.dune",
      "begin": "\\([[:space:]]*(name|public_name|synopsis|install_c_headers|ppx_runtime_libraries|c_flags|cxx_flags|c_names|cxx_names|library_flags|c_library_flags|virtual_deps|modes|kind|wrapped|optional|self_build_stubs_archive|no_dynlink|ppx\\.driver)[[:space:]]",
      "end": "\\)",
      "beginCaptures": {
        "1": {
          "name": "keyword.other.dune"
        }
      },
      "patterns": [
        {
          "include": "$self"
        }
      ]
    },
    {
      "name": "meta.stanza.rule.dune",
      "begin": "\\([[:space:]]*(targets|deps|locks|loc|mode|action)[[:space:]]",
      "beginCaptures": {
        "1": {
          "name": "keyword.other.dune"
        }
      },
      "end": "\\)",
      "patterns": [
        {
          "include": "$self"
        }
      ]
    },
    {
      "name": "meta.mono-sexp.dune",
      "match": "\\([[:space:]]*(fallback|optional)[[:space:]]*\\)",
      "captures": {
        "1": {
          "name": "keyword.other.dune"
        }
      }
    },
    {
      "name": "meta.stanza.rule.action.dune",
      "begin": "\\([[:space:]]*(run|chdir|setenv|with-stdout-to|with-stderr-to|with-outputs-to|ignore-stdout|ignore-stderr|ignore-outputs|progn|echo|cat|copy|copy#|system|bash|write-file|diff|diff\\?)[[:space:]]",
      "end": "\\)",
      "beginCaptures": {
        "1": {
          "name": "entity.name.function.action.dune"
        }
      },
      "patterns": [
        {
          "include": "$self"
        }
      ]
    },
    {
      "name": "meta.stanza.install.dune",
      "begin": "\\([[:space:]]*(section)[[:space:]]",
      "end": "\\)",
      "beginCaptures": {
        "1": {
          "name": "keyword.other.dune"
        }
      },
      "patterns": [
        {
          "name": "constant.language.rule.mode.dune",
          "match": "\\b(lib|libexec|bin|sbin|toplevel|share|share_root|etc|doc|stublibs|man|misc)\\b"
        }
      ]
    },
    {
      "name": "meta.stanza.install.dune",
      "begin": "\\([[:space:]]*(files)[[:space:]]",
      "end": "\\)",
      "beginCaptures": {
        "1": {
          "name": "keyword.other.dune"
        }
      },
      "patterns": [
        {
          "include": "$self"
        }
      ]
    },
    {
      "name": "meta.library.kind.dune",
      "begin": "\\([[:space:]]*(normal|ppx_deriver|ppx_rewriter)[[:space:]]",
      "end": "\\)",
      "beginCaptures": {
        "1": {
          "name": "constant.language.rule.mode.dune"
        }
      }
    },
    {
      "name": "meta.stanza.executables.dune",
      "begin": "\\([[:space:]]*(name|link_executables|link_flags|modes)[[:space:]]",
      "end": "\\)",
      "beginCaptures": {
        "1": {
          "name": "keyword.other.dune"
        }
      },
      "patterns": [
        {
          "include": "$self"
        }
      ]
    },
    {
      "name": "meta.stanza.lib-or-exec.buildable.dune",
      "begin": "\\([[:space:]]*(preprocess|preprocessor_deps|lint|modules|modules_without_implementation|libraries|flags|ocamlc_flags|ocamlopt_flags|js_of_ocaml|allow_overlapping_dependencies|per_module)[[:space:]]",
      "end": "\\)",
      "beginCaptures": {
        "1": {
          "name": "keyword.other.dune"
        }
      },
      "patterns": [
        {
          "include": "$self"
        }
      ]
    },
    {
      "name": "meta.stanza.lib-or-exec.buildable.preprocess.dune",
      "begin": "\\([[:space:]]*(no_preprocessing|action|pps)[[:space:]]",
      "end": "\\)",
      "beginCaptures": {
        "1": {
          "name": "keyword.other.dune"
        }
      },
      "patterns": [
        {
          "include": "$self"
        }
      ]
    },
    {
      "name": "meta.stanza.lib-or-exec.buildable.preprocess_deps.dune",
      "begin": "\\([[:space:]]*(file|alias|alias_rec|glob_files|files_recursively_in)[[:space:]]",
      "end": "\\)",
      "beginCaptures": {
        "1": {
          "name": "keyword.other.dune"
        }
      },
      "patterns": [
        {
          "include": "$self"
        }
      ]
    },
    {
      "name": "meta.stanza.lib-or-exec.buildable.libraries.dune",
      "begin": "\\([[:space:]]*(select)[[:space:]]",
      "end": "\\)",
      "beginCaptures": {
        "1": {
          "name": "keyword.other.dune"
        }
      },
      "patterns": [
        {
          "include": "$self"
        }
      ]
    },
    {
      "name": "constant.numeric.dune",
      "match": "\\b\\d+\\b"
    },
    {
      "name": "constant.language.dune",
      "match": "(true|false)"
    },
    {
      "name": "keyword.other.dune",
      "match": "[[:space:]](as|from|->)[[:space:]]"
    },
    {
      "name": "keyword.other.dune",
      "match": "(\\!)"
    },
    {
      "name": "constant.language.flag.dune",
      "match": "(:\\w+)\\b"
    },
    {
      "name": "constant.language.rule.mode.dune",
      "match": "\\b(standard|fallback|promote|promote-until-then)\\b"
    },
    {
      "include": "#string"
    },
    {
      "include": "#variable"
    },
    {
      "include": "#list"
    },
    {
      "include": "#atom"
    }
  ],
  "repository": {
    "comments": {
      "patterns": [
        {
          "name": "comment.block.dune",
          "begin": "#\\|",
          "beginCaptures": {
            "0": {
              "name": "punctuation.definition.comment.begin.dune"
            }
          },
          "end": "\\|#",
          "endCaptures": {
            "0": {
              "name": "punctuation.definition.comment.end.dune"
            }
          },
          "patterns": [
            {
              "include": "#comments"
            }
          ]
        },
        {
          "name": "comment.sexp.dune",
          "begin": "#;[[:space:]]*\\(",
          "end": "\\)",
          "patterns": [
            {
              "include": "#comment-inner"
            }
          ]
        },
        {
          "name": "comment.line.dune",
          "match": ";.*$"
        }
      ]
    },
    "comment-inner": {
      "patterns": [
        {
          "name": "comment.sexp.inner.dune",
          "begin": "\\(",
          "end": "\\)",
          "patterns": [
            {
              "include": "#comment-inner"
            }
          ]
        }
      ]
    },
    "string": {
      "patterns": [
        {
          "name": "string.quoted.double.dune",
          "begin": "(?=[^\\\\])(\")",
          "beginCaptures": {
            "1": {
              "name": "punctuation.definition.string.begin.dune"
            }
          },
          "end": "(\")",
          "endCaptures": {
            "1": {
              "name": "punctuation.definition.string.end.dune"
            }
          },
          "patterns": [
            {
              "name": "constant.character.string.escape.dune",
              "match": "\\\\\""
            },
            {
              "include": "#variable"
            }
          ]
        }
      ]
    },
    "variable": {
      "patterns": [
        {
          "name": "variable.other.dune",
          "match": "\\${[^}]*}"
        }
      ]
    },
    "list": {
      "patterns": [
        {
          "name": "meta.list.dune",
          "begin": "(\\()",
          "end": "(\\))",
          "captures": {
            "1": {
              "name": "entity.tag.list.parenthesis.dune"
            }
          },
          "comment": "ok, for this one, I didn't know what to choose",
          "patterns": [
            {
              "include": "$self"
            }
          ]
        }
      ]
    },
    "atom": {
      "patterns": [
        {
          "name": "meta.atom.dune",
          "match": "\\b[^[[:space:]]]+\\b"
        }
      ]
    }
  }
}|}

let shell =
  {|{"fileTypes":["sh","bash","zsh","bashrc","bash_profile","bash_login","profile","bash_logout",".textmate_init"],"firstLineMatch":"^#!.*\\b(bash|zsh|sh|tcsh)|^#.*-\\*-.*\\bshell-script\\b.*-\\*-","repository":{"keyword":{"patterns":[{"match":"(?<=^|;|&|\\s)(?:if|then|else|elif|fi|for|in|do|done|select|case|continue|esac|while|until|return|coproc)(?=\\s|;|&|$)","name":"keyword.control.shell"},{"match":"(?<=^|;|&|\\s)(?:export|declare|typeset|local|readonly)(?=\\s|;|&|$)","name":"storage.modifier.shell"}]},"function-definition":{"patterns":[{"begin":"(?<=^|;|&)\\s*(function)\\s+([^\\s<>;'\"\\\\|$&()]+)(?:\\s*(\\(\\)))?","endCaptures":{"0":{"name":"punctuation.definition.function.shell"}},"end":";|&|\\n","patterns":[{"include":"$self"}],"name":"meta.function.shell","beginCaptures":{"1":{"name":"storage.type.function.shell"},"2":{"name":"entity.name.function.shell"},"3":{"name":"punctuation.definition.arguments.shell"}}},{"begin":"(?<=^|;|&)\\s*([^\\s<>;'\"\\\\|$&()]+)\\s*(\\(\\))","endCaptures":{"0":{"name":"punctuation.definition.function.shell"}},"end":";|&|\\n","patterns":[{"include":"$self"}],"name":"meta.function.shell","beginCaptures":{"1":{"name":"entity.name.function.shell"},"2":{"name":"punctuation.definition.arguments.shell"}}}]},"herestring":{"patterns":[{"match":"(<<<)\\s*((')[^']*('))","name":"meta.herestring.shell","captures":{"3":{"name":"punctuation.definition.string.begin.shell"},"1":{"name":"keyword.operator.herestring.shell"},"4":{"name":"punctuation.definition.string.end.shell"},"2":{"name":"string.quoted.single.herestring.shell"}}},{"match":"(<<<)\\s*((\")(\\\\(\"|\\\\)|[^\"])*(\"))","name":"meta.herestring.shell","captures":{"3":{"name":"punctuation.definition.string.begin.shell"},"1":{"name":"keyword.operator.herestring.shell"},"6":{"name":"punctuation.definition.string.end.shell"},"2":{"name":"string.quoted.double.herestring.shell"}}},{"match":"(<<<)\\s*(([^\\s\\\\]|\\\\.)+)","name":"meta.herestring.shell","captures":{"1":{"name":"keyword.operator.herestring.shell"},"2":{"name":"string.unquoted.herestring.shell"}}}]},"pathname":{"patterns":[{"match":"(?<=\\s|:|=|^)~","name":"keyword.operator.tilde.shell"},{"match":"\\*|\\?","name":"keyword.operator.glob.shell"},{"begin":"([?*+@!])(\\()","endCaptures":{"1":{"name":"punctuation.definition.extglob.shell"}},"end":"(\\))","patterns":[{"include":"$self"}],"name":"meta.structure.extglob.shell","beginCaptures":{"1":{"name":"keyword.operator.extglob.shell"},"2":{"name":"punctuation.definition.extglob.shell"}}}]},"pipeline":{"patterns":[{"match":"(?<=^|;|&|\\s)(time)(?=\\s|;|&|$)","name":"keyword.other.shell"},{"match":"[|!]","name":"keyword.operator.pipe.shell"}]},"compound-command":{"patterns":[{"begin":"(\\[{2})","end":"(\\]{2})","patterns":[{"include":"#logical-expression"},{"include":"$self"}],"name":"meta.scope.logical-expression.shell","captures":{"1":{"name":"punctuation.definition.logical-expression.shell"}}},{"begin":"(\\({2})","endCaptures":{"0":{"name":"punctuation.definition.string.end.shell"}},"end":"(\\){2})","patterns":[{"include":"#math"}],"name":"string.other.math.shell","beginCaptures":{"0":{"name":"punctuation.definition.string.begin.shell"}}},{"begin":"(\\()","end":"(\\))","patterns":[{"include":"$self"}],"name":"meta.scope.subshell.shell","captures":{"1":{"name":"punctuation.definition.subshell.shell"}}},{"begin":"(?<=\\s|^)(\\{)(?=\\s|$)","end":"(?<=^|;)\\s*(\\})","patterns":[{"include":"$self"}],"name":"meta.scope.group.shell","captures":{"1":{"name":"punctuation.definition.group.shell"}}}]},"lines":{"patterns":[{"match":"\\\\\\n","name":"constant.character.escape.newline.shell"}]},"heredoc":{"patterns":[{"end":"^\\t*(RUBY)(?=\\s|;|&|$)","begin":"(<<)-\\s*(\"|'|)(RUBY)\\2","beginCaptures":{"1":{"name":"keyword.operator.heredoc.shell"},"3":{"name":"keyword.control.heredoc-token.shell"}},"contentName":"source.ruby.embedded.shell","patterns":[{"include":"source.ruby"}],"captures":{"0":{"name":"punctuation.definition.string.shell"}},"endCaptures":{"1":{"name":"keyword.control.heredoc-token.shell"}},"name":"string.unquoted.heredoc.no-indent.ruby.shell"},{"end":"^(RUBY)(?=\\s|;|&|$)","begin":"(<<)\\s*(\"|'|)(RUBY)\\2","beginCaptures":{"1":{"name":"keyword.operator.heredoc.shell"},"3":{"name":"keyword.control.heredoc-token.shell"}},"contentName":"source.ruby.embedded.shell","patterns":[{"include":"source.ruby"}],"captures":{"0":{"name":"punctuation.definition.string.shell"}},"endCaptures":{"1":{"name":"keyword.control.heredoc-token.shell"}},"name":"string.unquoted.heredoc.ruby.shell"},{"end":"^\\t*(PYTHON)(?=\\s|;|&|$)","begin":"(<<)-\\s*(\"|'|)(PYTHON)\\2","beginCaptures":{"1":{"name":"keyword.operator.heredoc.shell"},"3":{"name":"keyword.control.heredoc-token.shell"}},"contentName":"source.python.embedded.shell","patterns":[{"include":"source.python"}],"captures":{"0":{"name":"punctuation.definition.string.shell"}},"endCaptures":{"1":{"name":"keyword.control.heredoc-token.shell"}},"name":"string.unquoted.heredoc.no-indent.python.shell"},{"end":"^(PYTHON)(?=\\s|;|&|$)","begin":"(<<)\\s*(\"|'|)(PYTHON)\\2","beginCaptures":{"1":{"name":"keyword.operator.heredoc.shell"},"3":{"name":"keyword.control.heredoc-token.shell"}},"contentName":"source.python.embedded.shell","patterns":[{"include":"source.python"}],"captures":{"0":{"name":"punctuation.definition.string.shell"}},"endCaptures":{"1":{"name":"keyword.control.heredoc-token.shell"}},"name":"string.unquoted.heredoc.python.shell"},{"end":"^\\t*(APPLESCRIPT)(?=\\s|;|&|$)","begin":"(<<)-\\s*(\"|'|)(APPLESCRIPT)\\2","beginCaptures":{"1":{"name":"keyword.operator.heredoc.shell"},"3":{"name":"keyword.control.heredoc-token.shell"}},"contentName":"source.applescript.embedded.shell","patterns":[{"include":"source.applescript"}],"captures":{"0":{"name":"punctuation.definition.string.shell"}},"endCaptures":{"1":{"name":"keyword.control.heredoc-token.shell"}},"name":"string.unquoted.heredoc.no-indent.applescript.shell"},{"end":"^(APPLESCRIPT)(?=\\s|;|&|$)","begin":"(<<)\\s*(\"|'|)(APPLESCRIPT)\\2","beginCaptures":{"1":{"name":"keyword.operator.heredoc.shell"},"3":{"name":"keyword.control.heredoc-token.shell"}},"contentName":"source.applescript.embedded.shell","patterns":[{"include":"source.applescript"}],"captures":{"0":{"name":"punctuation.definition.string.shell"}},"endCaptures":{"1":{"name":"keyword.control.heredoc-token.shell"}},"name":"string.unquoted.heredoc.applescript.shell"},{"end":"^\\t*(HTML)(?=\\s|;|&|$)","begin":"(<<)-\\s*(\"|'|)(HTML)\\2","beginCaptures":{"1":{"name":"keyword.operator.heredoc.shell"},"3":{"name":"keyword.control.heredoc-token.shell"}},"contentName":"text.html.embedded.shell","patterns":[{"include":"text.html.basic"}],"captures":{"0":{"name":"punctuation.definition.string.shell"}},"endCaptures":{"1":{"name":"keyword.control.heredoc-token.shell"}},"name":"string.unquoted.heredoc.no-indent.html.shell"},{"end":"^(HTML)(?=\\s|;|&|$)","begin":"(<<)\\s*(\"|'|)(HTML)\\2","beginCaptures":{"1":{"name":"keyword.operator.heredoc.shell"},"3":{"name":"keyword.control.heredoc-token.shell"}},"contentName":"text.html.embedded.shell","patterns":[{"include":"text.html.basic"}],"captures":{"0":{"name":"punctuation.definition.string.shell"}},"endCaptures":{"1":{"name":"keyword.control.heredoc-token.shell"}},"name":"string.unquoted.heredoc.html.shell"},{"end":"^\\t*(MARKDOWN)(?=\\s|;|&|$)","begin":"(<<)-\\s*(\"|'|)(MARKDOWN)\\2","beginCaptures":{"1":{"name":"keyword.operator.heredoc.shell"},"3":{"name":"keyword.control.heredoc-token.shell"}},"contentName":"text.html.markdown.embedded.shell","patterns":[{"include":"text.html.markdown"}],"captures":{"0":{"name":"punctuation.definition.string.shell"}},"endCaptures":{"1":{"name":"keyword.control.heredoc-token.shell"}},"name":"string.unquoted.heredoc.no-indent.markdown.shell"},{"end":"^(MARKDOWN)(?=\\s|;|&|$)","begin":"(<<)\\s*(\"|'|)(MARKDOWN)\\2","beginCaptures":{"1":{"name":"keyword.operator.heredoc.shell"},"3":{"name":"keyword.control.heredoc-token.shell"}},"contentName":"text.html.markdown.embedded.shell","patterns":[{"include":"text.html.markdown"}],"captures":{"0":{"name":"punctuation.definition.string.shell"}},"endCaptures":{"1":{"name":"keyword.control.heredoc-token.shell"}},"name":"string.unquoted.heredoc.markdown.shell"},{"end":"^\\t*(TEXTILE)(?=\\s|;|&|$)","begin":"(<<)-\\s*(\"|'|)(TEXTILE)\\2","beginCaptures":{"1":{"name":"keyword.operator.heredoc.shell"},"3":{"name":"keyword.control.heredoc-token.shell"}},"contentName":"text.html.textile.embedded.shell","patterns":[{"include":"text.html.textile"}],"captures":{"0":{"name":"punctuation.definition.string.shell"}},"endCaptures":{"1":{"name":"keyword.control.heredoc-token.shell"}},"name":"string.unquoted.heredoc.no-indent.textile.shell"},{"end":"^(TEXTILE)(?=\\s|;|&|$)","begin":"(<<)\\s*(\"|'|)(TEXTILE)\\2","beginCaptures":{"1":{"name":"keyword.operator.heredoc.shell"},"3":{"name":"keyword.control.heredoc-token.shell"}},"contentName":"text.html.textile.embedded.shell","patterns":[{"include":"text.html.textile"}],"captures":{"0":{"name":"punctuation.definition.string.shell"}},"endCaptures":{"1":{"name":"keyword.control.heredoc-token.shell"}},"name":"string.unquoted.heredoc.textile.shell"},{"begin":"(<<)-\\s*(\"|'|)\\\\?(\\w+)\\2","endCaptures":{"1":{"name":"keyword.control.heredoc-token.shell"}},"end":"^\\t*(\\3)(?=\\s|;|&|$)","name":"string.unquoted.heredoc.no-indent.shell","beginCaptures":{"1":{"name":"keyword.operator.heredoc.shell"},"3":{"name":"keyword.control.heredoc-token.shell"}},"captures":{"0":{"name":"punctuation.definition.string.shell"}}},{"begin":"(<<)\\s*(\"|'|)\\\\?(\\w+)\\2","endCaptures":{"1":{"name":"keyword.control.heredoc-token.shell"}},"end":"^(\\3)(?=\\s|;|&|$)","name":"string.unquoted.heredoc.shell","beginCaptures":{"1":{"name":"keyword.operator.heredoc.shell"},"3":{"name":"keyword.control.heredoc-token.shell"}},"captures":{"0":{"name":"punctuation.definition.string.shell"}}}]},"string":{"patterns":[{"match":"\\\\.","name":"constant.character.escape.shell"},{"begin":"'","endCaptures":{"0":{"name":"punctuation.definition.string.end.shell"}},"end":"'","name":"string.quoted.single.shell","beginCaptures":{"0":{"name":"punctuation.definition.string.begin.shell"}}},{"begin":"\\$?\"","endCaptures":{"0":{"name":"punctuation.definition.string.end.shell"}},"end":"\"","patterns":[{"match":"\\\\[\\$`\"\\\\\\n]","name":"constant.character.escape.shell"},{"include":"#variable"},{"include":"#interpolation"}],"name":"string.quoted.double.shell","beginCaptures":{"0":{"name":"punctuation.definition.string.begin.shell"}}},{"begin":"\\$'","endCaptures":{"0":{"name":"punctuation.definition.string.end.shell"}},"end":"'","patterns":[{"match":"\\\\(a|b|e|f|n|r|t|v|\\\\|')","name":"constant.character.escape.ansi-c.shell"},{"match":"\\\\[0-9]{3}","name":"constant.character.escape.octal.shell"},{"match":"\\\\x[0-9a-fA-F]{2}","name":"constant.character.escape.hex.shell"},{"match":"\\\\c.","name":"constant.character.escape.control-char.shell"}],"name":"string.quoted.single.dollar.shell","beginCaptures":{"0":{"name":"punctuation.definition.string.begin.shell"}}}]},"logical-expression":{"patterns":[{"comment":"do we want a special rule for ( expr )?","match":"=[=~]?|!=?|<|>|&&|\\|\\|","name":"keyword.operator.logical.shell"},{"match":"(?<!\\S)-(nt|ot|ef|eq|ne|l[te]|g[te]|[a-hknoprstuwxzOGLSN])","name":"keyword.operator.logical.shell"}]},"comment":{"begin":"(^[ \\t]+)?(?<!\\S)(?=#)(?!#\\{)","end":"(?!\\G)","patterns":[{"begin":"^(#!)","end":"\\n","name":"comment.line.shebang.shell","beginCaptures":{"1":{"name":"punctuation.definition.comment.line.shebang.shell"}}},{"begin":"#","end":"\\n","name":"comment.line.number-sign.shell","beginCaptures":{"0":{"name":"punctuation.definition.comment.shell"}}}],"beginCaptures":{"1":{"name":"punctuation.whitespace.comment.leading.shell"}}},"support":{"patterns":[{"match":"(?<=^|;|&|\\s)(?::|\\.)(?=\\s|;|&|$)","name":"support.function.builtin.shell"},{"match":"(?<=^|;|&|\\s)(?:alias|bg|bind|break|builtin|caller|cd|command|compgen|complete|dirs|disown|echo|enable|eval|exec|exit|false|fc|fg|getopts|hash|help|history|jobs|kill|let|logout|mapfile|popd|printf|pushd|pwd|read(array)?|readonly|set|shift|shopt|source|suspend|test|times|trap|true|type|ulimit|umask|unalias|unset|wait)(?=\\s|;|&|$)","name":"support.function.builtin.shell"}]},"math":{"patterns":[{"include":"#variable"},{"match":"\\+{1,2}|-{1,2}|!|~|\\*{1,2}|\/|%|<[<=]?|>[>=]?|==|!=|\\^|\\|{1,2}|&{1,2}|\\?|\\:|,|=|[*\/%+\\-&^|]=|<<=|>>=","name":"keyword.operator.arithmetic.shell"},{"match":"0[xX]\\h+","name":"constant.numeric.hex.shell"},{"match":"0\\d+","name":"constant.numeric.octal.shell"},{"match":"\\d{1,2}#[0-9a-zA-Z@_]+","name":"constant.numeric.other.shell"},{"match":"\\d+","name":"constant.numeric.integer.shell"}]},"variable":{"patterns":[{"match":"(\\$)[a-zA-Z_][a-zA-Z0-9_]*","name":"variable.other.normal.shell","captures":{"1":{"name":"punctuation.definition.variable.shell"}}},{"match":"(\\$)[-*@#?$!0_]","name":"variable.other.special.shell","captures":{"1":{"name":"punctuation.definition.variable.shell"}}},{"match":"(\\$)[1-9]","name":"variable.other.positional.shell","captures":{"1":{"name":"punctuation.definition.variable.shell"}}},{"begin":"\\$\\{","end":"\\}","patterns":[{"match":"!|:[-=?+]?|\\*|@|#{1,2}|%{1,2}|\/","name":"keyword.operator.expansion.shell"},{"match":"(\\[)([^\\]]+)(\\])","captures":{"1":{"name":"punctuation.section.array.shell"},"3":{"name":"punctuation.section.array.shell"}}},{"include":"#string"},{"include":"#variable"},{"include":"#interpolation"}],"name":"variable.other.bracket.shell","captures":{"0":{"name":"punctuation.definition.variable.shell"}}}]},"list":{"patterns":[{"match":";|&&|&|\\|\\|","name":"keyword.operator.list.shell"}]},"redirection":{"patterns":[{"begin":"[><]\\(","endCaptures":{"0":{"name":"punctuation.definition.string.end.shell"}},"end":"\\)","patterns":[{"include":"$self"}],"name":"string.interpolated.process-substitution.shell","beginCaptures":{"0":{"name":"punctuation.definition.string.begin.shell"}}},{"comment":"valid: &>word >&word >word [n]>&[n] [n]<word [n]>word [n]>>word [n]<&word (last one is duplicate)","match":"&>|\\d*>&\\d*|\\d*(>>|>|<)|\\d*<&|\\d*<>","name":"keyword.operator.redirect.shell"}]},"interpolation":{"patterns":[{"begin":"\\$\\({2}","endCaptures":{"0":{"name":"punctuation.definition.string.end.shell"}},"end":"\\){2}","patterns":[{"include":"#math"}],"name":"string.other.math.shell","beginCaptures":{"0":{"name":"punctuation.definition.string.begin.shell"}}},{"begin":"`","endCaptures":{"0":{"name":"punctuation.definition.string.end.shell"}},"end":"`","patterns":[{"match":"\\\\[`\\\\$]","name":"constant.character.escape.shell"},{"begin":"(?<=^|;|&|\\s|`)(#)(?!\\{)","end":"(?=`)|\\n","name":"comment.line.number-sign.shell","beginCaptures":{"1":{"name":"punctuation.definition.comment.shell"}}},{"include":"$self"}],"name":"string.interpolated.backtick.shell","beginCaptures":{"0":{"name":"punctuation.definition.string.begin.shell"}}},{"begin":"\\$\\(","endCaptures":{"0":{"name":"punctuation.definition.string.end.shell"}},"end":"\\)","patterns":[{"begin":"(?<=^|;|&|\\s|\\()(#)(?!\\{)","end":"(?=\\))|\\n","name":"comment.line.number-sign.shell","beginCaptures":{"1":{"name":"punctuation.definition.comment.shell"}}},{"include":"$self"}],"name":"string.interpolated.dollar.shell","beginCaptures":{"0":{"name":"punctuation.definition.string.begin.shell"}}}]},"loop":{"patterns":[{"begin":"(?<=^|;|&|\\s)(for)\\s+(?=\\({2})","end":"(?<=^|;|&|\\s)(done)(?=\\s|;|&|$|\\))","patterns":[{"include":"$self"}],"name":"meta.scope.for-loop.shell","captures":{"1":{"name":"keyword.control.shell"}}},{"begin":"(?<=^|;|&|\\s)(for)\\s+([^\\s\\\\]+)(?=\\s|;|&|$)","endCaptures":{"1":{"name":"keyword.control.shell"}},"end":"(?<=^|;|&|\\s)(done)(?=\\s|;|&|$|\\))","patterns":[{"include":"$self"}],"name":"meta.scope.for-in-loop.shell","beginCaptures":{"1":{"name":"keyword.control.shell"},"2":{"name":"variable.other.loop.shell"}}},{"begin":"(?<=^|;|&|\\s)(while|until)(?=\\s|;|&|$)","end":"(?<=^|;|&|\\s)(done)(?=\\s|;|&|$|\\))","patterns":[{"include":"$self"}],"name":"meta.scope.while-loop.shell","captures":{"1":{"name":"keyword.control.shell"}}},{"begin":"(?<=^|;|&|\\s)(select)\\s+([^\\s\\\\]+)(?=\\s|;|&|$)","endCaptures":{"1":{"name":"keyword.control.shell"}},"end":"(?<=^|;|&|\\s)(done)(?=\\s|;|&|$|\\))","patterns":[{"include":"$self"}],"name":"meta.scope.select-block.shell","beginCaptures":{"1":{"name":"keyword.control.shell"},"2":{"name":"variable.other.loop.shell"}}},{"begin":"(?<=^|;|&|\\s)(case)(?=\\s|;|&|$)","end":"(?<=^|;|&|\\s)(esac)(?=\\s|;|&|$|\\))","patterns":[{"begin":"(?<=^|;|&|\\s)(?:in)(?=\\s|;|&|$)","end":"(?<=^|;|&|\\s)(?=(?:esac)(?:\\s|;|&|$|\\)))","patterns":[{"include":"#comment"},{"include":"#case-clause"},{"include":"$self"}],"name":"meta.scope.case-body.shell","beginCaptures":{"1":{"name":"keyword.control.shell"}}},{"include":"$self"}],"name":"meta.scope.case-block.shell","captures":{"1":{"name":"keyword.control.shell"}}},{"end":"(?<=^|;|&|\\s)(fi)(?=\\s|;|&|$|\\))","begin":"(^|(?<=[&;|]))\\s*(if)(?=\\s|;|&|$)","beginCaptures":{"2":{"name":"keyword.control.shell"}},"patterns":[{"include":"$self"}],"comment":"Restrict match to avoid matching in lines like `dd if=\/dev\/sda1 …`","endCaptures":{"1":{"name":"keyword.control.shell"}},"name":"meta.scope.if-block.shell"}]},"case-clause":{"patterns":[{"begin":"(?=\\S)","endCaptures":{"0":{"name":"punctuation.terminator.case-clause.shell"}},"end":";;","patterns":[{"begin":"(\\(|(?=\\S))","end":"\\)","patterns":[{"match":"\\|","name":"punctuation.separator.pipe-sign.shell"},{"include":"#string"},{"include":"#variable"},{"include":"#interpolation"},{"include":"#pathname"}],"name":"meta.scope.case-pattern.shell","captures":{"0":{"name":"punctuation.definition.case-pattern.shell"}}},{"begin":"(?<=\\))","end":"(?=;;)","patterns":[{"include":"$self"}],"name":"meta.scope.case-clause-body.shell"}],"name":"meta.scope.case-clause.shell"}]}},"keyEquivalent":"^~S","uuid":"DDEEA3ED-6B1C-11D9-8B10-000D93589AF6","patterns":[{"include":"#comment"},{"include":"#pipeline"},{"include":"#list"},{"include":"#compound-command"},{"include":"#loop"},{"include":"#string"},{"include":"#function-definition"},{"include":"#variable"},{"include":"#interpolation"},{"include":"#heredoc"},{"include":"#herestring"},{"include":"#redirection"},{"include":"#pathname"},{"include":"#keyword"},{"include":"#support"},{"include":"#lines"}],"scopeName":"source.shell"}|}

let opam =
  {|{
  "name": "opam",
  "scopeName": "source.ocaml.opam",
  "fileTypes": [
    "opam"
  ],
  "patterns": [
    {
      "include": "#comments"
    },
    {
      "include": "#fields"
    },
    {
      "include": "#values"
    }
  ],
  "repository": {
    "comments": {
      "patterns": [
        {
          "comment": "block comment",
          "name": "comment.block.opam",
          "begin": "\\(\\*",
          "end": "\\*\\)"
        },
        {
          "comment": "line comment",
          "name": "comment.line.opam",
          "begin": "#",
          "end": "$"
        }
      ]
    },
    "fields": {
      "comment": "labeled field",
      "match": "^([[:word:]-]*[[:alpha:]][[:word:]-]*)(:)",
      "captures": {
        "1": {
          "name": "entity.name.tag.opam"
        },
        "2": {
          "name": "keyword.operator.opam"
        }
      }
    },
    "values": {
      "patterns": [
        {
          "comment": "boolean literal",
          "name": "constant.language.opam",
          "match": "\\b(true|false)\\b"
        },
        {
          "comment": "integer literal",
          "name": "constant.numeric.decimal.opam",
          "match": "(\\b|\\-?)[[:digit:]]+\\b"
        },
        {
          "comment": "double-quote string literal",
          "name": "string.quoted.double.opam",
          "begin": "\"",
          "end": "\"",
          "patterns": [
            {
              "include": "#string-elements"
            }
          ]
        },
        {
          "comment": "triple-double-quote string literal",
          "name": "string.quoted.triple-double.opam",
          "begin": "\"\"\"",
          "end": "\"\"\"",
          "patterns": [
            {
              "include": "#string-elements"
            }
          ]
        },
        {
          "comment": "operator",
          "name": "keyword.operator.opam",
          "match": "[!=<>\\|&?:]+"
        },
        {
          "comment": "identifier",
          "match": "\\b([[:word:]+-]+)\\b",
          "name": "variable.parameter.opam"
        }
      ]
    },
    "string-elements": {
      "patterns": [
        {
          "comment": "escaped backslash",
          "name": "constant.character.escape.opam",
          "match": "\\\\\\\\"
        },
        {
          "comment": "escaped quote or whitespace",
          "name": "constant.character.escape.opam",
          "match": "\\\\[\"ntbr\\n]"
        },
        {
          "comment": "character from decimal ASCII code",
          "name": "constant.character.escape.opam",
          "match": "\\\\[[:digit:]]{3}"
        },
        {
          "comment": "character from hexadecimal ASCII code",
          "name": "constant.character.escape.opam",
          "match": "\\\\x[[:xdigit:]]{2}"
        },
        {
          "comment": "variable interpolation",
          "name": "constant.variable.opam",
          "begin": "%\\{",
          "end": "}\\%"
        },
        {
          "comment": "unknown escape sequence",
          "name": "invalid.illegal.unknown-escape.opam",
          "match": "\\\\."
        }
      ]
    }
  }
}|}
