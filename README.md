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

$VIM_COFFEE_BIN - Set up your coffeescript binary file.

$VIM_PROJECT_DIR - Set up your projects dir for `:Start`


Project commands:

`cp ~/.vim/.env_sample ~/.vim/.env`

### Ag - The Silver Searcher
Install `the_silver_searcher` on Mac or `silversearcher-ag` on Ubuntu.

### Font/Powerline
I set it up to use a modified version of Inconsolata.
Follow the instructions in `~/.vim/bundle/vim-powerline` to patch your font.
Customize your `~/.vim/.env` file to have your font of choice.

## :Start

`:Start <dirname>` will do the following:
  * cd to `dirname`
  * open NERDTree
  * open CtrlP
