dotvim
======

## Setup
```
cd ~
git clone git://github.com/AsafGartner/dotvim.git
ln -s dotvim .vim
ln -s dotvim/vimrc .vimrc
cd .vim
git submodule init
git submodule update
vim +PluginInstall
```

### Ag - The Silver Searcher
Install `the_silver_searcher` on Mac or `silversearcher-ag` on Ubuntu.

### YouCompleteMe
See `bundle/YouCompleteMe/README.md`, but basically:
```
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
```

### Font/Powerline
I set it up to use a modified version of Inconsolata.
Follow the instructions in `~/.vim/bundle/vim-powerline` to patch your font.

### CoffeeCompile
edit `g:coffee_compiler` in `~/dotvim/vimrc` to point to your CoffeeScript binary.

## :Start

`:Start <dirname>` will do the following:
  * cd to `dirname`
  * run rvm
  * open NERDTree
  * open CtrlP
