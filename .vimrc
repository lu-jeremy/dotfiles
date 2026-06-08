
" --- Essentials ---
set nocompatible               " disable vi compatibility
syntax on                      " syntax highlighting
filetype plugin indent on      " filetype detection + plugins + indent

" --- Colorscheme ---
set background=dark
set termguicolors              " true color support (needs proper $TERM)
colorscheme habamax            " best built-in dark scheme; swap for gruvbox/catppuccin if installed

" --- Editing Defaults ---
set number                     " line numbers
set relativenumber             " relative line numbers (great for vim motions)
set tabstop=4                  " tab = 4 spaces visually
set shiftwidth=4               " indent = 4 spaces
set expandtab                  " tabs become spaces
set autoindent                 " copy indent from current line
set smartindent                " smart autoindenting for C-like languages

" --- Search ---
set incsearch                  " search as you type
set hlsearch                   " highlight matches
set ignorecase                 " case-insensitive search...
set smartcase                  " ...unless you use uppercase

" --- UI ---
set cursorline                 " highlight current line
set scrolloff=8                " keep 8 lines above/below cursor
set signcolumn=yes             " always show sign column (no layout shift)
set colorcolumn=100            " ruler at column 100
set wrap                       " wrap long lines
set linebreak                  " wrap at word boundaries

" --- Performance / Behavior ---
set hidden                     " allow switching buffers without saving
set noswapfile                 " no .swp files
set nobackup                   " no backup files
set undofile                   " persistent undo across sessions
set undodir=~/.vim/undodir     " undo file location (mkdir -p ~/.vim/undodir)
set updatetime=250             " faster CursorHold events
set timeoutlen=500             " mapping timeout

" --- Splits ---
set splitbelow                 " horizontal splits open below
set splitright                 " vertical splits open right

" --- Wildmenu (command-line completion) ---
set wildmenu                   " visual autocomplete for command menu
set wildmode=longest:full,full " complete longest common, then cycle

" --- Key Mappings ---
"  " Leader key (space is industry standard)
"  let mapleader = " "
"
 " Clear search highlight
 nnoremap <leader>h :nohlsearch<CR>

 " Quick save
 nnoremap <leader>w :w<CR>

 " Better window navigation
 nnoremap <C-h> <C-w>h
 nnoremap <C-j> <C-w>j
 nnoremap <C-k> <C-w>k
 nnoremap <C-l> <C-w>l

 " Keep visual selection when indenting
 vnoremap < <gv
 vnoremap > >gv

 " Move lines up/down in visual mode
 vnoremap J :m '>+1<CR>gv=gv
 vnoremap K :m '<-2<CR>gv=gv

 " Keep cursor centered when scrolling
 nnoremap <C-d> <C-d>zz
 nnoremap <C-u> <C-u>zz

 " Keep cursor centered when searching
 nnoremap n nzzzv
 nnoremap N Nzzzv

 " --- Statusline (minimal, no plugins needed) ---
 set laststatus=2
 set statusline=%f\ %m%r%h%w\ %=%y\ [%l/%L]\ %p%%

 " Bracketed paste (prevents auto-indent on paste)
 if &term =~ "screen" || &term =~ "tmux"
     let &t_BE = "\e[?2004h"
         let &t_BD = "\e[?2004l"
         endif
