set nocompatible

""=============================================================================
""          AUTO PLUGINS UPLOAD
""=============================================================================

if (!has('nvim') && empty(glob('~/.vim/autoload/plug.vim')))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

if (has('nvim') && empty(glob('~/.local/share/nvim/site/autoload/plug.vim')))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

""=============================================================================
""          VIM GEN PLUGINS
""=============================================================================

call plug#begin(expand('~/.config/nvim/plugged'))

Plug    'valloric/youcompleteme'
Plug    'thiagoalessio/rainbow_levels.vim'
Plug    'tpope/vim-fugitive'
Plug    'vim-airline/vim-airline'
Plug    'vim-airline/vim-airline-themes'
Plug    'airblade/vim-gitgutter'
Plug    'sheerun/vim-polyglot'
Plug    'scrooloose/nerdtree'
Plug    'wesQ3/vim-windowswap'
Plug    'ludovicchabant/vim-gutentags'
Plug    'lervag/vimtex'
Plug    'plasticboy/vim-markdown'
Plug    'AndrewRadev/splitjoin.vim'

""=============================================================================
""          LANG SPECIC PLUGINS
""=============================================================================

""          Erlang
Plug    'jimenezrick/vimerl'

""          Go
Plug     'fatih/vim-go'

""          Html
Plug    'mattn/emmet-vim'
Plug    'hail2u/vim-css3-syntax'

""          Javascript
Plug    'pangloss/vim-javascript'

if filereadable(expand("~/.config/nvim/local_bundles.vim"))
  source ~/.config/nvim/local_bundles.vim
endif

call plug#end()
filetype plugin indent on

""=============================================================================
""          BASIC
""=============================================================================

set hidden
set backspace=indent,eol,start
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set hlsearch
set incsearch
set ignorecase
set smartcase
set nobackup
set noswapfile
set autoindent

let mapleader=' '

let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

syntax on

set ruler
set number
set scrolloff=3
set laststatus=2
set modeline
set modelines=10
set title
set titlestring=%F
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

nnoremap n nzzzv
nnoremap N Nzzzv

""=============================================================================
""          NERDtree
""=============================================================================

let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

set autoread

""=============================================================================
""         MAPPINGS 
""=============================================================================

noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>
nnoremap <silent> <S-t> :tabnew<CR>
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>c :bd<CR>
nnoremap <silent> <leader><space> :noh<cr>
noremap <ENTER> o<ESC>

nnoremap <Left> :echo "No, no, no, use fucking hjkl"<CR>
nnoremap <Right> :echo "No, no, no use fucking hjkl"<CR>
nnoremap <Up> :echo "No, no, no use fucking hjkl"<CR>
nnoremap <Down> :echo "You know what i'm going to tell you"<CR>

vmap < <gv
vmap > >gv

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <Leader>o :.Gbrowse<CR>

""=============================================================================
""         LANG SPECIFICS
""=============================================================================

"           C
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab

"           Erlang
let erlang_folding = 1
let erlang_show_errors = 1

"           Html
autocmd Filetype html setlocal ts=2 sw=2 expandtab

"           Javascript
let g:javascript_enable_domhtmlcss = 1
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4
augroup END

""=============================================================================
""          AIRLINE SYMBOLS
""=============================================================================

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif
