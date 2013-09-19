" All window related logic defined here.

if exists("g:InterfaceAutocompleteInit")
  if (g:InterfaceAutocompleteInit == 1)
    finish
  endif
endif

let g:InterfaceAutocompleteInit = 1

" Enter \r & spaces by need.
function! CleverBackSpace()
  imap  <BS> <BS>
  let a:pos = getpos(".")
  let a:lineContent = getline(a:pos[1])
  let a:currentChar = strpart(a:lineContent, (a:pos[2] - 1), 1)
  let a:prevChar = strpart(a:lineContent, (a:pos[2] - 2), 1)
  echo a:currentChar
  echo a:prevChar
  if (a:prevChar == '(' && a:currentChar == ')')
    imap  <BS> <C-R>=CleverBackSpace()<CR>
    return "\<DEL>\<BS>"
  elseif (a:prevChar == "'" && a:currentChar == "'")
    imap  <BS> <C-R>=CleverBackSpace()<CR>
    return "\<DEL>\<BS>"
  elseif (a:prevChar == '"' && a:currentChar == '"')
    imap  <BS> <C-R>=CleverBackSpace()<CR>
    return "\<DEL>\<BS>"
  elseif (a:prevChar == '{' && a:currentChar == '}')
    imap  <BS> <C-R>=CleverBackSpace()<CR>
    return "\<DEL>\<BS>"
  elseif (a:prevChar == '[' && a:currentChar == ']')
    imap  <BS> <C-R>=CleverBackSpace()<CR>
    return "\<DEL>\<BS>"
  else
    imap  <BS> <C-R>=CleverBackSpace()<CR>
    return "\<BS>"
  endif
endfunction

" Enter \r & spaces by need.
function! CleverEnter()
  if exists('g:completionaActivated') && g:completionaActivated == 1
    let g:completionaActivated = 0
    return "\<CR>"
  endif
  imap <silent> <CR> <CR>
  let a:pos = getpos(".")
  let a:lineContent = getline(a:pos[1])
  let a:currentChar = strpart(a:lineContent, (a:pos[2] - 1), 1)
  let a:nextChar = strpart(a:lineContent, (a:pos[2]), 1)
  if (a:currentChar == ')' || a:currentChar == ']'
  \ || a:currentChar == '}')
    imap <silent> <CR> <C-R>=CleverEnter()<CR>
    return "\<cr>.\<cr>\<UP>\<DEL>\<SPACE>\<SPACE>"
  else
    if (a:currentChar == '')
      imap <silent> <CR> <C-R>=CleverEnter()<CR>
      return "\<right>\<cr>\<right>"
    else
      imap <silent> <CR> <C-R>=CleverEnter()<CR>
      return "\<cr>\<right>"
    endif
  endif
endfunction

