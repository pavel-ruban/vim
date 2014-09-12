" Interface related logic.
if exists("g:InterfaceInit")
  if (g:InterfaceInit == 1)
    finish
  endif
endif

let g:InterfaceInit = 1

" Get system plugin directory path.
let g:pluginPath = expand('<sfile>:p:~:h')


" Include separate logic.
exe "so " . g:pluginPath . '/search/search.vim'
exe "so " . g:pluginPath . '/autocomplete/autocomplete.vim'
exe "so " . g:pluginPath . '/windows/windows.vim'
exe "so " . g:pluginPath . '/templates/templates.vim'
exe "so " . g:pluginPath . '/binds/binds.vim'
exe "so " . g:pluginPath . '/hooks.vim'
exe "so " . g:pluginPath . '/commands.vim'
exe "so " . g:pluginPath . '/options.vim'

"exe "so " . g:pluginPath . '/filetype_detect.vim'
