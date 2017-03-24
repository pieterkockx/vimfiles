set path+=/usr/lib/go/src

set tabstop=8 shiftwidth=0 softtabstop=0 noexpandtab
" plugin/mydetectindent.vim
let _lcs = 0

let &makeprg="go build"

if has("nvim")
  function! Keywordprg(args)
    let bufname = "godoc-" . a:args
    let exists = 0
    if bufexists(bufname) | let exists = 1 | endif
    set nopreviewwindow
    pclose
    exe "8new " . bufname
    set previewwindow buftype=nofile bufhidden=hide noswapfile
    if !exists
      silent! exe "0r !go doc " . a:args
      1
    endif
    wincmd p
  endfunction
  command! -nargs=1 Godoc call Keywordprg("<args>")
  let &keywordprg=":Godoc"
endif
