if !exists('main_syntax')
  if exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'html'
endif

let s:cpo_save = &cpo
set cpo&vim

" standard HiLink does not work with included syntax files
command! -nargs=+ HiLink hi def link <args>

syntax spell toplevel

syn case ignore

"
" Comments
"
syn region htmlComment start=+<!+ end=+>+ contains=htmlCommentPart,@Spell
syn region htmlCommentPart contained start=+--+ end=+--\s*+ contains=@Spell
syn region htmlComment start=+<!DOCTYPE+ keepend end=+>+

"
" Strings
"
syn match htmlSpecialChar "&#\=[0-9A-Za-z]\{1,8};"
syn region htmlString start=+"+ end=+"+ contained contains=htmlSpecialChar,@Spell
syn region htmlString start=+'+ end=+'+ contained contains=htmlSpecialChar,@Spell

"
" Tag names
"
" metadata
syn keyword htmlTagName contained base link meta style title
" section
syn keyword htmlTagName contained address article aside footer h1 h2 h3 h4 h5 h6 header hgroup nav section
" text
syn keyword htmlTagName contained dd div dl dt figcaption figure hr li main ol p pre ul
" inline
syn keyword htmlTagName contained a abbr b bdi bdo br cite code data dfn em i kbd mark q rp rt rtc ruby s samp small span strong sub sup time u var wbr
" media
syn keyword htmlTagName contained area audio img map track video
" embed
syn keyword htmlTagName contained embed object param source
" script
syn keyword htmlTagName contained canvas noscript script
" edited
syn keyword htmlTagName contained del ins
" table
syn keyword htmlTagName contained caption col colgroup table tbody td tfoot th thead tr
" forms
syn keyword htmlTagName contained button datalist fieldset form input label legend meter optgroup option output progress select textarea
" interactive
syn keyword htmlTagName contained details dialog menu menuitem summary
" components
syn keyword htmlTagName contained shadow slot template

syn region htmlTag start="<[^!]" end=">" contains=htmlTagName,htmlString

HiLink htmlComment Comment
HiLink htmlCommentPart Comment
HiLink htmlSpecialChar Special
HiLink htmlString String
HiLink htmlTagName Type

delcommand HiLink

let b:current_syntax = 'html'

if main_syntax == 'html'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
