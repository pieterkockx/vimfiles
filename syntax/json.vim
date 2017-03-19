if !exists('main_syntax')
  if exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'json'
endif

let s:cpo_save = &cpo
set cpo&vim

" standard HiLink does not work with included syntax files
command! -nargs=+ HiLink hi def link <args>

syntax match jsonNoise /\%(:\|,\)/

syn match jsonStringMatch /"\([^"]\|\\\"\)\+"\ze[[:blank:]\r\n]*[,}\]]/ contains=jsonString

syn region jsonString oneline matchgroup=jsonQuote start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=jsonEscape contained

syn region jsonStringSQError oneline start=+'+ skip=+\\\\\|\\"+ end=+'+

syn match jsonKeywordMatch /"\([^"]\|\\\"\)\+"[[:blank:]\r\n]*\:/ contains=jsonKeyword

syn region jsonKeyword matchgroup=jsonQuote start=/"/ end=/"\ze[[:blank:]\r\n]*\:/ contained

syn match jsonEscape "\\["\\/bfnrt]" contained
syn match jsonEscape "\\u\x\{4}" contained

syn match jsonNumber "-\=\<\%(0\|[1-9]\d*\)\%(\.\d\+\)\=\%([eE][-+]\=\d\+\)\=\>\ze[[:blank:]\r\n]*[,}\]]"

syn match jsonNoQuotesError "\<[[:alpha:]][[:alnum:]]*\>"
syn match jsonTripleQuotesError /"""/
syn match jsonNumError "-\=\<0\d\.\d*\>"
syn match jsonNumError "\:\@<=[[:blank:]\r\n]*\zs\.\d\+"
syn match jsonCommentError "//.*"
syn match jsonCommentError "\(/\*\)\|\(\*/\)"
syn match jsonSemicolonError ";"
syn match jsonTrailingCommaError ",\_s*[}\]]"
syn match jsonMissingCommaError /\("\|\]\|\d\)\zs\_s\+\ze"/
syn match jsonMissingCommaError /\(\]\|\}\)\_s\+\ze"/
syn match jsonMissingCommaError /}\_s\+\ze{/
syn match jsonMissingCommaError /\(true\|false\)\_s\+\ze"/

syn match jsonPadding "\%^[[:blank:]\r\n]*[_$[:alpha:]][_$[:alnum:]]*[[:blank:]\r\n]*("
syn match jsonPadding ");[[:blank:]\r\n]*\%$"

syn match jsonBoolean /\(true\|false\)\(\_s\+\ze"\)\@!/

syn keyword jsonNull null

syn region jsonFold matchgroup=jsonBraces start="{" end=/}\(\_s\+\ze\("\|{\)\)\@!/ transparent fold
syn region jsonFold matchgroup=jsonBraces start="\[" end=/]\(\_s\+\ze"\)\@!/ transparent fold

HiLink jsonPadding Operator
HiLink jsonString String
HiLink jsonTest Label
HiLink jsonEscape Special
HiLink jsonNumber Number
HiLink jsonBraces Delimiter
HiLink jsonNull Function
HiLink jsonBoolean Boolean
HiLink jsonKeyword Label

HiLink jsonNumError Error
HiLink jsonCommentError Error
HiLink jsonSemicolonError Error
HiLink jsonTrailingCommaError Error
HiLink jsonMissingCommaError Error
HiLink jsonStringSQError Error
HiLink jsonNoQuotesError Error
HiLink jsonTripleQuotesError Error

HiLink jsonQuote Quote
HiLink jsonNoise Noise

delcommand HiLink

let b:current_syntax = 'json'

if main_syntax == 'json'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
