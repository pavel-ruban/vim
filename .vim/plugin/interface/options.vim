" Interface related logic.
if exists("g:InterfaceOptionsInit")
  if (g:InterfaceOptionsInit == 1)
    finish
  endif
endif

let g:InterfaceOptionsInit = 1

" Get system plugin directory path.
let pluginPath = expand('<sfile>:p:~:h')

" Escaped sequences mappings.
set <F13>=[25~
set <F15>=[27~
set <F17>=[29~
set <F18>=[30~

syntax on
colorscheme lucius
set t_Co=256
set nobackup
set ignorecase
set hlsearch
set incsearch
set complete-=i
set expandtab
"set tags=/http/skimium/tags
set shiftwidth=4
set tabstop=4
set ai
set ts=4
set number
set autochdir
set background=dark
set mouse=a
let Tlist_Exit_OnlyWindow = 1
let Tlist_Compact_Format  = 0
let s:tlist_def_php_settings = 'php;c:class;d:constant;v:variable;f:function'
let Tlist_Use_SingleClick = 0
let Tlist_Use_Right_Window = 1
let Tlist_Sort_Type = "name"
let Tlist_WinWidth = 60
let Tlist_Show_One_File = 1
let Tlist_GainFocus_On_ToggleOpen = 0
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Enable_Fold_Column = 0
let g:proj_flags = "imstF"
set guioptions+=e " включаем none-gui табы
set guioptions-=r " отключаем правый scrollbar
set guioptions-=R " отключаем правый scrollbar при вертикальном разделении окна
set guioptions-=b " отключаем нижний scrollbar
set guioptions-=l " отключаем левый scrollbar
set guioptions-=L " отключаем левый scrollbar при вертикальном разделении окна
"set guioptions-=T " отключаем панель инструментов
"set guioptions-=m " отключаем меню
set guioptions-=a
set guioptions-=A
set guioptions-=aA
set guifont=Ubuntu\ Mono\ 16
set nolinebreak
let g:Tlist_WinWidth=55
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4 "4
let g:netrw_win_width = 40

let g:checksyntax = {
\ "auto" : 0
\}
let g:vdebug_options = {
\ "port" : 9000,
\ "server" : 'terminal',
\ "timeout" : 20,
\ "on_close" : 'detach',
\ "break_on_open" : 1,
\ "ide_key" : '',
\ "path_maps" : {},
\ "debug_window_level" : 0,
\ "debug_file_level" : 0,
\ "debug_file" : "",
\ "watch_window_style" : 'compact',
\ "marker_default" : '⬦',
\ "marker_closed_tree" : '▸',
\ "marker_open_tree" : '▾',
\ "continuous_mode" : 1,
\}
let g:grep_path_custom="/http/skimium/sites/all"
filetype plugin on
set clipboard=unnamedplus,unnamed,autoselect
let g:zcaprg = '/usr/bin/zca'
let g:netrw_retmap = 0
let g:netrw_mousemaps = 0
set colorcolumn=+1
set colorcolumn=121
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
set hi=10000
set undofile
set undodir=~/.vim/undodir

hi SpellBad guisp=#ffff00 guifg=NONE

let g:Grep_Shell_Quote_Char = '"'" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo=/100,h,<10000,@1000,'50,\"1000,:600,%,n~/.viminfo
setlocal spell spelllang=en_us

" Set a nicer foldtext function
set foldtext=CustomFoldText()

" viminfo

