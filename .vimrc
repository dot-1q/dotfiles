syntax on

set noerrorbells
set shiftwidth=4
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set number
set nowrap
set noswapfile
set nobackup
set undodir=~/.config/vim/undodir
set undofile
set incsearch
set hlsearch
set relativenumber
set laststatus=2
set noshowmode
set t_Co=256
set noignorecase
set scrolloff=15
set clipboard=unnamed
set wildmenu
set wildmode=longest:full,full

" Automatically download Vim Plugg
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins Installed
call plug#begin('~/.vim/plugged')
Plug 'sainnhe/gruvbox-material' " Vim Theme
Plug 'matze/vim-move' " Move line(s) with Ctrl + h/j/k/l
Plug 'romainl/vim-cool' " Disable hlsearch when done
Plug 'itchyny/lightline.vim' " Vim status line theme
Plug 'tpope/vim-vinegar' " File explorer inside VIM (netrw but better)
Plug 'tpope/vim-commentary' " Comment line(s) with `gc` or `gcc`
Plug 'machakann/vim-highlightedyank' " Highlight yanked selection
Plug 'vimpostor/vim-lumen' " Sync background with terminal colors
call plug#end()

" vim-move config
let g:move_key_modifier = 'C'
let g:move_key_modifier_visualmode = 'C'

" Highlight region on yank
let g:highlightedyank_highlight_duration = 100
highlight HighlightedyankRegion cterm=reverse gui=reverse

" My own remaps
" esc in insert mode
inoremap kj <esc>
inoremap jk <esc>
set timeoutlen=250

" Scroll page up and down and recenter with zz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Change cursor to line or block depending on insert or normal mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Gruvbox material config
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1

colorscheme gruvbox-material
" Lightline configuration
let g:lightline = {
      \ 'colorscheme': 'gruvbox_material',
      \ }

" Reset cursor style when leaving Vim
autocmd VimLeave * set guicursor=a:hor20

" Comment next line if Ubuntu and uncomment the background one
set termguicolors
