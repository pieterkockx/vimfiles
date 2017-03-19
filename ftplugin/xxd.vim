augroup Binary
au!

au BufWritePre  <buffer> %!xxd -r
au BufWritePost <buffer> %!xxd

augroup END
