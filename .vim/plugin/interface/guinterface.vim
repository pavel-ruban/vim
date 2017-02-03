" Interface related logic.
if exists("g:GuinterfaceInit")
  if (g:GuinterfaceInit == 1)
    finish
  endif
endif

let g:GuinterfaceInit = 1

exe "so " . g:pluginPath . '/binds/guibinds.vim'
