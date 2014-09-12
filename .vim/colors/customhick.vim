" File: hickop . vim
" Version: 1 . 0
" Author: hickop <hickop@gmail . com>
" Description: simple dark colorscheme for vim and gvim

hi clear

let &background = 'dark'

if exists("syntax_on")
 syntax reset
endif

let g:colors_name = "customhick"

"colors{{{
if has("gui_running")
 let s:v = " gui"
 let s:bla = "#262626"
 let s:whi = "#c6c6c6"
 let s:gr1 = "#6c6c6c"
 let s:gr2 = "#303030"
 let s:red = "#87ffff"
 let s:gre = "#87af87"
 let s:bro = "#efff64"
 let s:yel = "#d7af5f"
 let s:pur = "#efff64"
 let s:blu = "#5f87af"
 let s:cya = "#87afd7"
else
 let s:v = " cterm"
 let s:bla = "235"
 let s:whi = "15"
 let s:gr1 = "242"
 let s:gr2 = "236"
 let s:gre = "155"
 let s:bro = "229"
 let s:yel = "229"
 let s:pur = "110"
 let s:blu = "155"
 let s:lblue = "159"
 let s:new = "5"
 let s:brown = "144"
 let s:lyel = "229"
 let s:lpur = "183"
 let s:cya = "15"
 
 " New color vars.
 let s:red = "216"
 let s:cya = "87"
 let s:blue = "159"
 let s:dblue = "110"
 let s:green = "155"
 let s:yellow = "229"
 let s:grey = "242"
 let s:purple = "183"
endif
"}}}

"{{{
" C++ lang's keywords
exe "hi Normal" . s:v . 'fg = ' . s:new . s:v . 'bg = none'
exe "hi Comment" . s:v . 'fg = ' . s:new . s:v . 'bg = none'
exe "hi DoxygenComment" . s:v . 'fg = ' . s:new . s:v . 'bg = none'
exe "hi DoxygenKeyword" . s:v . 'fg = ' . s:new . s:v . 'bg = none'
exe "hi DoxygenLink" . s:v . 'fg = ' . s:new . s:v . 'bg = none'
exe "hi DoxygenTable" . s:v . 'fg = ' . s:new . s:v . 'bg = none'
exe "hi DoxygenTableLines" . s:v . 'fg = ' . s:new . s:v . 'bg = none'
exe "hi LintComment" . s:v . 'fg = ' . s:new . s:v . 'bg = none'
exe "hi Constant" . s:v . 'fg = ' . s:new . s:v . 'bg = none'
exe "hi String" . s:v . 'fg = ' . s:brown . s:v . 'bg = none'
exe "hi Character" . s:v . 'fg = ' . s:new . s:v . 'bg = none'
exe "hi PreProc" . s:v . 'fg = ' . s:new . s:v . 'bg = none'
exe "hi Include" . s:v . 'fg = ' . s:blu . s:v . 'bg = none'
exe "hi Macro" . s:v . 'fg = ' . s:lblue . s:v . 'bg = none'
exe "hi Define" . s:v . 'fg = ' . s:lblue . s:v . 'bg = none'
exe "hi PreCondit" . s:v . 'fg = ' . s:lblue . s:v . 'bg = none'
exe "hi Statement" . s:v . 'fg = ' . s:new . s:v . 'bg = none'
exe "hi Conditional" . s:v . 'fg = ' . s:lyel . s:v . 'bg = none'
exe "hi Repeat" . s:v . 'fg = ' . s:lyel . s:v . 'bg = none'
exe "hi Label" . s:v . 'fg = ' . s:lyel . s:v . 'bg = none'
exe "hi Exception" . s:v . 'fg = ' . s:new . s:v . 'bg = none'
exe "hi Operator" . s:v . 'fg = 147' . s:v . 'bg = none'
exe "hi Identifier" . s:v . 'fg = ' . s:new . s:v . 'bg = none'
exe "hi Function" . s:v . 'fg = ' . s:lyel . s:v . 'bg = none'
exe "hi Method" . s:v . 'fg = ' . s:lyel . s:v . 'bg = none'
exe "hi Class" . s:v . 'fg = ' . s:lblue . s:v . 'bg = none'
exe "hi CTagsClass" . s:v . 'fg = ' . s:lblue . s:v . 'bg = none'
exe "hi SpellBad" . s:v . 'fg = ' . s:lpur . s:v . 'bg = 0'
exe "hi SpellCap" . s:v . 'fg = ' . s:lblue . s:v . 'bg = 0'
exe "hi Normal" . s:v . 'fg = ' . s:whi

