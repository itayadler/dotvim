" toggle between last 2 buffers
nmap <C-E> :b#<CR>

" Toggle hlsearch
nnoremap <Leader>h :set hlsearch!<CR>

" Folding
" Toggle fold
nnoremap <Space> za

" <Tab> and <S-Tab> switch between split screens
nnoremap <Tab> <C-w><C-w>
nnoremap <S-Tab> <C-w>W

" Mapping tab also remaps C-i, so make M-o do what C-i used to do
nnoremap <M-o> <C-i>

" NERDTree
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>vv :NERDTreeFind<CR>

" NERDCommenter
map <Leader>// <plug>NERDCommenterToggle

" CtrlP
nnoremap <leader>b :CtrlPBuffer<CR>

" Yankring
nnoremap <silent> <leader>y :YRShow<CR>

" Indentation
vnoremap > >gv
vnoremap < <gv

" paste toggle
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" copy/paste stuff
nmap <leader><C-V> <F2>"+gp<F2>
imap <C-V> <ESC><F2>"+gP<F2>i
vmap <leader><C-C> "+y

" Creates a vertical split that continues the current file from the bottom of
" the buffer
noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

" delete without yank
nnoremap <Leader>d "_dd
vnoremap <Leader>d "_d

" Zoom
nnoremap <Leader>z :ZoomWin<CR>

" Applies only in .vim files
augroup vimrc
  autocmd!
  autocmd Filetype vim :nnoremap <buffer> <leader>h :execute "help " . expand("<cword>")<cr>
augroup END

nnoremap <Leader>gm :GMoveFile <C-R>=expand("%")<CR>
