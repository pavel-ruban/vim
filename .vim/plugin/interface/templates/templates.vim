" All window related logic defined here.

if exists("g:InterfaceTempatesInit")
  if (g:InterfaceTempatesInit == 1)
    finish
  endif
endif

let g:InterfaceTempatesInit = 1

function! Php_if()
  return "yiWoif \<c-r>=ColumnInput()\<cr>!empty\<c-r>=ColumnInput()\<cr>pA) \<c-r>=ObjectInput()\<cr>\<c-r>=CleverEnter()\<cr>"
endfunction

function! Php_comment()
  return "i/** * Preprocess variables/kb.*/kukr"
endfunction

function! Php_html_if()
  return "i<phpkbkbkb?okbphp if \<c-r>=ColumnInput()\<cr>kr: ?><?php enfikbkbdif; ?>klklklklklklkukr"
endfunction

function! Php_tag()
  return "i<?php ?>klkl"
endfunction

function! Php_foreach()
  return "oforeach \<c-r>=ColumnInput()\<cr>$ as $kr \<c-r>=ObjectInput()\<cr>\<c-r>=CleverEnter()\<cr>kukrkrkrkrkrkrkrkr"
endfunction
