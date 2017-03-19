if !exists('main_syntax')
  if exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'javascript'
elseif exists('b:current_syntax') && b:current_syntax == 'javascript'
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" standard HiLink does not work with included syntax files
command! -nargs=+ HiLink hi def link <args>

"
" Comments
"
syn keyword javaScriptCommentTodo TODO contained
syn region javaScriptComment start="/\*" end="\*/" contains=javaScriptCommentTodo,@Spell
syn match javaScriptLineComment "\/\/.*" contains=javaScriptCommentTodo,@Spell

"
" Values
"
syn match javaScriptSpecialCharacter "\\\d\d\d\|\\."

syn region javaScriptStringDouble start=+"+ skip=+\\\\\|\\"+ end=+"\|$+ contains=javaScriptSpecialCharacter,@Spell
syn region javaScriptStringSingle start=+'+ skip=+\\\\\|\\'+ end=+'\|$+ contains=javaScriptSpecialCharacter,@Spell
syn region javaScriptStringTick start=+`+ skip=+\\\\\|\\`+ end=+`+ contains=javaScriptSpecialCharacter
syn region javaScriptRegexpString start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gim]\{0,2\}\s*$+ end=+/[gim]\{0,2\}\s*[;.,)\]}]+me=e-1 oneline

syn match javaScriptNumber "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"

syn keyword javaScriptConstant true false null undefined

"
" Declarations
"
syn keyword javaScriptDeclaration var const let class extends super import export
syn keyword javaScriptStrict public private protected static implements interface package

"
" Control
"
syn keyword javaScriptConditional if else for while do switch case default
syn keyword javaScriptKeyword break continue yield return
syn keyword javaScriptException try catch finally throw debugger
syn keyword javaScriptOperator new delete instanceof typeof in of

"
" Objects/Constructors
"
syn keyword javaScriptIdentifier this

" fundamental
syn keyword javaScriptObject Object Function
" datatypes
syn keyword javaScriptObject Boolean Number String Symbol
" errors
syn keyword javaScriptObject Error EvalError InternalError RangeError ReferenceError SyntaxError TypeError URIError
" utility
syn keyword javaScriptObject Date Math RegExp
" indexed collections
syn keyword javaScriptObject Array Int8Array Uint8Array Uint8ClampedArray Int16Array Uint16Array Int32Array Uint32Array Float32Array Float64Array
" keyed collections
syn keyword javaScriptObject Map WeakMap Set WeakSet
" structured data
syn keyword javaScriptObject ArrayBuffer DataView JSON
" control abstractions
syn keyword javaScriptObject Promise Generator GeneratorFunction
" reflection
syn keyword javaScriptObject Reflect Proxy

"
" Functions
"
syn match javaScriptFunction "\<function\>"
syn region javaScriptFunctionFold start="\<function\>.*[^};]$" end="^\z1}.*$" transparent fold keepend

syn sync match javaScriptSync grouphere javaScriptFunctionFold "\<function\>"
syn sync match javaScriptSync grouphere NONE "^}"

syn sync fromstart
syn sync maxlines=100

if main_syntax == 'javascript'
  syn sync ccomment javaScriptComment
endif

HiLink javaScriptCommentTodo Todo
HiLink javaScriptComment Comment
HiLink javaScriptLineComment javaScriptComment

HiLink javaScriptSpecialCharacter Special
HiLink javaScriptStringDouble String
HiLink javaScriptStringSingle javaScriptStringDouble
HiLink javaScriptStringTick javaScriptStringDouble
HiLink javaScriptRegexpString javaScriptStringD

HiLink javaScriptNumber Constant
HiLink javaScriptConstant Constant

HiLink javaScriptDeclaration Statement
HiLink javaScriptStrict PreProc

HiLink javaScriptConditional Keyword
HiLink javaScriptKeyword Keyword
HiLink javaScriptException Keyword
HiLink javaScriptOperator Keyword

HiLink javaScriptIdentifier Identifier
HiLink javaScriptObject Type

HiLink javaScriptFunction Function

delcommand HiLink

let b:current_syntax = 'javascript'

if main_syntax == 'javascript'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
