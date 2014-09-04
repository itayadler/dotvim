" returns true iff is NERDTree open/active
function! s:isNTOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! s:syncTree()
  if &modifiable && s:isNTOpen() && strlen(expand('%')) > 0 && expand('%') !~ "^/tmp" && !&diff && expand('%') !~ "\.git"
    let l:curwinnr = winnr()
    NERDTreeCWD
    exec l:curwinnr . "wincmd w"
    NERDTreeFind
    normal zb
    exec l:curwinnr . "wincmd w"
  endif
endfunction

autocmd BufEnter * call s:syncTree()

