if has("nvim")
  let g:scheme_repl = "csi -q"
  nnoremap <buffer> <silent><M-F2> :up<CR>
  \:if !exists("b:scheme_file") \|
  \   bo new +set\ ft=scheme \| let b:scheme_file=expand("#:p") \|
  \ else \| set nomod \| endif<CR>
  \:exe "call termopen('" . g:scheme_repl . " " . b:scheme_file . "')" \| startinsert<CR>
  tnoremap <buffer> <silent><M-F2> <C-\><C-N>:set nomod<CR>
  \:exe "call termopen('" . g:scheme_repl . " " . b:scheme_file . "')" \| startinsert<CR>
endif
