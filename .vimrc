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
set undodir=~/.config/vim/undodir
set undofile
set incsearch
set hlsearch
set scrolloff=15
set relativenumber
set laststatus=2
set noshowmode
set t_Co=256
set noignorecase
set clipboard=unnamed
set termguicolors
set wildmenu
set wildmode=longest:full,full


" Plugins Installed
call plug#begin('~/.vim/plugged')
Plug 'sainnhe/gruvbox-material'
Plug 'matze/vim-move'
Plug 'romainl/vim-cool'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-vinegar'
Plug 'machakann/vim-highlightedyank'
call plug#end()

" vim-move config
let g:move_key_modifier = 'C'
let g:move_key_modifier_visualmode = 'C'

" Gruvbox material config
set background=dark
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material
" Lightline configuration
let g:lightline = {
      \ 'colorscheme': 'gruvbox_material',
      \ }

" Highlight region on yank
let g:highlightedyank_highlight_duration = 100
highlight HighlightedyankRegion cterm=reverse gui=reverse

" My own remaps
" esc in insert mode
inoremap kj <esc>
inoremap jk <esc>

" Scroll page up and down and recenter with zz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
