" Vim syntax file
" Language:     google-ctemplate
" Maintainer:   Patrick Lacasse <patlac@borabora.crchul.ulaval.ca>
" Last Change:  2006
"
" For information about google-ctemplate see 
"   http://goog-ctemplate.sourceforge.net/
"
" This vim syntax file works on vim 5.6, 5.7, 5.8 and 6.x.
" It implements Bram Moolenaar's April 25, 2001 recommendations to make
" the syntax file maximally portable across different versions of vim.

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:tpl_current_syntax")
  finish
endif

let b:tpl_current_syntax = "tpl"

syntax match tplMarkerError "{{}\?\([^}]\+}\?\)*}}"
syntax match tplSectionMarker "{{[#/][A-Za-z_]\+}}"
syntax match tplInclude "{{>[A-Za-z_]\+}}"
syntax match tplComment "{{![A-Za-z_]\+}}"
syntax match tplVariableMarker "{{[_A-Za-z]\+}}"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_tpl_syn_inits")
  if version < 508
    let did_tpl_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink tplSectionMarker   Repeat
  HiLink tplInclude         Include
  HiLink tplComment         Comment
  HiLink tplVariableMarker  String
  HiLink tplMarkerError     Error

  delcommand HiLink
endif
