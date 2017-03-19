if exists("loaded_mymouse") || !has("mouse")
  finish
endif
let loaded_mymouse = 1

noremap    <RightMouse>   <nop>
noremap  <2-RightMouse>   <nop>
noremap  <3-RightMouse>   <nop>
noremap  <4-RightMouse>   <nop>
noremap    <RightRelease> <nop>
noremap    <RightDrag>    <nop>
inoremap   <RightMouse>   <nop>
inoremap <2-RightMouse>   <nop>
inoremap <3-RightMouse>   <nop>
inoremap <4-RightMouse>   <nop>
inoremap <RightRelease>   <nop>
inoremap <RightDrag>      <nop>

vnoremap <LeftMouse>  <LeftMouse>m>gvoo
nnoremap <RightMouse> <LeftMouse>i
vnoremap <RightMouse> <C-C>
inoremap <RightMouse> <Esc>

nnoremap   <MiddleMouse>   <LeftMouse>
nnoremap   <MiddleMouse>   <LeftMouse>
nnoremap <2-MiddleMouse>   "*P
nnoremap <3-MiddleMouse>   <nop>
nnoremap <4-MiddleMouse>   <nop>
vnoremap   <MiddleMouse>   o
vnoremap <2-MiddleMouse>   O
vnoremap <3-MiddleMouse>   "*y
vnoremap <4-MiddleMouse>   <nop>
inoremap   <MiddleMouse>   <nop>
inoremap <2-MiddleMouse>   <Esc>"*P
inoremap <3-MiddleMouse>   <nop>
inoremap <4-MiddleMouse>   <nop>

noremap    <MiddleDrag>    <nop>
noremap    <MiddleRelease> <nop>
inoremap   <MiddleDrag>    <nop>
inoremap   <MiddleRelease> <nop>

vnoremap   <ScrollWheelUp>   k<C-Y>
vnoremap <2-ScrollWheelUp>   k<C-Y>
vnoremap <3-ScrollWheelUp>   k<C-Y>
vnoremap <4-ScrollWheelUp>   k<C-Y>
vnoremap   <ScrollWheelDown> j<C-E>
vnoremap <2-ScrollWheelDown> j<C-E>
vnoremap <3-ScrollWheelDown> j<C-E>
vnoremap <4-ScrollWheelDown> j<C-E>
