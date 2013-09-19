" All window related logic defined here.

if exists("g:InterfaceWindowsInit")
  if (g:InterfaceWindowsInit == 1)
    finish
  endif
endif

let g:InterfaceWindowsInit = 1

" Toggle MRU dialog window.
function! MRU_toggle()
  if !exists("w:MRU_opened")
    execute "MRU"
    let w:MRU_opened = 1
  else
    execute "q"
  endif
endfunction

" Update filebrowser location.
function! AutoNetrwLocate()
 let path = getcwd()
 let netrwWinNum = bufwinnr('NetrwTreeListing')
 let filename = expand('%p')
 let curbufnum = bufnr('%')
 let curwinnum = bufwinnr(curbufnum)

  if (and(netrwWinNum != -1, netrwWinNum != curwinnum))
    exe netrwWinNum . 'wincmd w'
    exe "e " . path
    exe 'call search("' . filename . '")'
    exe "normal! zz"
    exe curwinnum . 'wincmd w'
  endif
endfunction

" Autocmd function to update filebrowser position.
fun! InterfaceNetrwInit()
  let curbufnum = bufnr('%')
  let curwinnum = bufwinnr(curbufnum)
  let netrwWinNum = bufwinnr('NetrwTreeListing')
  if (netrwWinNum != curwinnum)
    call AutoNetrwLocate()
  endif
endfun

" Get valid window number to open content within.
fun! GetEditWindowNumber()
  let l:winNums = winnr('$')
  let l:i = 1

  " Check is there already initialized window & if it's correct use it.
  if exists('g:activeWinNum') && WindowNumValidate(g:activeWinNum)
    return g:activeWinNum 
  endif

  " Reset window variable as window could change it's order.
  let g:activeWinNum = -1

  " Foreach all windows & catch first not netrw or taglist marked.
  while l:i <= winNums
    if WindowNumValidate(l:i)
      let g:activeWinNum = l:i
      return g:activeWinNum
    endif

    let l:i += 1
  endwhile

  return -1
endfun

" Check is window can be used to edit content (not Netrw && Taglist).
fun WindowNumValidate(winnr)
  if !exists('g:Taglist_title') || g:Taglist_title == ''
    let g:Taglist_title = '__Tag_List__'
  endif

  let l:bufnr = winbufnr(a:winnr)
  let l:bufname = bufname(l:bufnr)
  if l:bufname != ''
    if match(l:bufname, 'Netrw') == -1
    \ && match(l:bufname, g:Taglist_title) == -1
    \ && !exists('b:serviceWindow')
      return 1
    endif
  endif

  return 0
endfun
