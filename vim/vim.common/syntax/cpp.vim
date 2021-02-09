" Vim indent file
" author: huas.su@gmail.com
"   branch from google.vim 1.1.0 2011-01-17
"   url: http://www.vim.org/scripts/script.php?script_id=2636
"

" if exists("b:did_indent")
"     finish
" endif
" let b:did_indent = 1


function! GoogleCppIndent()
    let l:cline_num = line('.')

    let l:orig_indent = cindent(l:cline_num)

    if l:orig_indent == 0 | return 0 | endif

    let l:pline_num = prevnonblank(l:cline_num - 1)
    let l:pline = getline(l:pline_num)
    let l:cline = getline(l:cline_num)

    let l:left_shift_pos = stridx(l:pline, "<<")
    if l:left_shift_pos >= 0
        " check if the paren level is 0 at the <<, as a heuristic that we're
        " writing to a stream and not doing a left-shift
		    if l:cline =~# '^\s*<<' 
            return l:left_shift_pos
        endif
    endif
    if l:pline =~# '^\s*template' | return l:pline_indent | endif

    " TODO: I don't know to correct it:
    " namespace test {
    " void
    " ....<-- invalid cindent pos
    "
    " void test() {
    " }
    "
    " void
    " <-- cindent pos
    if l:orig_indent != &shiftwidth | return l:orig_indent | endif

    let l:in_comment = 0
    let l:pline_num = prevnonblank(l:cline_num - 1)
    while l:pline_num > -1
        let l:pline = getline(l:pline_num)
        let l:pline_indent = indent(l:pline_num)

        if l:in_comment == 0 && l:pline =~ '^.\{-}\(/\*.\{-}\)\@<!\*/'
            let l:in_comment = 1
        elseif l:in_comment == 1
            if l:pline =~ '/\*\(.\{-}\*/\)\@!'
                let l:in_comment = 0
            endif
        elseif l:pline_indent == 0
            if l:pline !~# '\(#define\)\|\(^\s*//\)\|\(^\s*{\)'
                if l:pline =~# '^\s*namespace.*'
                    return 0
                else
                    return l:orig_indent
                endif
            elseif l:pline =~# '\\$'
                return l:orig_indent
            endif
        else
            return l:orig_indent
        endif

        let l:pline_num = prevnonblank(l:pline_num - 1)
    endwhile

    return l:orig_indent
endfunction

setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab
setlocal textwidth=0
setlocal wrap

setlocal cindent
setlocal cinoptions=h1,l1,g1,t0,i4,+4,(0,w1,W4

setlocal indentexpr=GoogleCppIndent()

command! -nargs=1 Margin exec "match Error /.\\%>" . (<args> + 1) . "v/"
Margin 110

syntax keyword cType int8 int16 int32 int64 int128 uint8 uint16 uint32 uint64 uint128 schar char32 static_assert constexpr decltype

let b:undo_indent = "setl sw< ts< sts< et< tw< wrap< cin< cino< inde<"

function! AutoSetTag()
    let l:tag_file = findfile("tags", ".;")
    if l:tag_file != ""
        exec "set tags=" . tag_file
    endif
endfunction
call AutoSetTag()

syntax keyword cTodo contained TODO FIXME XXX NOTE REVIEW DEPRECATED

command! -nargs=+ NewHiLink hi link <args>
NewHiLink ccSpaceError	Error
" trailing whitespace
syntax match ccSpaceError   display excludenl "\S\s\+$"ms=s+1
" tabs not allowed
syntax match ccSpaceError   display "\t"

