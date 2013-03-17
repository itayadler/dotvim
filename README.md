dotvim
======

## Setup
```
cd ~
git clone git://github.com/AsafGartner/dotvim.git
git submodule init
git submodule update
ln -s dotvim .vim
ln -s dotvim/vimrc .vimrc
vim +BundleInstall
```

### Font/Powerline
I set it up to use a modified version of Inconsolata.
Follow the instructions in `~/.vim/bundle/vim-powerline` to patch your font.

### CoffeeCompile
edit `g:coffee_compiler` in `~/dotvim/vimrc` to point to your CoffeeScript binary.
