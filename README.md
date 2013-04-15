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
vim +BundleInstall
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
