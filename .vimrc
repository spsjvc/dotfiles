" Plugins (vim-plug)
call plug#begin()

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Custom statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

nnoremap <C-p> :GFiles<Cr>
nnoremap <C-f> :Rg<Cr>

" Show hybrid line numbers (relative line numbers, except the current line which is absolute)
set number relativenumber

" Use spaces instead of tabs
set expandtab

" Change tab size to 4
set tabstop=4

" Turn on syntax highlighting
syntax on

" Change encoding to UTF-8
set encoding=utf-8

" Don't show mode in status bar
set noshowmode

" Highlight the current line
set cursorline

" Show leading spaces and eol
set list listchars=lead:·,eol:↲
