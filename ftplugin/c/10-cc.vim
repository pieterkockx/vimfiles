if exists("$CC")
  let _CC=$CC
elseif executable("gcc")
  let _CC="gcc"
else
  finish
end

if !exists("loaded_myquickfix")
  finish
endif

nmap <buffer> <silent><F7><F7> :up<CR>
     \:silent! exe "!" . _CC . " -o /tmp/a.out " .
     \ "$(sed -n '/^$/q;p' " . _HOME_C . "/cc-opts \| xargs) " .
     \ expand("%:p") . " $(sed -n '$P' " . _HOME_C . "/cc-opts) &>" .
     \ QuickfixFile() . " && " . "cp " . expand("%:p") . " " . _HOME_C .
     \ "/src/local/out/" . strftime("%y%m%d-") . expand("%:t:r") . ".c"<CR>
     \:cg \| call QuickfixList()<CR>

nmap <buffer> <silent><F7><F6> :up<CR>
     \:silent! exe "!" . _CC . " -fsyntax-only " .
     \ "$(sed -n '/^$/q;p' " . _HOME_C . "/cc-opts \| xargs) " .
     \ expand("%:p") . " &> " . QuickfixFile()<CR>
     \:cg \| call QuickfixList()<CR>

nmap <buffer> <silent><F8><F7> :exe "bo 5new " .
     \ _HOME_C . "/cc-opts"<CR>:set bh=wipe nowrap number<CR>

nmap <buffer> <silent><F8><F9> :up<CR>
     \:silent! exe "!" . _CC . " -E -H " .
     \ expand("%") . " 2>\|/tmp/.vim/c-hdept-%:t:r \| " .
     \ "sed '/^\\#/d;/./,/^$/\\!d' >\| " .
     \ "/tmp/.vim/c-cpp-" . expand("%:t:r") . ".c"<CR>
     \:new \| argl /tmp/.vim/c-cpp-#:t:r.c /tmp/.vim/c-hdept-#:t:r<CR>
