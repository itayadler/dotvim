" vim-json
let g:vim_json_syntax_conceal = 0

" NERDTree
let g:NERDTreeRespectWildIgnore = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeMapToggleHidden = 0
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_open_on_gui_startup=1
let g:nerdtree_tabs_autofind=1

" NERDCommenter
let g:NERDCreateDefaultMappings = 0

" CtrlP
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v([\/]data$)|(source_maps)'
  \ }

" Coffeescript
let g:coffee_compiler = $VIM_COFFEE_BIN

" Ag
let g:agprg="ag --column --smart-case"
let g:ag_qhandler="copen"

" Fugitive
" Disable list charaters on commit screen
augroup my_fugitive
  autocmd!
  autocmd Filetype gitcommit :set nolist
augroup END
