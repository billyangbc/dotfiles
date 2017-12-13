set nocompatible                    " get rid of Vi compatibility mode. SET FIRST!
filetype plugin indent on           " filetype detection[ON] plugin[ON] indent[ON]
set t_Co=256                        " enable 256-color mode.
set ruler							" show the cursor position all the time
set number 							" show the line numbers in the left margin

syntax enable                       " enable syntax highlighting (previously syntax on).
set hlsearch 						" highlight search matches
set showcmd                         " display incomplete searches
set incsearch                       " do incremental searching
set ignorecase                      " Make searches case-insensitive.

set autoindent                      " auto-indent
set expandtab                       " use spaces instead of tabs
set smarttab                        " use tabs at the start of a line, spaces elsewhere
set tabstop=4                       " tab spacing
set softtabstop=4                   " unify
set shiftwidth=4                	" set shiftwidth to 4 spaces
set shiftround                      " always indent/outdent to the nearest tabstop
set backspace=indent,eol,start  	" make backspace flexible

set showmatch                       " show matching brackets
set matchtime=5                     " number of tenths of a second to blink on bracket match
set noerrorbells 					" turn off system beeps
set novisualbell                    " none of that blinking bullshit

set shortmess=aOstT                 " short messages. no more 'press a key' messages
set laststatus=2                    " last window always has a status line
set iskeyword-=$

set backup							" keep a backup file
set backupdir=~/.vim/backup 		" set a common backup directory
set backupskip=/tmp/*
set directory=~/.vim/swap 			" set the swap file location

" solarized dark colorscheme
" colorscheme solarized
" set background=dark
" let g:solarized_visibility="high"
" let g:solarized_contrast="high"
" let g:solarized_termcolors=16

" atom one-dark colorscheme
colorscheme one-dark

" folding
set foldenable                      " turn on folding
set foldmethod=indent               " fold method to indent
function SimpleFoldText() " {
    return getline(v:foldstart).' '
endfunction " }
set foldtext=SimpleFoldText()       " Custom fold text function (cleaner than default)

" iabs
iab _p <?php  if (!defined('BASEPATH')) exit('No direct script access allowed');
iab _c //-------------------------------------------------------------------------------
