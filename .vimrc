" Plugins (vim-plug)
call plug#begin()

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

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

" Highlight the current line and column
set cursorline

" Show tabs, spaces and eol
set list listchars=tab:➞\ \,multispace:·,trail:·,eol:$
