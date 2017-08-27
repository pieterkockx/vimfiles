if exists('$GOPATH')
  set path+=$GOPATH
end

if exists('$GOROOT')
  set path+=$GOROOT
end

set tabstop=8 shiftwidth=0 softtabstop=0 noexpandtab
" plugin/mydetectindent.vim
let _lcs = 0

" makeprg
let &makeprg='go build'

" keywordprg
if has('nvim')
  function! Keywordprg(args)
    8new
    exe "call termopen('go doc " . a:args . "')"
  endfunction
  command! -nargs=1 Godoc call Keywordprg('<args>')
  let &keywordprg=':Godoc'
endif

noremap <silent>K :set iskeyword+=.<CR>K:wincmd p<CR>:set iskeyword-=.<CR>
