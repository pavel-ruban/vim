if exists("g:GuinterfaceBindsInit")
  if (g:GuinterfaceBindsInit == 1)
    finish
  endif
endif

let g:GuinterfaceBindsInit = 1

" Tools windows.
"nnoremap <silent> <C-S-M-N> :FufTag<cr>
"nnoremap <silent> <C-Tab> :FufBuffer<CR>
""nnoremap <silent> <C-m> :OScan changes<CR>
"nnoremap <silent> <S-C-m> :FufBufferTag<CR>
"
""nnoremap <silent> <C-S-N> :FufFile<CR>
"nnoremap <silent> <S-F11> :OScan marks<CR>
"nnoremap <silent> <S-F8> :TlistToggle <CR>
"
"" Search.
"nmap <silent> <C-S-F> :call SearchPattern(1)<CR>
"nmap <silent> <C-f> :call SearchPattern(0)<CR>
