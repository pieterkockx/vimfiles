if has("nvim")
  nmap <buffer> <silent><F3> :up<CR>
  \:bo new<CR>:let
  \ w:schemeFile=expand("#:p")<CR>:set
  \ bt=nofile bh=wipe ft=scheme \|
  \ exe "call termopen('csi -q " . w:schemeFile . "')" \|
  \ startinsert<CR>

  tnoremap <buffer> <M-CR> <C-\><C-N>`.0f l

  tnoremap <buffer> <M-Tab> <C-\><C-N><C-W>p`^
  nnoremap <buffer> <M-Tab> <C-W>pgi
  inoremap <buffer> <M-Tab> <Esc><C-W>pgi
endif
