syntax on

filetype off

let g:vundle_changelog_file="~/.vim/vundle_change_log"
let g:vundle_log_file="~/.vim/vundle_log"
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

"NERDTree
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>v :NERDTreeFind<CR>

"NERDCommenter
let g:NERDCreateDefaultMappings = 0
map <Leader>// <plug>NERDCommenterToggle

" CtrlP
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]data$'
  \ }
nnoremap <leader>b :CtrlPBuffer<CR>
set wildignore+=*.o,.git,*.jpg,*.png,*.swp,*.d,*.gif,*.pyc,node_modules,*.class,*.crf,*.hg,*.orig,.meteor
set wildignore+=source_maps

" Yankring
nnoremap <silent> <leader>y :YRShow<CR>

" OmniCompletion
set completeopt=longest,menuone,preview
set omnifunc=syntaxcomplete#Complete
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

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
    echo system("ctags --exclude=.git --exclude=log -R * `bundle show rails`/../*")
endfunction
map <Leader>rt :call g:GenTags()<CR>

let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>sc :Ack --coffee 
nnoremap <leader>sr :Ack --ruby 

" paste toggle
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" copy/paste stuff
nmap <leader><C-V> <F2>"+gP<F2>
imap <C-V> <ESC><C-V>i
vmap <leader><C-C> "+y

command! Vimrc vsplit $MYVIMRC
command! VimrcReload source $MYVIMRC
command! VundleEdit vsplit ~/.vim/.vundle

let g:coffee_compiler = '/home/asafg/projects/node/node-v0.6.6/node_modules/coffee-script/bin/coffee'

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
  autocmd Filetype vim :nnoremap <buffer> <leader>h :execute "help '" . expand("<cword>") . "'"<cr>
augroup END

function! g:LoadProject(dir)
  exe 'cd ' . a:dir
  Rvm
  NERDTree
  normal <C-W><C-W>
  CtrlP
endfunction

command! -complete=dir -nargs=1 Start call g:LoadProject(<f-args>)
