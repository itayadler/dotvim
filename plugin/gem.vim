function! g:GemList(ArgLoad, CmdLine, CursorPos)
  return system("cat Gemfile | grep \"^\s*gem\" | sed -e \"s/\s*gem '\\([^']\\+\\)'.*/\\1/\"")
endfunction

command! -complete=custom,g:GemList -nargs=1 GemOpen :execute "e `bundle show " . <f-args> . "`"
