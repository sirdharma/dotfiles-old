" .vimrc by Francois
" Thanks to Opera, Bombela and Hotgloupi

" Syntax highlighting
if has("syntax")
  syntax on         " Syntax highlighting enables Vim to show parts of the text in another font or color.
endif

" Global options
set nocompatible    " This option has the effect of making Vim behave in a more useful way.
set number          " Print the line number in front of each line.
set background=dark " Vim will try to use colors that look good on a dark background.
set ruler           " Show the line and column number of the cursor position, separated by a comma.
set wildmenu        " Command-line completion operates in an enhanced mode.
set showmode        " If in Insert, Replace or Visual mode put a message on the last line.
set showcmd         " Show (partial) command in the last line of the screen.
set mouse=a         " Enable the use of the mouse.

" Color scheme (http://blog.infinitered.com/entries/show/8)
colorscheme ir_black

" Trailing whitespaces
highlight WhitespaceEOL ctermbg=red guibg=red
let m = matchadd("WhitespaceEOL", "\\s\\+$", 2)
autocmd BufEnter * match WhitespaceEOL /\s\+$/

" 80 columns limit
"highlight OverflowEOL ctermbg=red guibg=red
"let o = matchadd("OverflowEOL", ".\\%>80v", 1)
"autocmd BufEnter * match OverflowEOL /.\%>81v/