" set environment
let _HOME_C=$HOME . "/lang/c"

silent! exe "!mkdir -p /tmp/.vim/c"

" cindent
set cindent cino=:0

" syntax/c.vim
let g:c_syntax_for_h=1
let g:c_no_curly_error=1
