if !executable("gocode")
  finish
endif

setlocal completeopt=menuone,noselect
setlocal omnifunc=gocomplete#Complete
