function CleverEnter()
  let pos = getpos(".")
  let lineContent = getline(pos[1])
  let nextChar = strpart(lineContent, (pos[2] - 1), 1)
  echo nextChar
  if (nextChar == ')' || nextChar == ']'
  \ || nextChar == '}')
   execute ':exe "normal! i\<cr>.\<cr>\<UP>\<DEL>\<SPACE>\<SPACE>\<space>"'
  else
    echo nextChar
    if (nextChar == '')
      execute ':exe "normal! i\<right>\<cr>\<right>"'
    else
      execute ':exe "normal! i\<cr>\<right>"'
    endif
  endif
endfunction
