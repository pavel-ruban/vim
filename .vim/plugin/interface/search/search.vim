if exists("g:InterfaceSearchInit")
  if (g:InterfaceSearchInit == 1)
    finish
  endif
endif

let g:InterfaceSearchInit = 1

" Search file by filename pattern in netrw or opened file current dir.
fun! SearchFile(global)
    if (a:global > 0 && exists('g:interfacePrjPath'))
        let s:path = g:interfacePrjPath
    elseif (exists('b:netrw_curdir'))
        let s:path = b:netrw_curdir
    else
        let s:path = getcwd()
    endif

    let s:pattern = input('enter file pattern: ', '')
    exe 'silent botright 10 split found-files:'
    exe 'silent r! find ' . s:path . ' -type f -name "*' . s:pattern . '*"'
    " Open path in previous window.
    map <buffer> <silent> <CR> :call FileOpenPath()<CR>
    map <buffer> <silent> <2-LeftMouse> :call FileOpenPath()<CR>
endfun

" Search file content by pattern in netrw or opened file current dir.
fun! SearchPattern(global)
    if (a:global > 0 && exists('g:interfacePrjPath'))
        let s:path = g:interfacePrjPath
    elseif (exists('b:netrw_curdir'))
        let s:path = b:netrw_curdir
    else
        let s:path = getcwd()
    endif

  let s:temp_path = g:grep_path_custom
  let g:grep_path_custom= s:path

  exe ':Rgrep'
  let g:grep_path_custom = s:temp_path
endfun

" Open current line content as file path in previous window.
fun! FileOpenPath()
  let filepath = getline(line('.'))
  exe GetEditWindowNumber() . 'wincmd w'
  exe 'e! ' . filepath
endfun