" Provides array insert function
function! ArrayInput()
  imap <silent> [ [

  " Get next, current & newline chars.
  let a:pos = getpos(".")
  let a:lineContent = getline(a:pos[1])
  let a:currentChar = strpart(a:lineContent, (a:pos[2] - 1), 1)
  let a:nextChar = strpart(a:lineContent, (a:pos[2]), 1)
  let a:isSpace =  a:currentChar == " "
  let a:nextCharNL =  a:nextChar == ""

  " Insert characters.
  if (and(strlen(a:currentChar) > 0, !a:isSpace))
    if (and(a:currentChar != '[', a:currentChar != ']'))
      imap <silent> [ <C-R>=ArrayInput()<CR>
      return "["
    else
      imap <silent> [ <C-R>=ArrayInput()<CR>
      return "["
    endif
  elseif (or(a:currentChar == ' ', a:nextCharNL))
    imap <silent> [ <C-R>=ArrayInput()<CR>
    return "[]\<LEFT>"
  endif

endfunction

function! ColumnInput()
  imap <silent> ( (

  " Get next, current & newline chars.
  let a:pos = getpos(".")
  let a:lineContent = getline(a:pos[1])
  let a:currentChar = strpart(a:lineContent, (a:pos[2] - 1), 1)
  let a:nextChar = strpart(a:lineContent, (a:pos[2]), 1)
  let a:isSpace =  a:currentChar == " "
  let a:nextCharNL =  a:nextChar == ""

  " Insert characters.
  if (and(strlen(a:currentChar) > 0, !a:isSpace))
    if (and(a:currentChar != '(', a:currentChar != ')'))
      imap <silent> ( <C-R>=ColumnInput()<CR>
      return "("
    else
      imap <silent> ( <C-R>=ColumnInput()<CR>
      return "("
    endif
  elseif (or(a:currentChar == ' ', a:nextCharNL))
    imap <silent> ( <C-R>=ColumnInput()<CR>
    return "()\<LEFT>"
  endif

endfunction

function! ObjectInput()
  imap <silent> { {

  " Get next, current & newline chars.
  let a:pos = getpos(".")
  let a:lineContent = getline(a:pos[1])
  let a:currentChar = strpart(a:lineContent, (a:pos[2] - 1), 1)
  let a:nextChar = strpart(a:lineContent, (a:pos[2]), 1)
  let a:isSpace =  a:currentChar == " "
  let a:nextCharNL =  a:nextChar == ""

  " Insert characters.
  if (and(strlen(a:currentChar) > 0, !a:isSpace))
    if (and(a:currentChar != '{', a:currentChar != '}'))
      imap <silent> { <C-R>=ObjectInput()<CR>
      return "{"
    else
      imap <silent> { <C-R>=ObjectInput()<CR>
      return "{"
    endif
  elseif (or(a:currentChar == ' ', a:nextCharNL))
    imap <silent> { <C-R>=ObjectInput()<CR>
    return "{}\<LEFT>"
  endif

endfunction

function! QouteInput()
  imap <silent> ' '

  " Get next, current & newline chars.
  let a:pos = getpos(".")
  let a:lineContent = getline(a:pos[1])
  let a:currentChar = strpart(a:lineContent, (a:pos[2] - 1), 1)
  let a:nextChar = strpart(a:lineContent, (a:pos[2]), 1)
  let a:isSpace =  a:currentChar == " "
  let a:nextCharNL =  a:nextChar == ""

  " Insert characters.
  if (and(strlen(a:currentChar) > 0, !a:isSpace))
    if (a:currentChar == "]" || a:currentChar == ")" || a:currentChar == "}")
      imap <silent> ' <C-R>=QouteInput()<CR>
      return "''\<LEFT>"
    elseif (a:currentChar != "'")
      imap <silent> ' <C-R>=QouteInput()<CR>
      return "'"
    else
      imap <silent> ' <C-R>=QouteInput()<CR>
      return "'"
    endif
  elseif (or(a:currentChar == ' ', a:nextCharNL))
    imap <silent> ' <C-R>=QouteInput()<CR>
    return "''\<LEFT>"
  endif

endfunction

function! DQouteInput()
  imap <silent> " "

  " Get next, current & newline chars.
  let a:pos = getpos(".")
  let a:lineContent = getline(a:pos[1])
  let a:currentChar = strpart(a:lineContent, (a:pos[2] - 1), 1)
  let a:nextChar = strpart(a:lineContent, (a:pos[2]), 1)
  "let curCharNL =  currentChar == ""
  let a:isSpace =  a:currentChar == " "
  let a:nextCharNL =  a:nextChar == ""

  " Insert characters.
  if (and(strlen(a:currentChar) > 0, !a:isSpace))
    if (a:currentChar == "]" || a:currentChar == ")" || a:currentChar == "}")
      imap <silent> ' <C-R>=QouteInput()<CR>
      return "\"\"\<LEFT>"
    elseif (a:currentChar != "\"")
      imap <silent> " <C-R>=DQouteInput()<CR>
      return "\""
    else
      imap <silent> " <C-R>=DQouteInput()<CR>
      return "\""
    endif
  elseif (or(a:currentChar == " ", a:nextCharNL))
    imap <silent> " <C-R>=DQouteInput()<CR>
    return "\"\"\<LEFT>"
  endif

endfunction
