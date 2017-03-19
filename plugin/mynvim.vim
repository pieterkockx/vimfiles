if exists("loaded_mynvim") || !has("nvim")
  finish
endif
let loaded_mynvim = 1

set shada+=rterm://

map <silent><F2> :sp term://bash \| startinsert<CR>
tnoremap    <F2> <C-\><C-N><C-W>c

tnoremap <M-CR> <C-\><C-N>`.f$w

noremap ]p "l]p
noremap [p "l[p

augroup mynvim
au!

au TextYankPost * call setreg('l', v:event['regcontents'], 'l')

au FileType man mapclear <buffer>

augroup END
