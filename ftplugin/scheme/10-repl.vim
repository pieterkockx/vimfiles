if has("nvim")
  nnoremap <buffer> <silent><F3> :up<CR>
  \:if !exists("b:schemeFile") \|
  \   bo new +set\ ft=scheme \| let b:schemeFile=expand("#:p") \|
  \ else \| set nomod \| endif<CR>
  \:exe "call termopen('csi -q " . b:schemeFile . "')" \| startinsert<CR>
  tnoremap <buffer> <silent><F3> <C-\><C-N>:set nomod<CR>
  \:exe "call termopen('csi -q " . b:schemeFile . "')" \| startinsert<CR>

  tnoremap <buffer> <M-CR> <C-\><C-N>`.0f l
endif
