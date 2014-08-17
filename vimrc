set nocompatible
syntax on

filetype off

"let g:vundle_changelog_file="~/.vim/vundle_change_log"
"let g:vundle_log_file="~/.vim/vundle_log"
source ~/.vim/.vundle

set shell=/bin/sh

set background=dark
colorscheme solarized

" Change folding colors
"hi link Folded Statement
"hi link FoldColumn Statement

" Link diffAdded and diffRemoved to some things that happen to be green and red
" respectively
"hi link diffAdded Statement
"hi link diffRemoved Special
"hi link diffLine Comment

" I have no idea why this is necessary - for some reason,
" ctermbg and ctermfg are being swapped *only* for Comment and
" vimLineComment
"hi Comment ctermfg=8 ctermbg=10
"hi vimLineComment ctermfg=8 ctermbg=10

set mouse=a

set gfn=Inconsolata\ For\ Powerline\ 15

set autoread "reload file when changed outside of vim
set laststatus=2 "always show status lines on all windows
set noswapfile
set nobackup
set showcmd
set hidden
set history=1000
set backspace=indent,eol,start
set scrolloff=5
set sidescrolloff=10
set autoindent  "This retains indentation level on new lines

" Showing whitespace
set list listchars=tab:▷⋅,trail:·

" General indentation settings
set tabstop=2   "Set space width of tabs
set softtabstop=2
set shiftwidth=2 "amount to shift on >>/<<
set shiftround "Round indentation to multiple of shiftwidth
set expandtab "use spaces instead of tabs

set splitright  "By default, split to the right
set splitbelow
set number      "Add line numbers
set ruler       "Display Cursor Position
set title       "Display filename in titlebar
set titleold=   "Prevent the "Thanks for flying Vim"

set nohlsearch
set incsearch   "Display search resultings as you type
set ignorecase
set smartcase
set wildmenu
set nowrap

set formatoptions=tcroqn1j

set wildignore+=*/tmp/*

set diffopt=filler,vertical

filetype plugin on
filetype indent on

let mapleader=","
let maplocalleader=","

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

set statusline=%f    " Path.
set statusline+=%m   " Modified flag.
set statusline+=%r   " Readonly flag.
set statusline+=%w   " Preview window flag.

set statusline+=\    " Space.

set statusline+=%#redbar#                " Highlight the following as a warning.
"set statusline+=%{SyntasticStatuslineFlag()} " Syntastic errors.
set statusline+=%*                           " Reset highlighting.

set statusline+=%=   " Right align.

" File format, encoding and type.  Ex: "(unix/utf-8/python)"
set statusline+=(
set statusline+=%{&ft}                        " Type (python).
set statusline+=)

" Line and column position and counts.
set statusline+=\ (L%l\/%L,\ C%03c)

" toggle between last 2 buffers
nmap <C-E> :b#<CR>

" Toggle hlsearch
nnoremap <Leader>h :set hlsearch!<CR>

" Git Grep
nnoremap <Leader>gg :GitGrep<space>
vnoremap <Leader>gg "gy:GitGrep <C-R>g<CR>

" Folding
" Toggle fold
nnoremap <Space> za
set foldtext=getline(v:foldstart)

" Sort
vnoremap <Leader>s :sort<CR>

"Zoom
nnoremap <Leader>z :ZoomWin<CR>

"<Tab> and <S-Tab> switch between split screens
nnoremap <Tab> <C-w><C-w>
nnoremap <S-Tab> <C-w>W

" Mapping tab also remaps C-i, so make M-o do what C-i used to do
nnoremap <M-o> <C-i>

let g:vim_json_syntax_conceal = 0

"NERDTree
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>vv :NERDTreeFind<CR>
let g:NERDTreeRespectWildIgnore = 0

" returns true iff is NERDTree open/active
function! s:isNTOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! s:syncTree()
  if &modifiable && s:isNTOpen() && strlen(expand('%')) > 0 && expand('%') !~ "^/tmp" && !&diff && expand('%') !~ "\.git"
    let l:curwinnr = winnr()
    NERDTreeFind
    normal zb
    exec l:curwinnr . "wincmd w"
  endif
endfunction

autocmd BufEnter * call s:syncTree()

"NERDCommenter
let g:NERDCreateDefaultMappings = 0
map <Leader>// <plug>NERDCommenterToggle

" CtrlP
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v([\/]data$)|(source_maps)'
  \ }
nnoremap <leader>b :CtrlPBuffer<CR>
set wildignore+=*.o,.git,*.jpg,*.png,*.swp,*.d,*.gif,*.pyc,node_modules,*.class,*.crf,*.hg,*.orig,.meteor,public\/build
set wildignore+=source_maps
set wildignore+=coverage

" Yankring
nnoremap <silent> <leader>y :YRShow<CR>

" SnipMate
let g:snippets_dir="~/.vim/snippets/,~/.vim/bundle/snipmate.vim/snippets/"
ino <silent> <c-r><tab> <c-r>=TriggerSnippet()<cr>
snor <silent> <c-r><tab> <esc>i<right><c-r>=TriggerSnippet()<cr>
ino <silent> <c-r><c-s> <c-r>=ShowAvailableSnips()<cr>

" GUI Options
if has("gui_running")
  set guioptions=egt
  let g:Powerline_symbols = 'fancy'
endif

function! g:GenTags()
    echo system("ctags --exclude=.git --exclude=log -R * `echo $GEM_PATH | sed \"s/:/\\/gems\\/* /\" | sed \"s/$/\\/gems\\/*/\"`")
