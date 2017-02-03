" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.ngc		setfiletype ngc
  au! BufRead,BufNewFile *.hal		setfiletype linuxcnc-hal
  au! BufRead,BufNewFile *.scad		setfiletype openscad
augroup END
