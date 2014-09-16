"TlistToggle
"Project
"loadview
set background=dark

let g:vdebug_options["marker_default"]='•'
let g:vdebug_options["marker_closed_tree"]='+'
let g:vdebug_options["marker_open_tree"]='-'
let g:vdebug_options["break_on_open"]=0

"exec 'SyntasticToggleMode'
"colorscheme tir_black
"colorscheme grb256

if has('gui_running')
    colorscheme dark
else
    colorscheme customhick
endif

setlocal spell spelllang=en_us
hi SpellBad cterm=underline  ctermfg=yellow ctermbg=NONE guisp=#ffff00 guifg=NONE
