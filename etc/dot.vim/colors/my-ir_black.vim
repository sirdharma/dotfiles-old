" Maintainer:	François Pradel <francois.pradel@gmail.com>
" URL:			http://vim.wikia.com/wiki/Create_a_color_scheme_based_on_another

"These lines are suggested to be at the top of every colorscheme
hi clear
if exists("syntax_on")
  syntax reset
endif

"Load the 'base' colorscheme - the one you want to alter
runtime colors/ir_black.vim

"Override the name of the base colorscheme with the name of this custom one
let g:colors_name = "my-ir_black"

"Clear the colors for any items that you don't like
"hi clear SpecialKey
"hi clear CursorLine

"Set up your new & improved colors
"hi SpecialKey	guifg=#808080	guibg=NONE		gui=NONE		ctermfg=darkgray	ctermbg=NONE		cterm=NONE
"hi CursorLine	guifg=NONE		guibg=#121212	gui=NONE		ctermfg=NONE		ctermbg=darkgray	cterm=bold
