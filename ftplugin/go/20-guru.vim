if !executable('guru')
  finish
endif

if !exists('*Goguru_doit')
  function Goguru_doit(pos)
    let l:str = system('guru definition ' . expand('%:p') . ':#' . a:pos)
    let l:lst = split(l:str, ':')
    if filereadable(l:lst[0])
      exe 'tabedit ' .  ' +' . l:lst[1] . ' ' . l:lst[0]
    endif
  endfunction
endif

command! -nargs=0 Goguru call Goguru_doit(line2byte('.')+col('.')-1)

nmap <buffer> <silent>gD :Goguru<CR>
