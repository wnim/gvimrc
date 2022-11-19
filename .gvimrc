" An example for a gvimrc file.
" The commands in this are executed when the GUI is started.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 Sep 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.gvimrc
"	      for Amiga:  s:.gvimrc
"  for MS-DOS and Win32:  $VIM\_gvimrc
"	    for OpenVMS:  sys$login:.gvimrc

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" set the X11 font to use
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1

set ch=2		" Make command line two lines high

set mousehide		" Hide the mouse when typing text
"set wrap!
set wrap
set nobk

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Only do this for Vim version 5.0 and later.
if version >= 500

  " I like highlighting strings inside C comments
  let c_comment_strings=1

  " Switch on syntax highlighting if it wasn't on yet.
  if !exists("syntax_on")
    syntax on
  endif

  " Switch on search pattern highlighting.
  set hlsearch

  " For Win32 version, have "K" lookup the keyword in a help file
  "if has("win32")
  "  let winhelpfile='windows.hlp'
  "  map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
  "endif

  " Set nice colors
  " background for normal text is light grey
  " Text below the last line is darker grey
  " Cursor is green, Cyan when ":lmap" mappings are active
  " Constants are not underlined but have a slightly lighter background
  "highlight Normal guibg=grey90
  "highlight Cursor guibg=Green guifg=NONE
  "highlight lCursor guibg=Cyan guifg=NONE
  "highlight NonText guibg=grey80
  "highlight Constant gui=NONE guibg=grey95
  "highlight Special gui=NONE guibg=grey95
  "colorscheme evening
  colorscheme oceanicnext

endif
set tags+=~/.vim/template_tags
imap <C-Space> <C-N><C-P>
set nocp
set bs=2


filetype plugin indent on

augroup filetypedetect
au BufNewFile,BufRead *.sva,*.sv,*.blk,*.vblk,*.svh                                                    set ft=verilog_systemverilog_uvm
au BufNewFile,BufRead *.vr,*.vri                                                                        set ft=vera
au BufNewFile,BufRead *.rmp                                                                             set ft=perl
au BufNewFile,BufRead *.as,*.asm,*.S                                                                    set ft=asm
au BufNewFile,BufRead dvp*.asm,define.asm,test.asm,vlc.asm,host.asm,regs.asm,dram.asm,flow.asm,alu.asm  set syntax=dvp_asm
au BufNewFile,BufRead *.v,*.ver,*.vnet,*.wire,*.gtl,*.*verilog*,*.vlib,*.def,nested*,*.f,*.list,*.vh    set ft=verilog
au BufNewFile,BufRead *.vhd*                                                                            set ft=vhdl
au BufNewFile,BufRead *.regs,*.imp,*.conf                                                               set ft=tcl
au BufNewFile,BufRead *.lib                                                                             set ft=specman
au BufNewFile,BufRead *.tl                                                                              set ft=tcsh
augroup END


" begin gilp_old
" Vim
" An example for a gvimrc file.
" The commands in this are executed when the GUI is started.
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.gvimrc
"             for Amiga:  s:.gvimrc
"  for MS-DOS and Win32:  $VIM\_gvimrc

"if !has("win32") 
"  set shell=csh\ -f       " Make shell commands work faster
"endif


