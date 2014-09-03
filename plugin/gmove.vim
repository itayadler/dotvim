function! g:GMoveFile(file)
  exe 'Gmove ' . a:file
  let l:curwinnr = winnr()
  NERDTreeFocus
  normal R
  exec l:curwinnr . "wincmd w"
endfunction

command! -complete=dir -nargs=1 GMoveFile call g:GMoveFile(<f-args>)
