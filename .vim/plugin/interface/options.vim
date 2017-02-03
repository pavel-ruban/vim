" Interface related logic.
if exists("g:InterfaceOptionsInit")
    finish
endif

let g:InterfaceOptionsInit = 1

" Get system plugin directory path.
let pluginPath = expand('<sfile>:p:~:h')

syntax on

set ignorecase
set hlsearch
set incsearch

set t_Co=256
set nobackup
set complete-=i

set noexpandtab
set shiftwidth=0
set tabstop=8
set ai

set background=dark
set number
set autochdir
set mouse=a

let g:autotagmaxTagsFileSize = 1024 * 1024 * 1024 " 1 Gb
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
let g:Tlist_WinWidth=55

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4 "4
let g:netrw_win_width = 40

let g:zcaprg = '/usr/bin/zca'
let g:netrw_retmap = 0
let g:netrw_mousemaps = 0

let g:Grep_Shell_Quote_Char = '"'" Tell vim to remember certain things when we exit

let g:grep_path_custom=""
let g:checksyntax = {
\ "auto" : 0
\}

if has("gui_running")
    set guioptions-=e " включаем none-gui табы
    set guioptions-=r " отключаем правый scrollbar
    set guioptions-=R " отключаем правый scrollbar при вертикальном разделении окна
    set guioptions-=b " отключаем нижний scrollbar
    set guioptions-=l " отключаем левый scrollbar
    set guioptions-=L " отключаем левый scrollbar при вертикальном разделении окна
    set guioptions-=T " отключаем панель инструментов
    set guioptions-=m " отключаем меню
    set guioptions-=a
    set guioptions-=A
    set guioptions-=aA
    set guifont=Ubuntu\ Mono\ 16
else
    " Escaped sequences mappings.
    set <F13>=[25~
    set <F15>=[27~
    set <F17>=[29~
    set <F18>=[30~
    set <F19>=[31~
    set <F20>=[32~
endif

set nolinebreak

filetype plugin on

set clipboard=unnamedplus,unnamed,autoselect

set colorcolumn=+1
set colorcolumn=121

set hi=10000

set undofile
set undodir=~/.vim/undodir

hi ColorColumn ctermbg=none guibg=lightgrey
hi SpellBad guisp=#ffff00 guifg=NONE

"\ \"marker_default\" : '<U+2B26>',
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
\ "marker_default" : '+',
\ "marker_closed_tree" : '▸',
\ "marker_open_tree" : '▾',
\ "continuous_mode" : 1,
\}

"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo=/100,h,<10000,@1000,'50,\"1000,:600,%,n~/.viminfo
setlocal spell spelllang=en_us,ru_ru
set spelllang=en,ru

" Set a nicer foldtext function
set foldtext=CustomFoldText()

"exe \"set makeprg=scons\\ -C\\ " . g:interfacePrjPath
