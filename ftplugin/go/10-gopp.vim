if !executable("gofmt") || !executable("goimports")
  finish
end

let &formatprg='gofmt | goimports'

au QuickFixCmdPre  make call setpos("''", getcurpos())
au QuickFixCmdPre  make keepjumps %!gofmt | goimports
au QuickFixCmdPost make call setpos(".", getpos("''"))
