set path+=/usr/lib/go/src
set tabstop=8 shiftwidth=0 softtabstop=0 noexpandtab

let &makeprg="go build"

if has("nvim")
  let &keywordprg  = ":pcl | 8new godoc-<cword> | set pvw bt=nofile bh=hide noswf | silent! 0r !go doc"
endif
