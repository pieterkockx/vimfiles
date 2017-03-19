" -------------------------------------------------------------------------
" SETTINGS
" -------------------------------------------------------------------------

set nocompatible
set ttyfast
set encoding=utf-8 langnoremap
set backspace=indent,eol,start
set mouse=a mousemodel=extend

set backup undofile
let _DATA_VIM=$HOME . "/.local/share/vim"
let  &dir=_DATA_VIM . "/swap"
let &bdir=_DATA_VIM . "/backup"
let &udir=_DATA_VIM . "/undo"

let _CONFIG_VIM=$HOME . "/.config/vim"
let &runtimepath=_CONFIG_VIM . "," . _DATA_VIM . "," . &runtimepath

set autoread autowrite
set history=10000 sessionoptions-=options
set viminfo=!,'16,h,r/tmp/.vim,s10,<1000
set path=.;~;/tmp
set tags=./tags;,tags

set belloff=all
set cmdheight=2 foldcolumn=2 laststatus=2
set foldopen-=block foldopen-=jump
set ignorecase smartcase
set nohlsearch incsearch
set list
let &listchars="nbsp:*,trail:~,tab:  "
set nrformats=bin,hex
set scrolloff=3
set shortmess=aotcIF
set showcmd ttimeout ttimeoutlen=10
set virtualedit=block
set nowrap nolinebreak display=lastline

set shiftwidth=4 softtabstop=4
set textwidth=76 formatoptions=bcoqj nojoinspaces

function! FoldText()
  let l = v:foldstart
  let L = getline(l)
  while l < v:foldend && empty(L)
    let l = l+1
    let L = getline(l)
  endwhile
  let n = v:foldend-v:foldstart . " lines: "
  return n . L
endfunction
set foldtext=FoldText()

function! CheckDir()
  if getcwd() == expand("%:p:h")
    return ""
  else
    return "^"
  endif
endfunction
function! UsesTabs()
  if !&et
    return "<TAB>"
  else
    return ""
endfunction
function! SavedVersions()
  let l:u = undotree()
  return  "(" . l:u["save_cur"] . "/" . l:u["save_last"] . ")"
