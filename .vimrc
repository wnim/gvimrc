" Don't try to be vi compatible
set nocompatible

" Turn on syntax highlighting
syntax on

"this doesn't work. uncomment, open .sv file and run ":verbose set filetype" and see where it is set from
"system verilog syntax coloring
"augroup filetypedetect
"  au BufNewFile,BufRead .sv,.svh      setf verilog_systemverilog_uvm
"  au BufNewFile,BufRead .vr,.vri      setf vera
"  autocmd BufNewFile, BufRead *.log setf log 
"augroup END


augroup LOG
  au!
  autocmd BufNewFile,BufRead .sv,.svh setf verilog_systemverilog_uvm
  autocmd BufNewFile,BufRead .vr,.vri setf vera
  autocmd BufNewFile,BufRead *.log    setf log
augroup END

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

"timeouts
"https://vi.stackexchange.com/questions/16148/slow-vim-escape-from-insert-mode
set timeoutlen=1000
set ttimeoutlen=50

" Security
set modelines=0

" Show line numbers
"set number
set number relativenumber
" Show file stats
set ruler

" Encoding
set encoding=utf-8

"search for visually selected block (took this from qualcomm's gvimrc, worked better than online solutions)
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Whitespace
set wrap
set textwidth=999
set wrapmargin=10
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=4

" make backspace great again
"https://stackoverflow.com/questions/11560201/backspace-key-not-working-in-vim-vi
set backspace=indent,eol,start
"https://stackoverflow.com/questions/9701366/vim-backspace-leaves
noremap! <C-?> <C-h>

colorscheme oceanicnext

set matchpairs+=<:> " use % to jump between pairs
"unsuccesful attempt:
"set matchpairs+='begin':'end'
"runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
"nnoremap j g
"nnoremap k gk

" Allow hidden buffers - allow to switch buffers without saving
set hidden

" Rendering
"set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
"nnoremap / /\v
"vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
" doesn't work for some reason
"set listchars=tab:\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
"colorscheme solarized

"autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' |  clip.exe')

"2 - steady block
"6 - steady bar
"set cursors for start and exit 'insert mode'
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" reset the cursor on start 
"echoraw("\e[2 q")
"autocmd VimEnter * silent! echo -ne "\e[2 q"
"autocmd VimEnter * silent !echoraw("\e[2 q")
"reset cursor on exit
"autocmd VimLeave * silent! echo -ne "\e[6 q"

" Reset cursor on startup
if (!has("gui_running"))
augroup ResetCursorShape
  au!
  "no gibberish on enter
  autocmd VimEnter * :normal :startinsert :stopinsert 
  autocmd VimLeave * silent !echo -ne "\e[6 q"
augroup END
endif

" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"allow scrolling with mouse scroll
set mouse=a
"makes mouse scroll work for the entire width. otherwise it stops working passed an arbitrary vertical border
if !has('nvim')
  set ttymouse=sgr
endif
"not sure why, but these aren't actually necessary
"map <ScrollWheelUp> <C-Y>
"map <ScrollWheelDown> <C-E>

"in ex command mode, when hitting tab this will show all the options
set wildmenu
set wildmode=list:longest,full

""install plugins
""automatic installation of vim-plug
"let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
"if empty(glob(data_dir . '/autoload/plug.vim'))
"  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

call plug#begin('~/.vim/plugged')
  Plug 'preservim/NERDTree'
  Plug 'junegunn/vim-peekaboo'
  Plug 'itchyny/lightline.vim'
  Plug 'bkad/CamelCaseMotion'
  Plug 'tpope/vim-surround'
  "Plug 'vim-scripts/Improved-paragraph-motion'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'tommcdo/vim-exchange'
call plug#end()

"commented this out because is messe up my cursor in the terminal when exiting vim
"let g:camelcasemotion_key = '<leader>'

""start NERDTree on startup
""https://stackoverflow.com/questions/1447334/how-to-add-nerdtree-to-your-vimrc

"I disabled this, because for some reason when nerd tree is open, 
"everytime I scroll inside the file, gvim prints out some error message
"autocmd VimEnter * NERDTree
""switch focus to editor
"autocmd VimEnter * wincmd p
""exit if nerdtree is the last and only buffer
"autocmd bufenter * nested if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"using vim as a man-pager https://vim.fandom.com/wiki/Using_vim_as_a_man-page_viewer_under_Unix
"let $PAGER=''

"vim terminal configs
"so f1 can move us to normal mode
tnoremap <F1> <C-W>N

":vsp :vnew will open the new buffer on the right
set splitright

"\q to exit current buffer
map <leader>q :b#<bar>bd#<CR>
command! Bd b#|bd#

"set project path
if ($sim != "")
  set path+=$sim/**
endif

"no wrap for vim-terminal
augroup MyGroup
  autocmd!
  "autocmd TerminalWinOpen * setl nowrap
  "autocmd TerminalWinOpen * setl nonumber norelativenumber
  autocmd TerminalWinOpen * setl iskeyword+=/
  autocmd TerminalWinOpen * setl iskeyword+=.
  autocmd TerminalWinOpen * setl iskeyword+=-
  autocmd TerminalWinOpen * setl iskeyword+=@
  autocmd TerminalWinOpen * setl iskeyword+=$
  autocmd TerminalWinOpen * setl iskeyword+=~
	autocmd TerminalOpen * execute "set termwinsize=0x" . (winwidth("%")-6)
	autocmd VimResized * execute "set termwinsize=0x" . (winwidth("%")-6)
augroup end
"experimenting with this because swp files are giving me a big headache
set noswapfile

"vim pwd follow terminal pwd
"set autoshelldir

filetype detect
if (&filetype=='systemverilog' || &filetype=='verilog_systemverilog_uvm')
  set colorcolumn=100
  highlight ColorColumn ctermbg=1
  set textwidth=120
endif


command RmPrePath  %s/\/vobs.*\///g

"when multiple lines are highlighted, Y will copy all of them as a single line
"This is useful for vim-terminal, where wrapping lines are treated as separate lines
noremap Y "zy:vnew<CR>pggVGgJ^vg_"+y:q!<CR>
inoremap <C-a> <C-w><S-n>