endfunction
map <Leader>rt :call g:GenTags()<CR>

let g:agprg="ag --column --smart-case"

vnoremap > >gv
vnoremap < <gv

" paste toggle
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" copy/paste stuff
nmap <leader><C-V> <F2>"+gp<F2>
imap <C-V> <ESC><F2>"+gP<F2>i
vmap <leader><C-C> "+y

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#002129 ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#002b36 ctermbg=4

command! Vimrc vsplit $MYVIMRC
command! VimrcReload source $MYVIMRC
command! VundleEdit vsplit ~/.vim/.vundle

let g:coffee_compiler = '/usr/bin/coffee'

augroup htmlabbrev
  autocmd!
  autocmd FileType html,haml :iabbrev <buffer> mdash &mdash;
  autocmd FileType html,haml :iabbrev <buffer> nbsp &nbsp;
  autocmd FileType html,haml :iabbrev <buffer> middot &middot;
augroup END

augroup json
  autocmd!
  autocmd BufNewFile,BufRead *.json set ft=json
augroup END

augroup vimrc
  autocmd!
  autocmd Filetype vim :nnoremap <buffer> <leader>h :execute "help " . expand("<cword>")<cr>
augroup END

augroup my_fugitive
  autocmd!
  autocmd Filetype gitcommit :set nolist
augroup END

" Creates a vertical split that continues the current file from the bottom of
" the buffer
noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

function! g:LoadProject(dir)
  exe 'cd ' . a:dir
  Rvm
  NERDTree
  normal <C-W><C-W>
  CtrlP
endfunction

command! -complete=dir -nargs=1 Start call g:LoadProject(<f-args>)

function! g:GemList(ArgLoad, CmdLine, CursorPos)
  return system("cat Gemfile | grep \"^\s*gem\" | sed -e \"s/\s*gem '\\([^']\\+\\)'.*/\\1/\"")
endfunction

command! -complete=custom,g:GemList -nargs=1 GemOpen :execute "e `bundle show " . <f-args> . "`"

command! -nargs=1 Hip :execute "silent !curl --data \"room_id=/dev/zero&from=Vim&message=" . <f-args> . "\" \"http://api.hipchat.com/v1/rooms/message?format=json&auth_token=baa4a52577bb53a90e73dbc948344c\""
