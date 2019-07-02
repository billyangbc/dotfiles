set nocompatible                    " get rid of Vi compatibility mode. SET FIRST!
filetype plugin indent on           " allow intelligent auto-indenting for each filetype, and for plugins that are filetype specific
syntax enable                       " enable syntax highlighting (previously syntax on).

set cursorline                      " highlight the current line
set mouse=a                         " enable use of the mouse for all modes
set autoread                        " watch for file changes
set ruler                           " show the cursor position all the time
set number                          " show the line numbers in the left margin
set laststatus=2                    " last window always has a status line
set noerrorbells                    " turn off system beeps
set novisualbell                    " none of that blinking bullshit

set hlsearch                        " highlight search matches
set showcmd                         " display incomplete searches
set incsearch                       " do incremental searching
set ignorecase                      " make searches case-insensitive.
set showmatch                       " show matching brackets

set autoindent                      " auto-indent
set expandtab                       " use spaces instead of tabs
set smarttab                        " use tabs at the start of a line, spaces elsewhere
set tabstop=4                       " tab spacing
set softtabstop=4                   " unify
set shiftwidth=4                    " set shiftwidth to 4 spaces
set shiftround                      " always indent/outdent to the nearest tabstop
set backspace=indent,eol,start      " make backspace flexible

set backup                          " keep a backup file
set backupdir=~/.vim/backup         " set a common backup directory
set backupskip=/tmp/*
set directory=~/.vim/swap           " set the swap file location

" solarized dark colorscheme
"colorscheme solarized
"set background=dark
"let g:solarized_visibility="high"
"let g:solarized_contrast="high"
"let g:solarized_termcolors=16

" atom one-dark colorscheme
colorscheme one-dark
set background=dark

" requires cobalt.vim to be in ~/.vim/colors
"colorscheme cobalt
