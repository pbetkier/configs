set nocompatible
set number
set bs=2
set sw=4
set tabstop=4
set autowrite
set expandtab

set history=50
set ruler
set ai
set cindent
"set mouse=a

set hlsearch
set background=dark
syntax on

hi Constant ctermfg = DarkRed
hi Comment ctermfg = Blue
hi LineNr ctermfg = DarkYellow
hi Statement ctermfg = DarkYellow
hi Type ctermfg = DarkGreen
hi Special ctermfg = DarkMagenta

" Author: David Maclay
" Version: 1.1
" License: GPLv2

" Description:
" I don't know for sure that something like this does not already exist in Vim,
	" but if it does, I can't find it.

	" I recal Cream having this kind of functionallity mapped to <F6>,
	" so to maintain consistency I've kept the convention.

	" This uses the current value of &cms / &commentstring to comment and uncomment code.
	" It works for ranges selected in Visual mode, or for the current line in all modes.
	" NB. Comment strings may not include '@' or '+'
	" (I don't know of any languages that use these characters).

	" Help:
	" Use <F6> to comment, and <F7> to uncomment.

	function Comment() range
	execute ':silent '.a:firstline.','.a:lastline.'s@\(^[\t, ]*\)\(\)\(..*\)@\1'.substitute(&cms,'%s.*$','','').'\3@'
	execute ':silent '.a:firstline.','.a:lastline.'s@\(..*\)\($\)@\1'.           substitute(&cms,'^.*%s','','').'@'
	endfunction
	map <silent> <F6> :call Comment()<CR>
	imap <silent> <F6> <ESC><F6>i

	function UnComment() range
	exe ':silent '.a:firstline.','.a:lastline.'s@\(^[\t, ]*\)\('.substitute(substitute(&cms,'%s.*$','',''),'\*','\\*','g').'\)@\1@'
	exe ':silent '.a:firstline.','.a:lastline.'s@'.              substitute(substitute(&cms,'^.*%s','',''),'\*','\\*','g').'$@@'
	endfunction
	map <silent> <F7> :call UnComment()<CR>
	imap <silent> <F7> <ESC><F7>i


	" P.S.
	" This command cleans up a code file.
	" It swaps 4 spaces for all tabs, and removes any trailing spaces.
	" Just use :Clean

function Clean()
	%s/\t/    /g
	%s/  *$//g
	endfunction
	com -nargs=* Clean :call Clean()<args>|noh

"zapisywanie z sudo
cmap w!! w !sudo tee > /dev/null % && echo "Written '%' with sudo." 

map <C-A> ggVG 
"zaznacz wszystko
let g:load_doxygen_syntax=1 "syntax doxygena

" Octave Syntax
augroup filetypedetect
     au! BufRead,BufNewFile *.m set filetype=octave
augroup END 

filetype plugin indent on

highlight clear SpellBad
highlight SpellBad ctermfg=DarkRed cterm=undercurl

"pathogen installer
execute pathogen#infect()
"aby background byl taki jak dla LineNr
highlight clear SignColumn
