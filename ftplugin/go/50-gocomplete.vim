if !executable("gocode")
  finish
endif

setlocal completeopt=menuone
setlocal omnifunc=gocomplete#Complete
