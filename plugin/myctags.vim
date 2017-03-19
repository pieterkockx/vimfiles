if exists("loaded_myctags")
  finish
endif
let loaded_myctags = 1

if !executable("ctags")
  finish
endif

silent! exe "!mkdir -p /tmp/.vim/ctags"

augroup myctags
au!

au BufEnter,BufRead,BufWritePost *.c,*.erl,*.go,*.h,*.js,Makefile,*.scm
\ silent! exe "!ctags -f /tmp/.vim/ctags/" .
\ expand("%:p:h:t") . "." . expand("%:p:e") . " " .
\ expand("%:p:h") . "/*." . expand("%:e") . " 2>/dev/null" |
\ let &tags="/tmp/.vim/ctags/" .
\ expand("%:p:h:t") . "." . expand("%:p:e") . "," . &tags

augroup END
