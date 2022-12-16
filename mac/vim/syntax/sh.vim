setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab

command! -nargs=1 Margin exec "match Error /.\\%>" . (<args> + 1) . "v/"
Margin 110

syntax keyword shTodo TODO FIXME XXX NOTE REVIEW contained 
