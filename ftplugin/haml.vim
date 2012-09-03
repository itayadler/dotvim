setlocal ts=2 sw=2 sts=2
retab 2
map <buffer> <Leader>c :!haml % > %:r.html
map <buffer> <Leader>r :!open -a "Google Chrome" %:r.html
