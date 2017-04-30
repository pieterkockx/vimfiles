if exists("b:current_syntax")
 finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore

" fascist highlighting: everything that doesn't fit the rules is an error
syn match schemeError ![^ \t()\[\]";]*!
syn match schemeError ")"

syn region schemeQuoted matchgroup=Delimiter start="['`]" end=![ \t()\[\]";]!me=e-1 contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

syn region schemeQuoted matchgroup=Delimiter start="['`](" matchgroup=Delimiter end=")" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeQuoted matchgroup=Delimiter start="['`]#(" matchgroup=Delimiter end=")" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

syn region schemeStrucRestricted matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeStrucRestricted matchgroup=Delimiter start="#(" matchgroup=Delimiter end=")" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

syn region schemeStrucRestricted matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeStrucRestricted matchgroup=Delimiter start="#\[" matchgroup=Delimiter end="\]" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

syn region schemeUnquote matchgroup=Delimiter start="," end=![ \t\[\]()";]!me=e-1 contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeUnquote matchgroup=Delimiter start=",@" end=![ \t\[\]()";]!me=e-1 contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

syn region schemeUnquote matchgroup=Delimiter start=",(" end=")" contains=ALL
syn region schemeUnquote matchgroup=Delimiter start=",@(" end=")" contains=ALL

syn region schemeUnquote matchgroup=Delimiter start=",#(" end=")" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeUnquote matchgroup=Delimiter start=",@#(" end=")" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

syn region schemeUnquote matchgroup=Delimiter start=",\[" end="\]" contains=ALL
syn region schemeUnquote matchgroup=Delimiter start=",@\[" end="\]" contains=ALL

syn region schemeUnquote matchgroup=Delimiter start=",#\[" end="\]" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc
syn region schemeUnquote matchgroup=Delimiter start=",@#\[" end="\]" contains=ALLBUT,schemeStruc,schemeSyntax,schemeFunc

setlocal iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_

syn match schemeSyntax "\((\s*\)\@<=\(define\|lambda\)\(\s\|$\)"
syn match schemeSyntax "\((\s*\)\@<=\(quasiquote\|quote\|unquote\|unquote-splicing\)\(\s\|$\)\@="
syn match schemeSyntax "\((\s*\)\@<=\(and\|begin\|case\|cond\|do\|if\|or\)\(\s\|$\)\@="
syn match schemeSyntax "\((\s*\)\@<=\(=>\|delay\|let\|let\*\|letrec\|set!\)\(\s\|$\)\@="
syn match schemeSyntax "\((\s*\)\@<=\(define-syntax\|let-syntax\|letrec-syntax\|syntax-rules\)\(\s\|$\)\@="
" R6RS
syn match schemeSyntax "\((\s*\)\@<=\(define-record-type\|fields\|protocol\)\(\s\|$\)\@="

syn keyword schemeFunc not boolean? eq? eqv? equal? pair? cons car cdr set-car!
syn keyword schemeFunc set-cdr! caar cadr cdar cddr caaar caadr cadar caddr
syn keyword schemeFunc cdaar cdadr cddar cdddr caaaar caaadr caadar caaddr
syn keyword schemeFunc cadaar cadadr caddar cadddr cdaaar cdaadr cdadar cdaddr
syn keyword schemeFunc cddaar cddadr cdddar cddddr null? list? list length
syn keyword schemeFunc append reverse list-ref memq memv member assq assv assoc
syn keyword schemeFunc symbol? symbol->string string->symbol number? complex?
syn keyword schemeFunc real? rational? integer? exact? inexact? = < > <= >=
syn keyword schemeFunc zero? positive? negative? odd? even? max min + * - / abs
syn keyword schemeFunc quotient remainder modulo gcd lcm numerator denominator
syn keyword schemeFunc floor ceiling truncate round rationalize exp log sin cos
syn keyword schemeFunc tan asin acos atan sqrt expt make-rectangular make-polar
syn keyword schemeFunc real-part imag-part magnitude angle exact->inexact
syn keyword schemeFunc inexact->exact number->string string->number char=?
syn keyword schemeFunc char-ci=? char<? char-ci<? char>? char-ci>? char<=?
syn keyword schemeFunc char-ci<=? char>=? char-ci>=? char-alphabetic? char?
syn keyword schemeFunc char-numeric? char-whitespace? char-upper-case?
syn keyword schemeFunc char-lower-case?
syn keyword schemeFunc char->integer integer->char char-upcase char-downcase
syn keyword schemeFunc string? make-string string string-length string-ref
syn keyword schemeFunc string-set! string=? string-ci=? string<? string-ci<?
syn keyword schemeFunc string>? string-ci>? string<=? string-ci<=? string>=?
syn keyword schemeFunc string-ci>=? substring string-append vector? make-vector
syn keyword schemeFunc vector vector-length vector-ref vector-set! procedure?
syn keyword schemeFunc apply map for-each call-with-current-continuation
syn keyword schemeFunc call-with-input-file call-with-output-file input-port?
syn keyword schemeFunc output-port? current-input-port current-output-port
syn keyword schemeFunc open-input-file open-output-file close-input-port
syn keyword schemeFunc close-output-port eof-object? read read-char peek-char
syn keyword schemeFunc write display newline write-char call/cc
syn keyword schemeFunc list-tail string->list list->string string-copy
syn keyword schemeFunc string-fill! vector->list list->vector vector-fill!
syn keyword schemeFunc force with-input-from-file with-output-to-file
syn keyword schemeFunc char-ready? load transcript-on transcript-off eval
syn keyword schemeFunc dynamic-wind port? values call-with-values
syn keyword schemeFunc scheme-report-environment null-environment
syn keyword schemeFunc interaction-environment
" R6RS
syn keyword schemeFunc make-eq-hashtable make-eqv-hashtable make-hashtable
syn keyword schemeFunc hashtable? hashtable-size hashtable-ref hashtable-set!
syn keyword schemeFunc hashtable-delete! hashtable-contains? hashtable-update!
syn keyword schemeFunc hashtable-copy hashtable-clear! hashtable-keys
syn keyword schemeFunc hashtable-entries hashtable-equivalence-function hashtable-hash-function
syn keyword schemeFunc hashtable-mutable? equal-hash string-hash string-ci-hash symbol-hash
syn keyword schemeFunc find for-all exists filter partition fold-left fold-right
syn keyword schemeFunc remp remove remv remq memp assp cons*
" common extensions
syn keyword schemeFunc atom? add1 sub1

" single dot is a number, not a delimiter
syn match schemeDelimiter !\.[ \t\[\]()";]!me=e-1
syn match schemeDelimiter !\.$!

" only highlight *stuff* and <stuff>
"syn match schemeOther ,[a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*,
syn match schemeError ,[a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

" ... is a special identifier
syn match schemeOther "\.\.\."
syn match schemeError !\.\.\.[^ \t\[\]()";]\+!

syn match schemeConstant ,\*[-a-z!$%&*/:<=>?^_~0-9+.@]\+\*[ \t\[\]()";],me=e-1
syn match schemeConstant ,\*[-a-z!$%&*/:<=>?^_~0-9+.@]\+\*$,
syn match schemeError ,\*[-a-z!$%&*/:<=>?^_~0-9+.@]*\*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

syn match schemeConstant ,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[ \t\[\]()";],me=e-1
syn match schemeConstant ,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>$,
syn match schemeError ,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\]()";]\+[^ \t\[\]()";]*,

" unquoted lists and strings
syn region schemeStruc matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALL
syn region schemeStruc matchgroup=Delimiter start="#(" matchgroup=Delimiter end=")" contains=ALL

syn region schemeStruc matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALL
syn region schemeStruc matchgroup=Delimiter start="#\[" matchgroup=Delimiter end="\]" contains=ALL

" simple literals
syn region schemeString start=+\%(\\\)\@<!"+ skip=+\\[\\"]+ end=+"+ contains=@Spell

" comments
syn match schemeComment ";.*$" contains=@Spell

" approximate Scheme numerals
syn match schemeOther ![+-][ \t\[\]()";]!me=e-1
syn match schemeOther ![+-]$!

" approximate lax
syn match schemeNumber "[-#+.]\=[0-9][-#+/0-9a-f@i.boxesfdl]*"
syn match schemeError ![-#+0-9.][-#+/0-9a-f@i.boxesfdl]*[^-#+/0-9a-f@i.boxesfdl \t\[\]()";][^ \t\[\]()";]*!

syn match schemeBoolean "#[tf]"
syn match schemeError !#[tf][^ \t\[\]()";]\+!

syn match schemeCharacter "#\\"
syn match schemeCharacter "#\\."
syn match schemeError !#\\.[^ \t\[\]()";]\+!
syn match schemeCharacter "#\\space"
syn match schemeError !#\\space[^ \t\[\]()";]\+!
syn match schemeCharacter "#\\newline"
syn match schemeError !#\\newline[^ \t\[\]()";]\+!
" R6RS
syn match schemeCharacter "#\\x[0-9a-fA-F]\+"

"
" CHICKEN extensions
"
" multi-line comment
syn match schemeChar oneline "#\\return"
syn match schemeChar oneline "#!eof"

syntax region schemeMultilineComment start=/#|/ end=/|#/ contains=@Spell,schemeMultilineComment
syn region schemeSexpComment start="#;(" end=")" contains=schemeComment,schemeTempStruc

syn match schemeOther "##[-a-z!$%&*/:<=>?^_~0-9+.@#%]\+"
syn match schemeExtSyntax "#:[-a-z!$%&*/:<=>?^_~0-9+.@#%]\+"

syn match schemeExtSyntax "\((\s*\)\@<=\(unit\|uses\|declare\|hide\|foreign-declare\|foreign-parse\|foreign-parse/spec\)\(\s\|$\)\@="
syn match schemeExtSyntax "\((\s*\)\@<=\(foreign-lambda\|foreign-lambda\*\|define-external\|define-macro\|load-library\)\(\s\|$\)\@="
syn match schemeExtSyntax "\((\s*\)\@<=\(let-values\|let\*-values\|letrec-values\|->string\|require-extension\)\(\s\|$\)\@="
syn match schemeExtSyntax "\((\s*\)\@<=\(let-optionals\|let-optionals\*\|define-foreign-variable\|define-record\)\(\s\|$\)\@="
syn match schemeExtSyntax "\((\s*\)\@<=\(pointer\|tag-pointer\|tagged-pointer?\|define-foreign-type\)\(\s\|$\)\@="
syn match schemeExtSyntax "\((\s*\)\@<=\(require\|require-for-syntax\|cond-expand\|and-let\*\|receive\|argc+argv\)\(\s\|$\)\@="
syn match schemeExtSyntax "\((\s*\)\@<=\(fixnum?\|fx=\|fx>\|fx<\|fx>=\|fx<=\|fxmin\|fxmax\)\(\s\|$\)\@="
syn keyword schemeExtFunc ##core#inline ##sys#error ##sys#update-errno

" here-string
syn region schemeString start=+#<<\s*\z(.*\)+ end=+^\z1$+ contains=@Spell

" CHICKEN extensions
unlet! b:current_syntax
syn include @ChickenC syntax/c.vim
syn region ChickenC matchgroup=schemeOther start=+(\@<=foreign-declare "+ end=+")\@=+ contains=@ChickenC
syn region ChickenC matchgroup=schemeComment start=+foreign-declare\s*#<<\z(.*\)$+hs=s+15 end=+^\z1$+ contains=@ChickenC
syn region ChickenC matchgroup=schemeOther start=+(\@<=foreign-parse "+ end=+")\@=+ contains=@ChickenC
syn region ChickenC matchgroup=schemeComment start=+foreign-parse\s*#<<\z(.*\)$+hs=s+13 end=+^\z1$+ contains=@ChickenC
syn region ChickenC matchgroup=schemeOther start=+(\@<=foreign-parse/spec "+ end=+")\@=+ contains=@ChickenC
syn region ChickenC matchgroup=schemeComment start=+foreign-parse/spec\s*#<<\z(.*\)$+hs=s+18 end=+^\z1$+ contains=@ChickenC
syn region ChickenC matchgroup=schemeComment start=+#>+ end=+<#+ contains=@ChickenC
syn region ChickenC matchgroup=schemeComment start=+#>?+ end=+<#+ contains=@ChickenC
syn region ChickenC matchgroup=schemeComment start=+#>!+ end=+<#+ contains=@ChickenC
syn region ChickenC matchgroup=schemeComment start=+#>\$+ end=+<#+ contains=@ChickenC
syn region ChickenC matchgroup=schemeComment start=+#>%+ end=+<#+ contains=@ChickenC

syn match schemeExtSyntax "#![-a-z!$%&*/:<=>?^_~0-9+.@#%]\+"
syn region schemeString start=+#<#\s*\z(.*\)+ end=+^\z1$+ contains=@Spell
syn match schemeShebang "^#!/.*csi.*$"

" CHICKEN interpreter
syn match chickenInterpreterPrompt +^#;[1-9][0-9]*>+
syn match chickenInterpreterPrint +^#<[^>]*>+

" synchronize on a line that starts at the left margin
syn sync match matchPlace grouphere NONE "^[^ \t]"

" default highlighting
command -nargs=+ HiLink hi def link <args>

HiLink schemeFunc Function
HiLink schemeExtFunc Function
HiLink schemeConstant Constant

HiLink schemeString String
HiLink schemeCharacter Character
HiLink schemeNumber Number
HiLink schemeBoolean Boolean

HiLink schemeDelimiter Special
HiLink schemeSyntax Special
HiLink schemeExtSyntax Special

HiLink schemeComment Comment
HiLink schemeMultilineComment Comment
HiLink schemeSexpComment Comment
HiLink schemeShebang Comment

HiLink schemeError Error

HiLink chickenInterpreterPrompt Comment
HiLink chickenInterpreterPrint String

delcommand HiLink

let b:current_syntax = "scheme"

let &cpo = s:cpo_save
unlet s:cpo_save
