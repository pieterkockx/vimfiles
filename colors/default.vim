" :he group-name
" :he highlight-groups
" :he cterm-colors

hi clear Normal
set background&

hi clear

if exists("syntax_on")
  syntax reset
endif
let colors_name="default"

" color terminal definitions
" :hi clear alone isn't sufficient since it just resets to default
hi Normal ctermfg=7 ctermbg=0
hi clear Visual
hi Visual cterm=bold ctermfg=3 ctermbg=4
hi clear NonText
hi NonText cterm=bold ctermfg=4
hi clear EndOfBuffer
hi EndOfBuffer cterm=bold ctermfg=0

" cursor
hi clear ColorColumn
hi ColorColumn ctermbg=fg
hi clear Cursor
hi clear CursorColumn
hi CursorColumn ctermfg=bg ctermbg=fg
hi clear CursorLine
hi CursorLine cterm=underline

" menus
hi clear Pmenu
hi Pmenu ctermfg=fg ctermbg=6
hi clear PmenuSbar
hi clear PmenuSel
hi PmenuSel cterm=bold ctermfg=7 ctermbg=4
hi clear PmenuThumb
hi clear WildMenu
hi WildMenu ctermfg=bg ctermbg=3

" messages
hi clear ErrorMsg
hi ErrorMsg cterm=bold ctermfg=0
hi clear ModeMsg
hi ModeMsg cterm=bold ctermfg=4
hi clear MoreMsg
hi MoreMsg cterm=bold ctermfg=2
hi clear WarningMsg
hi WarningMsg cterm=bold ctermfg=0

" search
hi clear IncSearch
hi IncSearch cterm=bold ctermfg=5
hi clear Search
hi Search cterm=bold,underline ctermfg=5

" syntax
hi clear Comment
hi Comment ctermfg=6
hi clear Constant
hi clear Identifier
hi clear Keyword
hi clear PreProc
hi clear Special
hi Special cterm=bold ctermfg=2
hi clear Statement
hi clear String
hi String ctermfg=2
hi clear Type

" syntax - specific
hi htmlTagName cterm=bold ctermfg=2
hi jsonError cterm=bold,underline
hi schemeFunc ctermfg=3
hi schemeBoolean cterm=bold ctermfg=0

" text
hi clear Directory
hi Directory ctermfg=6
hi clear Error
hi clear Question
hi Todo cterm=bold,underline ctermfg=6
hi clear SpecialKey
hi SpecialKey cterm=bold ctermfg=5
hi clear Todo
hi Todo cterm=bold,underline ctermfg=6

" view
hi clear FoldColumn
hi FoldColumn cterm=bold ctermfg=6 ctermbg=0
hi clear Folded
hi Folded cterm=bold ctermfg=6 ctermbg=0
hi clear LineNr
hi LineNr cterm=bold ctermfg=0
hi clear StatusLine
hi StatusLine cterm=bold ctermfg=0 ctermbg=7
hi clear StatusLineNC
hi StatusLineNC cterm=bold,reverse ctermfg=0 ctermbg=0
hi clear Title
hi Title ctermfg=3
hi clear VertSplit
hi VertSplit cterm=bold ctermfg=4 ctermbg=0

" extra - diff
hi clear DiffAdd
hi DiffAdd cterm=bold ctermfg=7 ctermbg=2
hi clear DiffChange
hi DiffChange cterm=underline
hi clear DiffDelete
hi DiffDelete cterm=bold ctermfg=7 ctermbg=1
hi clear DiffText
hi DiffText cterm=underline ctermfg=bg ctermbg=fg

" extra - matchparen
hi clear MatchParen
hi MatchParen cterm=bold ctermfg=7 ctermbg=4

" extra - spell
hi clear SpellBad
hi SpellBad cterm=bold,underline
hi clear SpellCap
hi clear SpellLocal
hi clear SpellRare
