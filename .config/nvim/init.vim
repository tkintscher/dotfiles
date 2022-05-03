" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
" Plug 'Luxed/ayu-vim'
Plug 'Shatur/neovim-ayu'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


set nocompatible             " disable compatibility to old-time vi
set showmatch                " show matching 
set ignorecase               " case insensitive 
set mouse=v                  " middle-click paste with 
set hlsearch                 " highlight search 
set incsearch                " incremental search
set tabstop=4                " number of columns occupied by a tab 
set softtabstop=4            " see multiple spaces as tabstops so <BS> does the right thing
set expandtab                " converts tabs to white space
set shiftwidth=4             " width for autoindents
set autoindent               " indent a new line the same amount as the line just typed
set number                   " add line numbers
set wildmode=longest,list    " get bash-like tab completions
" set cc=80                    " set an 80 column border for good coding style
filetype plugin indent on    " allow auto-indenting depending on file type
syntax on                    " syntax highlighting
set mouse=a                  " enable mouse click
set clipboard=unnamedplus    " using system clipboard
filetype plugin on
set cursorline               " highlight current cursorline
set ttyfast                  " Speed up scrolling in Vim
" set spell                    " enable spell check (may need to download language package)
" set noswapfile               " disable creating swap file
" set backupdir=~/.cache/vim   " Directory to store backup files.


" set background=dark          " make work with dark background
" colorscheme oceanic_material " set a theme
" colorscheme vim-material     " set a theme

""" Color scheme: Ayu
set termguicolors              " enable true colors support
" set background=light           " for light version of theme
set background=dark            " for either mirage or dark version.
"colorscheme ayu
"colorscheme ayu-light
"colorscheme ayu-mirage
colorscheme ayu-dark
""" Color scheme: Ayu (end)

