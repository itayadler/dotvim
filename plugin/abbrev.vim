augroup htmlabbrev
  autocmd!
  autocmd FileType html,haml :iabbrev <buffer> mdash &mdash;
  autocmd FileType html,haml :iabbrev <buffer> nbsp &nbsp;
  autocmd FileType html,haml :iabbrev <buffer> middot &middot;
augroup END

