" Rule #1 - Don't put any lines in your vimrc that you don't understand.

" Miscellaneous {{{
set nocompatible                    " get rid of Vi compatibility mode. SET FIRST!
filetype plugin indent on           " allow intelligent auto-indenting for each filetype, and for plugins that are filetype specific
set backspace=indent,eol,start      " make backspace flexible
set autoread                        " watch for file changes
" }}}

" Spaces & Tabs {{{
set autoindent                      " auto-indent
set expandtab                       " use spaces instead of tabs
set tabstop=4                       " tab spacing
set softtabstop=4                   " 4 space tab
set shiftround                      " always indent to the nearest tabstop
set shiftwidth=4                    " set shift width to 4 spaces
set smarttab                        " use tabs at the start of a line, spaces elsewhere
" }}}

" UI Layout {{{
set number                          " show the line numbers in the left margin
set ruler                           " show the cursor position all the time
set showcmd                         " display incomplete searches
set cursorline                      " highlight the current line
set wildmenu                        " visual autocomplete for command menu
set lazyredraw                      " Don’t update screen during macro and script execution
set showmatch                       " highlight matching parenthesis
set laststatus=2                    " always display always has a status line
set noerrorbells                    " turn off system beeps
" }}}

" Searching {{{
set ignorecase                      " make searches case-insensitive.
set incsearch                       " do incremental searching
set hlsearch                        " highlight search matches
" }}}

" Folding {{{
set foldenable                      " don't fold files by default on open
set foldmethod=indent               " fold based on indent level
set foldlevelstart=10               " starting fold level for opening a new buffer
set foldnestmax=10                  " Only fold up to 10 nested levels
nnoremap <space> za                 " opens/closes the fold around the current block
" }}}

" Backups {{{
set backup                          " keep a backup file
set backupdir=~/.vim/backup         " set a common backup directory
set backupskip=/tmp/*
set directory=~/.vim/swap           " set the swap file location
" }}}

" Colors (in ~/.vim/colors) {{{
" solarized dark colorscheme
"colorscheme solarized
"set background=dark
"let g:solarized_visibility="high"
"let g:solarized_contrast="high"
"let g:solarized_termcolors=16

" atom one-dark colorscheme
colorscheme one-dark
set background=dark

" cobalt colorscheme
"colorscheme cobalt

" badwolf colorscheme
"colorscheme badwolf
"set termguicolors
" }}}