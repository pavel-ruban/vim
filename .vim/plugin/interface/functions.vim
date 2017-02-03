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
at = autotag.AutoTag();
data = at.findTagFile(vim.eval("expand('%:p')"))

# Debug
#print(data)

if data:
    if data[0]:
        vim.command('let g:interfacePrjPath="%s"' % data[0])
        vim.command('set makeprg=scons\ -C\ %s"' % data[0])

    if data[1]:
    	#print('setting tags %s' % ('set tags=%s' % data[1]))
        vim.command('set tags=%s' % data[1])

EOF
    endif
endfunc

" Callback is used to format quickfix & buffer's foldings.
function! CustomFoldText()
  let line = getline(v:foldstart)
  if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
    let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
    let linenum = v:foldstart + 1
    while linenum < v:foldend
      let line = getline( linenum )
      let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
      if comment_content != ''
        break
      endif
      let linenum = linenum + 1
    endwhile
    let sub = initial . ' ' . comment_content
  else
    let sub = line
    let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
    if startbrace == '{'
      let line = getline(v:foldend)
      let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
      if endbrace == '}'
        let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
      endif
    endif
  endif
  let n = v:foldend - v:foldstart + 1
  let info = "<" . n
  let sub = sub . "                                                                                                                  "
  let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
  let fold_w = getwinvar( 0, '&foldcolumn' )
  let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
  return '+ ' . sub . info
endfunction

" Restire old positions.
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

"function! BindMakePrj(...)
"	if a:0 > 0
"		if a:1 == 'debug'
"			exe "set makeprg=scons\\ -C\\ " . g:interfacePrjPath . "\\ -j\\ 8\\ --debugger"
"		elseif a:1 == 'profile'
"			exe "set makeprg=scons\\ -C\\ " . g:interfacePrjPath . "\\ -j\\ 8\\ --profiler"
"		end
"	else
"		exe "set makeprg=scons\\ -C\\ " . g:interfacePrjPath . "\\ -j\\ 8"
"	end
"endfunction
"

function! BindMakePrj(...)
	if a:0 > 0
		if a:1 == 'debug'
			exe "set makeprg=make\\ -C\\ " . g:interfacePrjPath . "\\ -j\\ 8\\ d"
		elseif a:1 == 'flash'
			exe "set makeprg=make\\ -C\\ " . g:interfacePrjPath . "\\ -j\\ 8\\ flash"
		elseif a:1 == 'clean'
			exe "set makeprg=make\\ -C\\ " . g:interfacePrjPath . "\\ -j\\ 8\\ clean"
		elseif a:1 == 'optimized'
			exe "set makeprg=make\\ -C\\ " . g:interfacePrjPath . "\\ -j\\ 8\\ o"
		elseif a:1 == 'gdb'
			exe "set makeprg=make\\ -C\\ " . g:interfacePrjPath . "\\ debug"
		end
	else
			exe "set makeprg=make\\ -C\\ " . g:interfacePrjPath . "\\ -j\\ 8"
	end
endfunction
