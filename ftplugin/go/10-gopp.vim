if executable('goimports')
  let s:gofmt = 'goimports -d'
elseif executable('gofmt')
  let s:gofmt = 'gofmt -d'
else
  finish
end

function! Gopp_patchexpr()
  " same as default but -s[ilent]
  exe "call system('patch -s -o " . v:fname_out . " " . v:fname_in . " < " . v:fname_diff . "')"
endfunction
setlocal patchexpr=Gopp_patchexpr()

let s:patch = '/tmp/.vim/gopp.out'

if !exists('*Gopp_doit')
  function! Gopp_doit()
    silent! exe '!' . s:gofmt . ' ' . expand('%:p') . ' >| ' . s:patch . ' 2>&1'
    return v:shell_error
  endfunction
endif

if !exists('*Gopp_patch')
  function Gopp_patch(error, patch)
    if a:error != 0
      return
    endif
    " use vertical split to keep focus
    exe 'vert diffpatch ' . a:patch . ' | %diffput | close'
  endfunction
endif

command! -nargs=0 Gofmt call Gopp_patch(Gopp_doit(), s:patch)

nmap <buffer> gQ :Gofmt<CR>
