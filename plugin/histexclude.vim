" =============================================================================
" Filename: plugin/histexclude.vim
" Author: itchyny
" License: MIT License
" Last Change: 2016/05/04 13:57:52.
" =============================================================================

if exists('g:loaded_histexclude')
  finish
endif
let g:loaded_histexclude = 1

let s:save_cpo = &cpo
set cpo&vim

let g:histexclude = get(g:, 'histexclude', {})

if get(g:, 'histexclude_mappings', 1)
  for s:k in filter([':', '/', '?', '=', '@', '>'], 'has_key(g:histexclude, v:val)')
    execute 'noremap <expr>' s:k 'histexclude#update("' . s:k . '")'
    execute 'noremap <expr> q' . s:k '"q" . histexclude#update("' . s:k . '")'
  endfor
  unlet! s:k
endif

let &cpo = s:save_cpo
unlet s:save_cpo
