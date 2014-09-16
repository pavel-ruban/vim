if exists("g:InterfaceBindsInit")
    finish
endif

let g:InterfaceBindsInit = 1

if has('gui_running')
    nnoremap <C-S-Insert> :OScan paste <CR>
    nnoremap <silent> <S-F8> :TlistToggle <CR>
    nnoremap <silent> <S-TAB> :call MRU_toggle()<CR>

    " Tools windows.
    nnoremap <silent> <F15> :FufTag<cr>
    nnoremap <silent> <C-TAB> :FufBuffer<CR>
    nnoremap <silent> <C-N> :FufBufferTag<CR>
    "nnoremap <silent> <C-S-N> :FufCoverageFile<CR>
    nnoremap <silent> <C-S-N> :echo 'hey'<CR>
    nnoremap <silent> <F19> :FufFile<CR>
    nnoremap <silent> <S-F11> :OScan marks<CR>
    nnoremap <silent> <F20> :OScan changes<CR>

    " Search.
    nmap <silent> <F18> :call SearchPattern(1)<CR>
    nmap <silent> <C-F> :call SearchPattern(0)<CR>
else
    let g:Tmux = system('echo $TMUX')
    let g:Tmux = substitute(g:Tmux,"\\s\\|\\n\\|\\r","","g")

    " Consider tmux keybinds handling.
    if g:Tmux != ''
      nnoremap <C-S-Insert> :OScan paste <CR>
      nnoremap <silent> [19;2~ :TlistToggle <CR>
      nnoremap <silent> [Z :call MRU_toggle()<CR>
    else
      nnoremap <C-S-Insert> :OScan paste <CR>
      nnoremap <silent> <S-F8> :TlistToggle <CR>
      nnoremap <silent> <S-TAB> :call MRU_toggle()<CR>
    endif

    " Tools windows.
    nnoremap <silent> <F15> :FufTag<cr>
    nnoremap <silent> <F13> :FufBuffer<CR>
    nnoremap <silent> <C-n> :FufBufferTag<CR>
    nnoremap <silent> <F17> :FufCoverageFile<CR>
    nnoremap <silent> <F19> :FufFile<CR>
    nnoremap <silent> <S-F11> :OScan marks<CR>
    nnoremap <silent> <F20> :OScan changes<CR>

    " Search.
    nmap <silent> <F18> :call SearchPattern(1)<CR>
    nmap <silent> <C-F> :call SearchPattern(0)<CR>

endif

" Compile
map <S-F7> :w \| silent! make \| e<CR>
map <C-S-F7> :w \| silent! make \| e \| exe "!" . g:InterfacePrjPath . "silk"<CR>

" Templates
nmap 8t @=Php_foreach()<CR>
nmap 8p @=Php_tag()<CR>
nmap 8i @=Php_html_if()<CR>
nmap 8I @=Php_if()<CR>
nmap 8c @=Php_comment()<CR>

" Tools
nmap <leader>a :call AutoNetrwLocate()<cr>
nmap cp :let @" = expand("%")<CR>
nnoremap <S-F4> :%s/\s\+$//<CR>
nnoremap <S-F3> :!tail -n 30 /var/log/httpd/error.log <CR>
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
