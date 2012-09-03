syntax on

set t_Co=16
set background=dark
colorscheme solarized
" Change folding colors
hi link Folded Statement
hi link FoldColumn Statement

" Link diffAdded and diffRemoved to some things that happen to be green and red
" respectively
hi link diffAdded Statement
hi link diffRemoved Special
hi link diffLine Comment

" I have no idea why this is necessary - for some reason,
" ctermbg and ctermfg are being swapped *only* for Comment and
" vimLineComment
hi Comment ctermfg=8 ctermbg=10
hi vimLineComment ctermfg=8 ctermbg=10

let g:syntastic_auto_loc_list=0
let g:syntastic_enable_signs=1
set mouse=a

set gfn=Inconsolata\ For\ Powerline\ 15

filetype off

" Set up Vundle
" This also includes all of the plugins I use
"
" Run :BundleInstall to install all of the plugins
source ~/.vim/.vundle

set conceallevel=2
let g:tex_conceal="admgs"
set autoread
set autowrite
set laststatus=2
set noswapfile
set nobackup
set showcmd
set hidden
set history=1000
set autoread
set backspace=indent,eol,start


set autoindent  "Auto Indent code - This simply retains indentation level

" Showing whitespace
set list listchars=tab:▷⋅,trail:·

" General indentation settings

" Note that these vary from language to language
set tabstop=2   "Set space width of tabs
set softtabstop=2
set sw=2
set expandtab

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

set formatoptions=tcroqnl1

set wildignore+=*/tmp/*

filetype plugin on
filetype indent on

let mapleader=","
let maplocalleader=","

" Round indentation to multiple of shiftwidth
set shiftround

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
set statusline+=%{SyntasticStatuslineFlag()} " Syntastic errors.
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

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L g_

" Git Grep
nnoremap <Leader>gg :GitGrep<space>
vnoremap <Leader>gg "gy:GitGrep <C-R>g<CR>

" Folding
" Toggle fold
nnoremap <Space> za
set foldtext=getline(v:foldstart)

" Sort
" Select a block of text in visual mode then hit ,s
vnoremap <Leader>s :sort<CR>

"Zoom
nnoremap <Leader>z :ZoomWin<CR>

"<Tab> and <S-Tab> switch between split screens
nnoremap <Tab> <C-w><C-w>
nnoremap <S-Tab> <C-w>W

" Mapping tab also remaps C-i, so make C-p do what C-i used to do
nnoremap <C-p> <C-i>

"NERDTree
map <Leader>n :NERDTreeToggle<CR>

"NERDCommenter
let g:NERDCreateDefaultMappings = 0
map <Leader>// <plug>NERDCommenterAlignLeft
map <Leader>/, <plug>NERDCommenterUncomment

"Gundo
nmap <Leader>u :GundoToggle<CR>

",p copies the current filepath
nmap <Leader>p :!echo `pwd`/% \| pbcopy<CR><CR>

" Tabularize
vmap <Leader>t :Tabularize /

" CtrlP
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_clear_cache_on_exit = 1
nnoremap <leader>b :CtrlPBuffer<CR>
set wildignore+=*.o,.git,*.jpg,*.png,*.swp,*.d,*.gif,*.pyc,node_modules,*.class,*.crf,*.hg,*.orig,.meteor

" Yankring
nnoremap <silent> <leader>y :YRShow<CR>

" OmniCompletion
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3

autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" SnipMate
let g:snippets_dir="~/.vim/snippets/,~/.vim/bundle/snipmate.vim/snippets/"
ino <silent> <c-r><tab> <c-r>=TriggerSnippet()<cr>
snor <silent> <c-r><tab> <esc>i<right><c-r>=TriggerSnippet()<cr>
ino <silent> <c-r><c-s> <c-r>=ShowAvailableSnips()<cr>

" Search for selected text, forwards or backwards.
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
  \:set hlsearch<CR><C-o>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" GUI Options
if has("gui_running")
  set guioptions=egt
  let g:Powerline_symbols = 'fancy'
endif

"LANGUAGE SPECIFIC COMMANDS
"
" For all languages:
"  <Leader>c - Syntax Check / Compile
"  <Leader>r - Execute
"
" See ftplugin/*.vim

function! g:GenTags()
    echo system("ctags --extra=+f --exclude=.git --exclude=log -R * " . $GEM_HOME ."/gems/*")
endfunction
map <Leader>rt :call g:GenTags()<CR>

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" paste toggle
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" copy/paste stuff
nmap <C-V> <F2>"+gP<F2>
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y

autocmd BufNewFile,BufRead *.json set ft=json
