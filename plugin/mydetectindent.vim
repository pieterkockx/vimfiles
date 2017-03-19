if exists("loaded_mydetectindent")
  finish
endif
let loaded_mydetectindent = 1

let s:trailing = "trail:~"
let s:lcs = "nbsp:*," . s:trailing
let s:hide_tab = s:lcs . ",tab:  "
let s:show_tab = s:lcs . ",tab:>-"

" when set to 0 'lcs' is not changed by DetectIndent
let _lcs = 1

function DetectIndent(flag)
  if search('^\t', 'cnw', 0, 10)
    if (a:flag) | let &lcs=s:hide_tab | endif
    if &expandtab || &shiftwidth != 0
      set tabstop=8 softtabstop=4 shiftwidth=0 noexpandtab
    endif
  else
    if search('^  [^ ]', 'cnw', 0, 10)
      if (a:flag) | let &lcs=s:show_tab | endif
      if &tabstop != 2
        set tabstop=2 softtabstop=-1 shiftwidth=0 expandtab
      endif
    elseif search('^     *[^ ]', 'cnw', 0, 10)
      if (a:flag) | let &lcs=s:show_tab | endif
      if &tabstop != 4
        set tabstop=4 softtabstop=-1 shiftwidth=0 expandtab
      endif
    endif
  endif
endfunction

augroup mydetectindent
au!

au WinEnter,BufWinEnter,InsertEnter,InsertLeave * call DetectIndent(_lcs)

au InsertEnter * exe "set lcs-=" . s:trailing
au InsertLeave * exe "set lcs+=" . s:trailing

augroup END
