" Interface related logic.
if exists("g:InterfaceFunctionsInit")
  if (g:InterfaceFunctionsInit == 1)
    finish
  endif
endif

let g:InterfaceFunctionsInit = 1

func! InterfaceSetDefaultEnvironment()
    if exists("g:autotag_vim_version_sourced") && has("python")

        python << EOF
autotag = AutoTag();
data = autotag.findTagFile(os.getcwd())

if data:
    if data[0]:
        vim.command('let g:interfacePrjPath="%s"' % data[0])

    if data[1]:
        vim.command('set tags=%s' % data[1])

EOF
    endif
endfunc
