if exists("loaded_myquickfix")
  finish
endif
let loaded_myquickfix = 1

function QuickfixList()
  try
    cl
  catch /^Vim\%((\a\+)\)\=:E42/
    echo "Nothing to fix"
  endtry
endfunction
function QuickfixFile()
  exe "set errorfile=" . g:_DATA_VIM . "/quickfix/" .
  \ expand("%:t:r") . "." . expand("%:t:e") . ".err"
  silent! exe "!>>" . &errorfile
  return &errorfile
endfunction

" controls
nmap <silent><Right> :silent! cn \| try \| cc \|
                     \ catch /^Vim\%((\a\+)\)\=:E42/ \|
                     \ echo "Nothing to fix" \| endtry<CR>
nmap <silent><Left>  :silent! cp \| try \| cc \|
                     \ catch /^Vim\%((\a\+)\)\=:E42/ \|
                     \ echo "Nothing to fix" \| endtry<CR>
nmap <silent><Up>    :bo copen 7 \| cw<CR>
nmap <silent><Down>  :ccl<CR>

" load - file
nmap <silent><Leader>qf :exe "cg " . QuickfixFile()<CR>:echo &errorfile<CR>
nmap <silent><Leader>q<C-F> :silent! exe "to new " . QuickfixFile()<CR>

" load - vimgrep
nmap <silent><Leader>vg :exe "silent! vimgrep /" .
                        \ escape(input("<vimgrep>: "), '/') . "/j " .
                        \ join(argv(), ' ') \| bo copen 7 \| cw<CR>

nmap <silent><F5> :let &makeef=QuickfixFile()<CR>:make!<CR>

augroup myquickfix
au!

au FileType qf
\ nnoremap <buffer> <silent><Up> :if exists("w:quickfix_title")
\ && !(w:quickfix_title =~ "^:\(cs\|make\) ") \|
\ exe substitute(w:quickfix_title, '^:', '', '') \| endif<CR><C-W>p

augroup END
