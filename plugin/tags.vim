function! g:GenTags()
    echo system("ctags --exclude=.git --exclude=log -R * `echo $GEM_PATH | sed \"s/:/\\/gems\\/* /\" | sed \"s/$/\\/gems\\/*/\"`")
endfunction
map <Leader>rt :call g:GenTags()<CR>
