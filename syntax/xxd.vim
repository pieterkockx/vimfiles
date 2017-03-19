if !exists('main_syntax')
  if exists('b:current_syntax')
    finish
  endif
  let main_syntax = 'xxd'
endif

let s:cpo_save = &cpo
set cpo&vim

" standard HiLink does not work with included syntax files
command! -nargs=+ HiLink hi def link <args>

syn match xxdOffset "^\x\+:"
syn match xxdString "\(\x\x*  \)\@<=.\+$"

HiLink xxdOffset LineNr
HiLink xxdString Comment

delcommand HiLink

let b:current_syntax = 'xxd'

if main_syntax == 'xxd'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
