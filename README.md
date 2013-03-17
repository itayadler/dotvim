dotvim
======

## Setup
```
git clone git://github.com/AsafGartner/dotvim.git
git submodule init
git submodule update
vim +BundleInstall
```

### Font/Powerline
I set it up to use a modified version of Inconsolata.
Follow the instructions in `~/.vim/bundle/vim-powerline` to patch your font.

### CoffeeCompile
edit `g:coffee_compiler` to point to your CoffeeScript binary.
