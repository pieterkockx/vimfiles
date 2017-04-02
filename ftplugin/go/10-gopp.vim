if !executable("gofmt") || !executable("goimports")
  finish
end

let s:GOPP_FILE = '/tmp/.vim/gofmt.go'

let s:gopp = '(cat >| ' . s:GOPP_FILE . ';'
let s:gopp = s:gopp . 'gofmt -w ' . s:GOPP_FILE . ';'
let s:gopp = s:gopp . 'goimports -w ' . s:GOPP_FILE . ';'
let s:gopp = s:gopp . 'cat ' . s:GOPP_FILE . ') 2>/dev/null'

augroup mygopp
au!

au QuickFixCmdPre  make call setpos("''", getcurpos())
au QuickFixCmdPre  make exe 'keepjumps %!' . s:gopp
au QuickFixCmdPost make call setpos(".", getpos("''"))

augroup END
