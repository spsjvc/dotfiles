" Plugins (vim-plug)
call plug#begin()

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Custom statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Gruvbox theme
Plug 'morhetz/gruvbox'

call plug#end()

nnoremap <C-p> :GFiles<Cr>
nnoremap <C-f> :Rg<Cr>

" Turn on syntax highlighting
syntax on

" Show hybrid line numbers (relative line numbers, except the current line which is absolute)
set number relativenumber

" Use spaces instead of tabs
set expandtab

" Change tab size to 4
set tabstop=4

" Change encoding to UTF-8
set encoding=utf-8

" Don't show mode in status bar
set noshowmode

" Highlight the current line and column
set cursorline cursorcolumn

" Show leading spaces and eol
set list listchars=lead:·,eol:↲

" Customize gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'

" Enable gruvbox
autocmd vimenter * ++nested colorscheme gruvbox
