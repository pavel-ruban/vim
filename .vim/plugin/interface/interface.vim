" Interface related logic.
if exists("g:InterfaceInit")
  if (g:InterfaceInit == 1)
    finish
  endif
endif

let g:InterfaceInit = 1

" Get system plugin directory path.
let pluginPath = expand('<sfile>:p:~:h')


" Include separate logic.
exe "so " . pluginPath . '/search/search.vim'
exe "so " . pluginPath . '/autocomplete/autocomplete.vim'
exe "so " . pluginPath . '/windows/windows.vim'
exe "so " . pluginPath . '/templates/templates.vim'
exe "so " . pluginPath . '/binds/binds.vim'
exe "so " . pluginPath . '/hooks.vim'
exe "so " . pluginPath . '/commands.vim'
exe "so " . pluginPath . '/options.vim'
