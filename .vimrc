syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set nohlsearch
set scrolloff=10

call plug#begin('~/.vim/plugged')
Plug 'arzg/vim-colors-xcode'
" More to be added, like , file explorer and auto completion
call plug#end()

colorscheme xcodedark
