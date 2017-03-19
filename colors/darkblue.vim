" :he group-name
" :he highlight-groups
" :he cterm-colors

" put `hi clear Normal` first
hi clear Normal

set background&

" :hi clear alone isn't sufficient since it just resets to default
hi clear

if exists("syntax_on")
  syntax reset
endif
let colors_name="darkblue"

" global
hi Normal guifg=#e0e0e0 guibg=#0b1a2f
hi clear Visual
hi Visual guifg=#ffffff guibg=#483860
hi clear NonText
hi NonText gui=bold guifg=#3f51b5

" cursor
hi clear Cursor
hi Cursor guibg=#1df073
hi clear ColorColumn
hi ColorColumn guifg=#e0e0e0 guibg=#7074d0
hi clear CursorColumn
hi CursorColumn guifg=#e0e0e0 guibg=#7074d0
hi clear CursorLine
hi CursorLine gui=underline

" menus
hi clear Pmenu
hi Pmenu gui=bold guifg=#101010 guibg=#3f51b5
hi clear PmenuSbar
hi clear PmenuSel
hi PmenuSel gui=bold guifg=#3f51b5 guibg=#101010
hi clear PmenuThumb
hi clear WildMenu
hi WildMenu gui=bold guifg=#3f51b5 guibg=#101010

" messages
hi clear ErrorMsg
hi ErrorMsg guifg=#d9534f
hi clear ModeMsg
hi ModeMsg guifg=#3f51b5
hi clear MoreMsg
hi MoreMsg guifg=#3f51b5
hi clear WarningMsg

" search
hi clear IncSearch
hi IncSearch gui=bold guifg=#00d8f8
hi clear Search
hi Search gui=bold,underline guifg=#00e8f8

" syntax
hi clear Comment
hi Comment guifg=#6f6ba7
hi clear Constant
hi clear Identifier
hi clear Keyword
hi clear PreProc
hi clear Special
hi Special gui=bold guifg=#8b5ba3
hi clear Statement
hi clear String
hi String guifg=#818a91
hi clear Type

" text
hi clear Directory
hi Directory guifg=#6f6ba7
hi clear Error
hi Error guifg=#d9534f
hi clear Question
hi Question gui=bold,underline guifg=#6f6ba7
hi clear SpecialKey
hi SpecialKey gui=bold guifg=#00e8f8
hi clear Todo
hi Todo gui=bold,underline guifg=#6f6ba7

" view
hi clear FoldColumn
hi FoldColumn guifg=#3f51b5 guibg=#0b1a2f
hi clear Folded
hi Folded gui=bold guifg=#3f51b5 guibg=#0b1a2f
hi clear LineNr
hi LineNr gui=bold guifg=#808080
hi clear StatusLine
hi StatusLine gui=bold guifg=#483860 guibg=#7074d0
hi clear StatusLineNC
hi StatusLineNC gui=bold guifg=#7074d0 guibg=#483860
hi clear Title
hi Title gui=underline
hi clear VertSplit
hi VertSplit guifg=#3f51b5 guibg=#0b1a2f

" extra - diff
hi clear DiffAdd
hi DiffAdd guifg=#e0e0e0 guibg=#3f51b5
hi clear DiffChange
hi DiffChange
hi clear DiffDelete
hi DiffDelete gui=bold guifg=#101010 guibg=#3f51b5
hi clear DiffText
hi DiffText gui=underline guifg=#0b1a2f guibg=#e0e0e0

" extra - matchparen
hi clear MatchParen
hi MatchParen gui=bold guifg=#e0e0e0 guibg=#7074d0

" extra - spell
hi clear SpellBad
hi SpellBad gui=bold,underline
hi clear SpellCap
hi clear SpellLocal
hi clear SpellRare
