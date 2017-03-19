if !executable("gofmt")
  finish
end

setlocal formatprg='gofmt'

nmap <buffer> <silent><Leader><C-S> :up \| silent! !gofmt -w %<CR>:e<CR>
