if exists("g:InterfaceBindsInit")
  if (g:InterfaceBindsInit == 1)
    finish
  endif
endif

let g:InterfaceBindsInit = 1

"Mappings.
nnoremap <silent> <S-TAB> :call MRU_toggle()<CR>
imap <silent> [ <C-R>=ArrayInput()<CR>
imap <silent> ( <C-R>=ColumnInput()<CR>
imap <silent> { <C-R>=ObjectInput()<CR>
imap <silent> ' <C-R>=QouteInput()<CR>
imap <silent> " <C-R>=DQouteInput()<CR>
imap <silent> <CR> <C-R>=CleverEnter()<CR>
nmap <silent> <leader>s :call SearchPattern()<CR>
nmap <silent> <leader>f :call SearchFile()<CR>
imap  <BS> <C-R>=CleverBackSpace()<CR>
nmap <silent> <M-TAB> :OScan changes<CR>
nmap <leader>a :call AutoNetrwLocate()<cr>
nmap 8t @=Php_foreach()<CR>
nmap 8p @=Php_tag()<CR>
nmap 8i @=Php_html_if()<CR>
nmap 8I @=Php_if()<CR>
nmap 8c @=Php_comment()<CR>
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
nmap cp :let @" = expand("%")<CR>
nmap <S-F9> <Plug>ToggleProject
nnoremap <silent> <S-F8> :TlistToggle <CR>
nnoremap <S-F4> :%s/\s\+$//<CR>
nnoremap <S-F3> :!tail -n 30 /var/log/httpd/error.log <CR>
nnoremap <C-S-Insert> :OScan paste <CR>
nnoremap <M-C-End> :FufChangeList <CR>
nmap <M-C-PageDown> :FufTag<cr>
