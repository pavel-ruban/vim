if exists("g:InterfaceHooksInit")
  if (g:InterfaceHooksInit == 1)
    finish
  endif
endif

let g:InterfaceHooksInit = 1

au! BufReadPost quickfix source ~/.vim/ftplugin/qf_fold.vim
"au BufWritePost,FileWritePost * exe "%s/\\s\\+$//e | %s/\\t/  /ge"
au BufLeave * let b:winview = winsaveview()
au BufRead * if(exists('b:winview')) | call winrestview(b:winview) | exe "normal! zz" | endif
au vimEnter * let w:tag = 'active'
au vimEnter * call AutoDetectFileType()
au BufWinEnter * call InterfaceSetDefaultEnvironment()
au BufReadPost quickfix nnoremap <buffer> <CR> <CR><C-W>p
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

"au BufNew * call InterfaceNetrwInit()
