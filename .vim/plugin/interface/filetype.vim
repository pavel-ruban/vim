" This file contents logic to determine filetype if it hasn't extenstion or if type wasn't determined.

if exists("g:InterfaceFileTypeInit")
  if (g:InterfaceFileTypeInit == 1)
    finish
  endif
endif

func AutoDetectFileType()
  if !len(&ft)
    " For now set default file type for undefined file to SQL type.
    let &ft = 'sql'
  endif
endf