exe "hi NonText" . s:v . 'fg = ' . s:gr1 . s:v . ' = NONE'
exe "hi ErrorMsg" . s:v . 'bg = ' . s:red
exe "hi IncSearch" . s:v . 'fg = ' . s:bla . s:v . 'bg = ' . s:bro . s:v . ' = NONE'
exe "hi Search" . s:v . 'fg = ' . s:bla . s:v . 'bg = ' . s:bro
exe "hi MoreMsg" . s:v . 'fg = fg' . s:v . ' = NONE'
exe "hi LineNr" . s:v . 'fg = ' . s:gr1 . s:v . 'bg = none'
exe "hi LocalVariable" . s:v . 'fg = ' . s:blu . s:v . 'bg = none'
exe "hi CursorLineNr" . s:v . 'fg = fg' . s:v . 'bg = ' . s:gr2
exe "hi Question" . s:v . 'fg = fg' . s:v . ' = NONE'
exe "hi StatusLine" . s:v . 'fg = fg' . s:v . 'bg = none' . s:v . ' = NONE'
exe "hi StatusLineNC ctermfg = 242 ctermbg = none cterm = NONE"
exe "hi VertSplit" . s:v . 'fg = ' . s:gr1 . s:v . 'bg = none' . s:v . ' = NONE'
exe "hi Title" . s:v . 'fg = fg' . s:v . ' = NONE'
exe "hi Visual" . s:v . 'fg = ' . s:bla . s:v . 'bg = ' . s:bro
exe "hi WarningMsg" . s:v . 'fg = fg' . s:v . ' = NONE'
exe "hi WildMenu" . s:v . 'fg = ' . s:bla . s:v . 'bg = ' . s:bro
exe "hi Folded" . s:v . 'fg = ' . s:gr1 . s:v . 'bg = none'
exe "hi FoldColumn" . s:v . 'fg = ' . s:gr1 . s:v . 'bg = none'
exe "hi DiffAdd" . s:v . 'fg = ' . s:bla . s:v . 'bg = ' . s:gre
exe "hi DiffChange" . s:v . 'fg = ' . s:bla . s:v . 'bg = ' . s:blu
exe "hi DiffDelete" . s:v . 'fg = ' . s:red . s:v . 'bg = ' . s:red . s:v . ' = NONE'
exe "hi DiffText" . s:v . 'fg = ' . s:bla . s:v . 'bg = ' . s:cya . s:v . ' = NONE'
exe "hi SignColumn" . s:v . 'fg = fg' . s:v . 'bg = none'
exe "hi Pmenu" . s:v . 'fg = ' . s:bla . s:v . 'bg = ' . s:gr1
exe "hi PmenuSel" . s:v . 'fg = fg' . s:v . 'bg = ' . s:gr1
exe "hi PmenuSbar" . s:v . 'bg = ' . s:gr1
exe "hi PmenuThumb" . s:v . 'fg = fg'
exe "hi CursorLine" . s:v . 'bg = ' . s:gr2 . s:v . ' = NONE'
exe "hi TabLine" . s:v . 'fg = ' . s:gr1 . s:v . 'bg = none' . s:v . ' = NONE'
exe "hi TabLineSel" . s:v . 'fg = fg' . s:v . 'bg = none' . s:v . ' = NONE'
exe "hi TabLineFill" . s:v . 'fg = ' . s:bla . s:v . 'bg = none' . s:v . ' = NONE'
exe "hi ColorColumn" . s:v . 'bg = ' . s:gr2 . s:v . ' = NONE'

exe "hi MatchParen" . s:v . 'fg = ' . s:bla . s:v . 'bg = ' . s:bro
exe "hi Comment" . s:v . 'fg = ' . s:gr1
exe "hi Constant" . s:v . 'fg = ' . s:pur
exe "hi Error" . s:v . 'fg = ' . s:lpur . s:v . 'bg = 0'
exe "hi Identifier" . s:v . 'fg = ' . s:cya . s:v . ' = NONE'
exe "hi PreProc" . s:v . 'fg = ' . s:blu . s:v . ' = NONE'
exe "hi Special" . s:v . 'fg = ' . s:yel
exe "hi Statement" . s:v . 'fg = ' . s:bro . s:v . ' = NONE'
exe "hi Todo" . s:v . 'fg = ' . s:bla . s:v . 'bg = ' . s:bro
exe "hi Type" . s:v . 'fg = ' . s:gre . s:v . ' = NONE'

" SQL
exe "hi sqlKeyword" . s:v . 'fg = ' . s:yellow
exe "hi sqlFunction" . s:v . 'fg = ' . s:yellow
exe "hi sqlConditional" . s:v . 'fg = ' . s:blue
exe "hi sqlType" . s:v . 'fg = ' . s:blue
exe "hi sqlNumber" . s:v . 'fg = ' . s:blue
exe "hi sqlOperator" . s:v . 'fg = ' . s:green
exe "hi sqlTodo" . s:v . 'fg = ' . s:blue
exe "hi sqlComment" . s:v . 'fg = ' . s:grey
exe "hi sqlParen" . s:v . 'fg = ' . s:green
exe "hi sqlParens" . s:v . 'fg = ' . s:green
exe "hi sqlString" . s:v . 'fg = ' . s:blue
exe "hi sqlVariable" . s:v . 'fg = ' . s:green
exe "hi sqlParenFunc" . s:v . 'fg = ' . s:green
exe "hi sqlParenEmpty" . s:v . 'fg = ' . s:green
exe "hi sqlType" . s:v . 'fg = ' . s:blue
exe "hi sqlError" . s:v . 'fg = ' . s:red
exe "hi sqlSpecial" . s:v . 'fg = ' . s:blue

"}}}