:map [216z 
:map [222z 
:map [214z 1G
:map [220z G
" :map g :set tabstop=
set ai sm nu  ru noaw terse noic
"map t2 :set tabstop=2<CR>
"map t4 :set tabstop=4<CR>
"map t8 :set tabstop=8<CR>
"set tabstop=4
"set ts=8
set ts=2
"set shiftwidth=4
set shiftwidth=2
set showmatch
set backspace=2

set ignorecase
" set noic
" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" set the X11 font to use
set guifont=10x20

" Make command line two lines high
set ch=2

set scs
" Only do this for Vim version 5.0 and later.
"if version >= 500

  " I like highlighting strings inside C comments
  let c_comment_strings=1

  " Switch on syntax highlighting.
" Changed by Ran Fisher - July 21st 2000 - I've added the following line
  let mysyntaxfile = "~/.vimsyntax.vim"
  if !exists("syntax_on")
    syntax on
  endif

  " Switch on search pattern highlighting.
  set hlsearch

  " Hide the mouse pointer while typing
  set mousehide
  
"   map dc      :s#\(^.*//\)\(.*$\)#\1-------------------------------------\r\1\2\r\1-------------------------------------#<CR>:nohl<CR>
""========== insert '#' at start of current line
"   map ##      :s/^/\#/
""
""========== insert ';' at start of current line
"   map ;;      :s/^/\;/
""
""========== insert '%' at start of current line
"   map %%      :s/^/\%/
""
""========== insert '//' at start of current line
"   map //      :s/^/\/\//
""
""========== insert '--' at start of current line
"   map --      :s/^/--/
""========== insert '"' at start of current line
"   map ""      :s/^/"/
""
""========== remove '#' from start of current line
"   map #!      :s;^\#;;
""
""========== remove '--' from start of current line
"   map -!      :s;^--;;
""
""========== remove '//' from start of current line
"   map /!      :s;^\/\/;;
""========== remove '""' from start of current line
"   map "!      :s;^";;
""
""
""========== insert '*' at start of current line
"   map *(      :s;^;\*;
""
""========== remove '*' from start of current line
"   map *)      :s;^\*;;
""
""========== enclose line with '/*' '*/'
"   map **      :s;^.*$;\/\* & \*\/;
""
""========== remove '/*' '*/'
"   map *!      :s;\/\* ;;:s; \*\/;;
"
" gilp - This is to Enable the :cal SetSyn command (enable the syn menu):
":let do_syntax_sel_menu = 1|runtime! synmenu.vim|aunmenu &Syntax.&Show\ filetypes\ in\ menu

":set nonu
"map ss :cal SetSyn("specman")
"map vv :cal SetSyn("verilog")
"map sv :cal SetSyn("verilog_systemverilog_uvm")
"map vh :cal SetSyn("vhdl")
"map cc :cal SetSyn("c")
"map cs :cal SetSyn("csh")
"map tc :cal SetSyn("tcsh")
"map aa :cal SetSyn("asm")
"map pp :cal SetSyn("perl")
"map tt :cal SetSyn("tcl")

" from Amirk: (set ft == set filetype)

  " Decide which Commands are Vi compatible
  set nocp

  " History level (used also for search "/" & command ":" level)
  set history=100

  " Set nice colors
  " background for normal text is light grey
  " Text below the last line is darker grey
  " Cursor is green
  " Constants are not underlined but have a slightly lighter background
"highlight Normal gui=bold guibg=black guifg=green 
  " highlight Cursor guibg=Green guifg=NONE
  " highlight NonText guibg=grey20
  " highlight Constant guifg=lightblue guibg=NONE
  " highlight Special guifg=yellow guibg=NONE
  " highlight Search guibg=DarkKhaki guifg=NONE
  " highlight Comment guifg=Pink guibg=NONE
  " highlight Statement guifg=DarkSeaGreen guibg=NONE
  " highlight cType guifg=DarkSeaGreen guibg=NONE
" 
"endif

"highlight DiffAdd    guibg=#131246 "dark blue"
highlight DiffText   guibg=#ff9999 "transparent red"
highlight DiffChange guibg=#ffdddd "very transparent red"

"gilp removed for Linux:
"set guifont=-Adobe-Courier-Bold-R-Small--18-180-75-75-M-110-ISO8859-1

  set ic
"  set infercase
"  set noic

  set number
"source ~/.exrc
:set guifont=-dt-application-bold-r-normal-*-*-180-*-*-m-*-iso8859-1

if ($HOST=~"amd") || ($HOST=~"lx") || ($HOST=~"zml-tux")
    "echo $HOST
    "set gfn=Sans\ 14
    set gfn=Courier\ 10
else
    set guifont=-Adobe-Courier-Bold-R-Small--18-180-75-75-M-110-ISO8859-1
endif
" from Yoave:
" Ctrl+S Expand verilog modules names to 'by name' format
map <C-S> :s#\(\S\{-}\)\s\{-}\n\{-}\s\{-}\(,\\|\n\{-}\s\{-})\s\{-};\)#.\1\t(\1)\2 #g<CR>:nohl<CR>
"map <S-S> :s#\(input\\|output\)\s\{-}\(reg\\|wire\)\=\s\{-}[\[\]\:0-9]*\s\{-}\(\S\{-}\)\s\{-}\n\{-}\s\{-}\(,\\|\n\{-}\s\{-})\s\{-};\)#.\3\t(\3)\4 #g<CR>:nohl<CR>
" Shift+S
map <S-S> :s#\(input\\|output\)\s\{-}\(reg\\|wire\)\=\s\{-}\[\=\S*\]\=\s\{-}\(\S\{-}\)\s\{-}\n\{-}\s\{-}\(,\\|\n\{-}\s\{-})\s\{-};\)#.\3\t(\3)\4 #g<CR>:nohl<CR>
" ctrl-m : module mmm (a,b,c); --> mmm mmm ( .a(a), .b(b), .c(c) );
map  <C-M> ma<S-V>:s/\s*module\s\+//<CR>:s/\s*(//<CR>'a<S-V>:s/\(.*\)/  \1 \1 (/<CR><Down>ma/)<CR>mb<S-V>:s/\s*)//<CR>'bi<Home>		)<Esc><Up>mb:'a,'b s/\s*//g<CR>:'a,'b s/,$//<CR>:'a,'b s/,/<C-V><CR>/g<CR>/)<CR><Up>mb:'a,'b s/\(.*\)/			.\1		(\1),/<CR>/xbxbxb<CR>'a

" verilog shortcuts
ab hed //////////////////////////////////////////////////////////////////////////////                                                                        //// Copyright (c) 2009 ZORAN Corporation, All Rights Reserved              //// THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE OF ZORAN CORPORATION       ////                                                                        //// Project: ROBIN                                                         //// $Id: $:// $Author: $:// $DateTime: $://                                                                        //////////////////////////////////////////////////////////////////////////////


" from ctomer:
" Make horizontal window switching nicer
map  <C-PageUp> <C-W><Up>:res<CR>
map  <C-PageDown> <C-W><Down>:res<CR>
map! <C-PageUp> <Esc><C-W><Up>:res<CR><Insert>
map! <C-PageDown> <Esc><C-W><Down>:res<CR><Insert>
map  <C-Up> <C-W><Up>
map  <C-Down> <C-W><Down>
map! <C-Up> <Esc><C-W><Up>
map! <C-Down> <Esc><C-W><Down>


" Make vartical window switching nicer
map  <S-PageUp> <C-W><Right>:vert res<CR>
map  <S-PageDown> <C-W><Left>:vert res<CR>
map! <S-PageUp> <Esc><C-W><Right>:vert res<CR><Insert>
map! <S-PageDown> <Esc><C-W><Left>:vert res<CR><Insert>

set wmh=0
set guifont=Luxi\Mono\ 11
set guifont=Bitstream\ Terminal\ 11

" from alanr :

" Functions for increasing and decreasing font-size, from
" http://vim.wikia.com/wiki/Change_font_size_quickly
let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 16
function! AdjustFontSize(amount)
  if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
     endif
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

 function! LargerFont()
   call AdjustFontSize(1)
 endfunction
 command! LargerFont call LargerFont()

 function! SmallerFont()
   call AdjustFontSize(-1)
 endfunction
 command! SmallerFont call SmallerFont()

"" from Boaz F. :
"" Make shift-insert work like in Xterm (replaced below by bmoshe...)
"map  <S-Insert> <MiddleMouse>

" from Amirk: (automatic retab) :
set expandtab
ab als always @(posedge clk `PS_RESET)   if ( !`A_RESET)     <= #1 1'b0;

" from bmoshe:

vmap <kMultiply> *
" Make * search for visually selected text
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Make Ctrl-Insert Copy to buffer +
vmap  <C-Insert> mq"+y
" Make Ctrl-Delete Cut with buffer +
vmap <C-Del> "+x
" Make Shift-Insert Paste from buffer +
map <S-Insert> "+P
imap <S-Insert> <Right><Esc>"+P<Insert>
"" Make Ctrl-Insert Copy to buffer i
"map  <C-Insert> mq "iy  
"map! <C-Insert> mq "iy
"" Make Ctrl-Delete Cut to buffer i
"map  <C-Del> "ix
"map! <C-Del> <right><Esc>"ix<Insert>
"" Make Shift-insert Paste from buffer i
"map  <S-Insert> "iP
"map! <S-Insert> <right><Esc>"iP<Insert>

"set tags=$design/gvim.tags,$system/gvim.tags,$scripts/gvim.tags
"if exists("$scripts/gvimrc.sourceme")
"    source $scripts/gvimrc.sourceme
"else
"    if exists("$SCRIPTS/gvimrc.sourceme")
"       source $SCRIPTS/gvimrc.sourceme
"    endif
"endif
"if exists("$scripts/perforce.vim")
"    source ~gp08/perforce.vim
"else
"    if exists("$SCRIPTS/perforce.vim")
"        source ~gp08/perforce.vim
"    endif
"endif

"source /misc/dsc/common/bin/.coach_vim_functions
"source /home/Zoran/gp08/.coach_vim_functions

source ~/gvim_align.vim

" ClearCase plugin :
let g:ccaseNoComment = 1      " Allow user to skip being prompted for comments all the time (Default is to ask for comments)
source ~/ccase.vim

"if exists("$scripts/gvim_align.vim")
"    source $scripts/gvim_align.vim
"else
"    if exists("$SCRIPTS/gvim_align.vim")
"        source $SCRIPTS/gvim_align.vim
"    else
"        if exists("/home/Zoran/gp08/gvim_align.vim")
"            source /home/Zoran/gp08/gvim_align.vim
"        endif
"    endif
"endif

" p4 edit / add/ revert (check-out / revert unchanged / revert with saving backup) :
"map co  :w!       <CR> :! source /proj/$PROJECT/logic/work/$USER/VLSI/scripts/cshrc_$PROJECT ; p4login ; p4 edit      %   <CR> :e <CR>
"map 4ad :w!       <CR> :! source /proj/$PROJECT/logic/work/$USER/VLSI/scripts/cshrc_$PROJECT ; p4login ; p4 add       %   <CR> :e <CR>
"map 4re :w!       <CR> :! source /proj/$PROJECT/logic/work/$USER/VLSI/scripts/cshrc_$PROJECT ; p4login ; p4 revert -a %   <CR> :e <CR>
"map 4rf :w! %.bkp <CR> :! source /proj/$PROJECT/logic/work/$USER/VLSI/scripts/cshrc_$PROJECT ; p4login ; p4 revert    %   <CR> :e <CR>
"map 4d                 :! source /proj/$PROJECT/logic/work/$USER/VLSI/scripts/cshrc_$PROJECT ; p4login ; p4 diff      %   <CR> :e <CR>
"map 4cl                :! source /proj/$PROJECT/logic/work/$USER/VLSI/scripts/cshrc_$PROJECT ; p4login ; p4 changes -s pending -c $P4CLIENT <CR>
"map co  :w!       <CR> :! p4 edit      %   <CR> :e <CR>
"map 4ed :w!       <CR> :! p4 edit      %   <CR> :e <CR>
"map 4ad :w!       <CR> :! p4 add       %   <CR> :e <CR>
"map 4re :w!       <CR> :! p4 revert -a %   <CR> :e <CR>
"map 4rf :w! %.bkp <CR> :! p4 revert    %   <CR> :e <CR>
"map 4d                 :! p4 diff      %   <CR> :e <CR>
"map 4cl                :! p4 changes -s pending -c $P4CLIENT <CR>

map co  :w!       <CR> :! ct co -nc     % <CR> :e <CR>
map cad :w!       <CR> :! ct mkelem -nc % <CR> :e <CR>


" change dir to current file whenever :sp to it:
autocmd BufEnter * lcd %:p:h
"autocmd BufEnter * lcd %:h

"set isk+=$,#                    " select $ as part of word (perl)
set isfname-=,                  " ',' is not part of filename

"set spell " use z= to get list of corrections

"echo file name & store in clipboard
map ,f :let @*=expand("%:p")<CR>:let @+=expand("%:p")<CR>:echo expand("%:p")<CR>

" <F2> save buffer
map  <F2> :w!<CR>
imap <F2> <ESC>:w!<CR>a

" <F1> remove the help shortcut:
map <F1> <nop>
imap <F1> <nop>

" open tag in split buffer: Alt + ] (gvim opens tag with Ctrl + ] without split...)
map <A-]> <C-W><C-]>

"""""""""""""""""""""
" better split
"""""""""""""""""""""
function! Sp(dir, ...)
	let split = 'sp'
	if a:dir == '1'
		let split = 'vsp'
	endif
	if(a:0 == 0)
		execute split
	else
		let i = a:0
		while(i > 0)
			execute 'let files = glob (a:' . i . ')'
			for f in split (files, "\n")
				execute split . ' ' . f
			endfor
			let i = i - 1
		endwhile
		windo if expand('%') == '' | q | endif
endif
endfunction
com! -nargs=* -complete=file Sp call Sp(0, <f-args>)
com! -nargs=* -complete=file Vsp call Sp(1, <f-args>)
set wildmenu                    " wildmenu  command-line completion shows a list of matches
set wildmode=list:longest,full

" Make Shift-Open auto open a file with the name under the cursor and focus on it
nnoremap <S-S> <C-W>F:res<CR>
" Make Ctrl-Open auto open a file with the name under the cursor
nnoremap <C-S> <C-W>F
" map <S-S>   :sp <cfile>*<CR>:res<CR>  <-- old version
" nnoremap <S-S> <C-W><C-F>:res<CR>     <-- no jump to error line

"source /home/Zoran/gp08/LargeFile.vim
"
"
""""""""""""""""""
" Completion
""""""""""""""""""
set completeopt+=longest
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

set noea

"set path+=$verif/e_env         " for specman includes (HE)

" end gilp_old

" align commmas after Align done:
"map al, :s/\(\s\+\),/,\1/
"map al; :s/\(\s\+\);/;\1/
map ,r :%s/\s\+$//
" match begin/end in Verilog:
so $VIMRUNTIME/macros/matchit.vim
