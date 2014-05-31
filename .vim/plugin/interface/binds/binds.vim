if exists("g:InterfaceBindsInit")
  if (g:InterfaceBindsInit == 1)
    finish
  endif
endif

let g:InterfaceBindsInit = 1

let g:Tmux = system('echo $TMUX')
let g:Tmux = substitute(g:Tmux,"\\s\\|\\n\\|\\r","","g")

" Consider tmux keybinds handling.
if g:Tmux != ''
  nnoremap <C-S-Insert> :OScan paste <CR>
  nnoremap <M-C-End> :FufChangeList <CR>
  nmap <M-C-PageDown> :FufTag<cr>
  nmap <S-F9> <Plug>ToggleProject
  nnoremap <silent> [19;2~ :TlistToggle <CR>
  nmap <silent>  :OScan changes<CR>
  nnoremap <silent> [Z :call MRU_toggle()<CR>
else
  nnoremap <C-S-Insert> :OScan paste <CR>
  nnoremap <M-C-End> :FufChangeList <CR>
  nmap <M-C-PageDown> :FufTag<cr>
  nmap <S-F9> <Plug>ToggleProject
  nnoremap <silent> <S-F8> :TlistToggle <CR>
  nmap <silent> <M-TAB> :OScan changes<CR>
  nnoremap <silent> <S-TAB> :call MRU_toggle()<CR>
endif

"nmap <silent> <S-Q> :tabn 1 <CR> 
"nmap <silent> <S-W> :tabn 2 <CR> 
"nmap <silent> <S-E> :tabn 3 <CR> 
map <S-F7> :w! <CR> :!g++ select.cpp && ./a.out<CR>
"Mappings.
imap <silent> [ <C-R>=ArrayInput()<CR>
imap <silent> ( <C-R>=ColumnInput()<CR>
imap <silent> { <C-R>=ObjectInput()<CR>
imap <silent> ' <C-R>=QouteInput()<CR>
imap <silent> " <C-R>=DQouteInput()<CR>
imap <silent> <CR> <C-R>=CleverEnter()<CR>
nmap <silent> <leader>s :call SearchPattern()<CR>
nmap <silent> <leader>f :call SearchFile()<CR>
imap  <BS> <C-R>=CleverBackSpace()<CR>
nmap <leader>a :call AutoNetrwLocate()<cr>
nmap 8t @=Php_foreach()<CR>
nmap 8p @=Php_tag()<CR>
nmap 8i @=Php_html_if()<CR>
nmap 8I @=Php_if()<CR>
nmap 8c @=Php_comment()<CR>
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
nmap cp :let @" = expand("%")<CR>
nnoremap <S-F4> :%s/\s\+$//<CR>
nnoremap <S-F3> :!tail -n 30 /var/log/httpd/error.log <CR>
