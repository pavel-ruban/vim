" Interface related logic.
if exists("g:InterfaceCommandsInit")
  if (g:InterfaceCommandsInit == 1)
    finish
  endif
endif

let g:InterfaceCommandsInit = 1

com! -complete=file -nargs=* Edit silent! exec "!vim --servername " . v:servername . " --remote-silent <args>"
