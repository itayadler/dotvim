dotvim
======

## Setup
```
cd ~
git clone git://github.com/itayadler/dotvim.git
ln -s dotvim .vim
ln -s dotvim/vimrc .vimrc
vim +PlugInstall
```
You can set up some customization variables in .env
$VIM_COFFEE_BIN - Set up your coffeescript binary folder.
$VIM_PROJECT_DIR - Set up your projects for the custom `Start`
project command
`cp ~/.vim/.env_sample ~/.vim/.env`

### Ag - The Silver Searcher
Install `the_silver_searcher` on Mac or `silversearcher-ag` on Ubuntu.

### Font/Powerline
I set it up to use a modified version of Inconsolata.
Follow the instructions in `~/.vim/bundle/vim-powerline` to patch your font.
Customize your `~/.vim/.env` file to have your font of choice.

### CoffeeCompile
Customize your `~/.vim/.env` file to have $VIM_COFFEE_BIN to point to your CoffeeScript binary.

## :Start

`:Start <dirname>` will do the following:
  * cd to `dirname`
  * open NERDTree
  * open CtrlP
