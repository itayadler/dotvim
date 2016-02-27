source ~/.vim/.env
set nocompatible
syntax on

filetype off

source ~/.vim/.vimplug

set shell=/bin/sh

set background=dark
colorscheme solarized

filetype plugin on
filetype indent on

let mapleader=","
let maplocalleader=","

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

set foldtext=getline(v:foldstart)

" See plugins folder for more
