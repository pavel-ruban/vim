if exists("g:InterfaceHooksInit")
  if (g:InterfaceHooksInit == 1)
    finish
  endif
endif

let g:InterfaceHooksInit = 1

au! BufReadPost quickfix source ~/.vim/ftplugin/qf_fold.vim
au BufWritePost,FileWritePost * exe "silent %s/\\s\\+$//e | %s/\\t/  /ge"

"au BufLeave * let b:winview = winsaveview()
"au BufRead * if(exists('b:winview')) | call winrestview(b:winview) | exe "normal! zz" | endif
au vimEnter * let w:tag = 'active'
au vimEnter * call AutoDetectFileType()
au BufWinEnter * call InterfaceSetDefaultEnvironment()

au WinEnter * py win.ensureActiveIsExists()

au BufReadPost quickfix nnoremap <buffer> <CR> <CR><C-W>p
"autocmd QuickFixCmdPost * :cwindow
" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"augroup resCur
"  autocmd!
"  autocmd BufWinEnter * call ResCur()
"augroup END

"au BufWinLeave *.c, *.cpp, *.h, *.hpp, *.php, *.js, *.css, *.module, *.html, *.htm, *.asm, SConstruct mkview
"au BufWinEnter *.c, *.cpp, *.h, *.hpp, *.php, *.js, *.css, *.module, *.html, *.htm, *.asm, SConstruct silent loadview
"
au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview

"au BufNew * call InterfaceNetrwInit()
