set  nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"folding
Plugin 'tmhedberg/SimpylFold'
"for indentation
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'valloric/youcompleteme'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Lokaltog/vim-easymotion'
Plugin 'wincent/Command-T'
Plugin 'vim-scripts/IndentAnything'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"  Put your non-Plugin stuff after this line
" -----------------------------------------------------------------------------
" INDENTATION AND TEXT-WRAP
" -----------------------------------------------------------------------------
set expandtab                   " Expand tabs to spaces
set autoindent smartindent      " auto/smart indent
set copyindent                  " copy previous indentation on auto indent
set softtabstop=2               " Tab key results in # spaces
set tabstop=2                   " Tab is # spaces
set shiftwidth=2                " The # of spaces for indenting.
set smarttab                    " At start of line, <Tab> inserts shift width
                                "   spaces, <Bs> deletes shift width spaces.
set wrap                        " wrap lines
set textwidth=80
"set colorcolumn=+1              " Show large lines
set formatoptions=qrn1          " automatic formating.
set formatoptions-=o            " don't start new lines w/ comment leader on
                                "   pressing 'o'
set nomodeline                  " don't use modeline (security)
set pastetoggle=<leader>p       " paste mode: avoid auto indent, treat chars
                                "   as literal.
" --- Strip trailing whitespace ---
function! StripWhitespace ()
let save_cursor = getpos(".")
let old_query = getreg('/')
    :%s/\s\+$//e
call setpos('.', save_cursor)
call setreg('/', old_query)
endfunction
" Trailing white space (strip spaces)
noremap <leader>ss :call StripWhitespace()<CR>

set encoding=utf-8
"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let python_highlight_all=1
syntax on
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn
endif
call togglebg#map("<F5>")
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
set nu
set clipboard=unnamed
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif
" nerd tree
let NERDTreeIgnore=['.DS_Store']
let NERDTreeShowBookmarks=0         "show bookmarks on startup
let NERDTreeHighlightCursorline=1   "Highlight the selected entry in the tree
let NERDTreeShowLineNumbers=0
let NERDTreeMinimalUI=1
nnoremap <Leader>nt :NERDTreeFind<CR>
" --- NERDCommenter ---
let NERDSpaceDelims=1               " space around delimiters
let NERDRemoveExtraSpaces=1
let g:NERDCustomDelimiters = {
\ 'scss': { 'left': '//' }
\ }
" --- EasyMotion ---
let g:EasyMotion_leader_key = '<Leader>m'
" lets make <leader>F and <leader>f use easymotion by default
let g:EasyMotion_mapping_f = '<leader>f'
let g:EasyMotion_mapping_F = '<leader>F'
