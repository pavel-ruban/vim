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
    nnoremap <silent> <C-S-N> :FufCoverageFile<CR>
    nnoremap <silent> <F19> :FufFile<CR>
    nnoremap <silent> <S-F11> :OScan marks<CR>

    nnoremap <silent> <F20> :OScan changes<CR>
    nnoremap <silent> <F21> :echo 'it"s F21'<CR>
    nnoremap <silent> <F22> :echo 'it"s F22'<CR>
    nnoremap <silent> <F23> :echo 'it"s F23'<CR>
    nnoremap <silent> <F24> :echo 'it"s F24'<CR>
    nnoremap <silent> <F25> :echo 'it"s F25'<CR>
    nnoremap <silent> <F26> :echo 'it"s F26'<CR>
    nnoremap <silent> <F27> :echo 'it"s F27'<CR>
    nnoremap <silent> <F28> :echo 'it"s F28'<CR>

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
"map <S-F7> :w \| silent! make \| e<CR>
"map <S-F6> :w \| silent! exe "!scons debug=1 -C " . g:interfacePrjPath \| e<CR>
"map <C-S-F6> :w \| silent! exe "!scons debug=1 -C " . g:interfacePrjPath \| exe "!" . g:interfacePrjPath . "/silk" \| e<CR>
"map <C-S-F7> :w \| silent! make \| exe "!" . g:interfacePrjPath . "/silk" \| e<CR>

"map <S-F5> :w \| call BindMakePrj('profile') \| silent! make \| e<CR>
"map <C-S-F5> :w \| call BindMakePrj('profile') \| silent! make \| exe "!" . g:interfacePrjPath . "/silk" \| e<CR>
"
"map <S-F6> :w \| call BindMakePrj('debug') \| silent! make \| e<CR>
"map <C-S-F6> :w \| call BindMakePrj('debug') \| silent! make \| exe "!" . g:interfacePrjPath . "/silk" \| e<CR>
"
"map <S-F7> :w \| call BindMakePrj() \| silent! make \| e<CR>
"map <C-S-F7> :w \| call BindMakePrj() \| silent! make \| exe "!" . g:interfacePrjPath . "/silk" \| e<CR>

map <S-F5> :w \| call BindMakePrj('clean') \| make \| e<CR>
map <C-S-F5> :w \| call BindMakePrj('optmized') \| make \| e<CR>

map <S-F6> :w \| call BindMakePrj('debug') \| make \| e<CR>
map <C-S-F6> :w \| call BindMakePrj('gdb') \| make \| e<CR>

map <S-F7> :w \| call BindMakePrj('flash') \| make \| e<CR>
"map <C-S-F7> :w \| call BindMakePrj() \| silent! make \| exe "!" . g:interfacePrjPath . "/silk" \| e<CR>
"map <C-S-F8> :w \| silent! make \| e \| exe "!" . g:interfacePrjPath . "/silk"<CR>

nmap <C-DOWN> :GitGutterNextHunk<CR>
nmap <C-UP> :GitGutterPrevHunk<CR>


nnoremap <Leader>s :%s/<C-R><C-W>//g<Left><Left>

nnoremap <M-LEFT> :tabprevious<CR>
nnoremap <M-RIGHT> :tabnext<CR>

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
