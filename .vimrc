" Line numbers.
set number  

" Proper backspace behavior.
set backspace=indent,eol,start  

" Shifting with >> and << is 4 spaces, tab is 4 spaces.
set sw=4
set tabstop=4
set expandtab

" Info on current cursor position: line, column, file %.
set ruler

" Automatic basic indenting for any filetype.
set autoindent

" Highlight search matches, show matches as typing.
set hlsearch
set incsearch

" Syntax highlighting.
syntax on

" Save the file with sudo.
cmap w!! w !sudo tee > /dev/null % && echo "Written '%' with sudo." 

" Use bash as shell instead of fish.
set shell=/bin/bash