endfunction
set statusline=---\ %(%{CheckDir()}%)%t%h%m%r%{SavedVersions()}
set statusline+=\ [%{&ff}:%{&fenc}][%{&ft}:%{&ts}%{UsesTabs()}]
set statusline+=%=col\ %c,\ ln\ %l\ of\ %{line(\"$\")}

set autoindent smartindent smarttab
set complete=.,w,b
set completeopt=menu
set showmatch
set spelllang=en_us,nl
set wildmenu

syntax          on
filetype plugin on
filetype indent off

if has("gui_running")
  colorscheme darkblue
else
  colorscheme default
endif

autocmd BufReadPost *
\ if line("'\"") >= 1 && line("'\"") <= line("$") |
\   execute "normal! g`\"" |
\ endif

" -------------------------------------------------------------------------
"  PROFILES
" -------------------------------------------------------------------------

" netrw
let g:netrw_home=_DATA_VIM

" GUI
if has("gui_running")
  set guioptions=
  set guicursor=a:hor10-blinkoff0

  if has("gui_gtk2")
    set guifont=monospace:h13
  elseif has("gui_win32")
    set guifont=Consolas:h13
    set winaltkeys=no
    au GUIEnter * simalt ~x
  endif
endif

" -------------------------------------------------------------------------
" MAPPINGS
" -------------------------------------------------------------------------

let mapleader = "\<Space>"
let _sign = ["-", "+"]

" capture unmapped leader chords
noremap   <silent><Leader> :<C-U>while (getchar(0)) \| endwhile<CR>
onoremap  <silent><Leader> <Esc>

" meta-key behavior is inconsistent across platforms
inoremap <silent><M-u> <Esc>:silent! exe "normal! u"<CR>

" unmap
map     Q  <nop>
imap <C-P> <nop>
map   <F1> <nop>
imap  <F1> <nop>

" file
nmap     <C-S>              :w<CR>
vnoremap <C-S>              :<C-U>silent! '<,'>w! >><Space>
nmap     g<C-F>             :up \| e <cfile><CR>
vnoremap g<C-F>             "9y:up \| e <C-R>9<CR>
nmap     <silent><Leader>sw :let _sw=line(".")<CR>:new<CR>
                            \:set bt=nofile bh=hide noswf<CR>
                            \:r # \| 0d_<CR>
                            \:exe _sw \| unlet _sw<CR>
nmap     <silent><Leader>cd :silent! cd %:h \| pwd<CR>
nmap     <silent><Leader>lc :silent! lc %:h \| pwd<CR>

" arglist
nmap <Leader>n   :silent! next<CR>:args<CR>
nmap <Leader>N             :la<CR>:args<CR>
nmap <Leader>p   :silent! prev<CR>:args<CR>
nmap <Leader>P            :rew<CR>:args<CR>
nmap <Leader>aa      :argadd %<CR>:args<CR>
nmap <Leader>ad        :argd %<CR>:args<CR>

" lists
nmap <Leader>ls :ls<CR>:exe  "b " . input("<buffer>: ")<CR>
nmap <Leader>l! :ls!<CR>:exe "b " . input("<buffer>: ")<CR>
nmap <Leader>lo :browse old!<CR>

function! EmptyInputCancels_leftbracketI()
  let i = input("<nr>: ")
  if empty(i)
    return "``"
  else
    return i . "[\t"
  endif
endfunction
nnoremap [I m`[I:exe "normal! " . EmptyInputCancels_leftbracketI()<CR>

" clipboard
set pastetoggle=<F12>

nnoremap Y   y$
vnoremap Y "+y

nmap <silent>gh :silent! exe "normal! `[v`]"<CR>

" scrolling
vnoremap <C-D> <C-E><C-E><C-E>
vnoremap <C-U> <C-Y><C-Y><C-Y>

noremap <C-F> 4zl
noremap <C-B> 4zh

" search - summary
function! EmptyInputCancels_gp()
  let i = input("<line>: ")
  if empty(i)
    return "normal! ``"
  else
    return i
  endif
endfunction
nnoremap <silent><Leader>gp               m`:keepj g//#p<CR>
                            \:exe EmptyInputCancels_gp()<CR>
vnoremap <silent><Leader>gp     m`:<C-U>keepj '<,'>g//#p<CR>
                            \:exe EmptyInputCancels_gp()<CR>

nmap <Leader>gn :%s///gn<CR>
vmap <Leader>gn  :s///gn<CR>

" search - replace
nmap <Leader>r  :set nohls<CR>:s:::g<Left><Left><Left>
vmap <Leader>r         :s:::gc<Left><Left><Left><Left>
nmap <Leader>gr       :%s:::gc<Left><Left><Left><Left>

" search - selection
vnoremap * "9y:let @/ = "\\V" . escape(@9, '\/')<CR>ngn
vnoremap # "9y:let @/ = "\\V" . escape(@9, '\/')<CR>Ngn

" view - more
nnoremap <silent>Q  :set hls!<CR>
vmap     <silent>Q  <C-C><C-Q>gv

nnoremap <silent><C-Q> :exe "set cuc! cul!" \| let &cc=&tw*&cuc<CR>
vmap     <silent><C-Q> <C-C>g<C-Q>gv

nnoremap <silent>1<C-G> :set nu!<CR>
vmap     <silent>1<C-G> <C-C>1<C-G>gv

nnoremap  <silent>4<C-G> :exe "set lcs" . _sign[_lcs] . "=" .
                         \ "eol:$,space:.,tab:>-" \| let _lcs=!_lcs<CR>
vmap      <silent>4<C-G> <C-C>4<C-G>gv

nmap <silent><F1> :if !empty(&spl) \| let &spell=!&spell \|
                  \if (&spell) \| echo "Spelling ON" \|
                  \else \| echo "Spelling OFF" \| endif \| endif<CR>

" view - wrap
                        let _lbr = 0
                       " (lbr is ignored when wrap is off)
nmap <silent><Leader>w :let &lbr=!&lbr \| let _lbr=(_lbr+1)%3 \|
                       \let &wrap=(_lbr*_lbr)%3 \| if &wrap && &lbr \|
                       \ echo "wrap SOFT"    \| elseif &wrap \|
                       \ echo "wrap HARD"    \| else \|
                       \ echo "wrap OFF"    \| endif<CR>

" window management
nnoremap q  <C-W>

noremap          qq q
nnoremap <silent>qn :keepalt wincmd n<CR>
                    \:setlocal bt=nofile bh=hide noswf<CR>

au CmdwinEnter * map <buffer> qc <C-C><C-C>

" CMDWIN
set cedit=<C-Q>
cnoremap  <C-A>  <Home>
cnoremap  <C-B>  <Left>
cnoremap  <C-D>  <Del>
cnoremap  <C-E>  <End>
cnoremap  <C-F>  <Right>
cnoremap  <C-N>  <Down>
cnoremap  <C-P>  <Up>

cnoremap  <M-b>  <C-Left>
cnoremap  <Esc>b <C-Left>
cnoremap  <M-f>  <C-Right>
cnoremap  <Esc>f <C-Right>

" INSERT
inoremap <C-A>   <Esc>I
inoremap <C-B>   <Left>
inoremap <C-D>   <Del>
inoremap <C-E>   <Esc>A
inoremap <C-F>   <Right>
inoremap <C-U>   <C-G>u<C-U>
