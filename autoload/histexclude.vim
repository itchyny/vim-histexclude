" =============================================================================
" Filename: autoload/histexclude.vim
" Author: itchyny
" License: MIT License
" Last Change: 2016/05/04 14:00:36.
" =============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! histexclude#update(history) abort
  if has_key(g:histexclude, a:history) && histget(a:history, -1) =~# get(g:histexclude, a:history, '')
    call histdel(a:history, -1)
  endif
  return a:history
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
