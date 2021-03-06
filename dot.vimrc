"
" .vimrc by François
" Thanks to Opera and Bombela
"

" Variables
let hostname = substitute(system('hostname'), '\n', '', '')

" Pathogen
execute pathogen#infect()

" Filetype
filetype plugin indent on   " Detection: on, plugin: on, indent: on

" Syntax
syntax enable   " Syntax highlighting

" Color scheme
set background=dark         " Dark background.
colorscheme solarized

" Global options
set nocompatible                " Not Vi-compatible
set backspace=indent,eol,start  " Fix backspace
set mouse=a                     " Enable the use of the mouse

" Bells
set noerrorbells    " No error bells for error messages
set visualbell      " Visual bell instead of beeping

" Search
set ignorecase  " Case-insensitive search
set smartcase   " Case-sensitive if search contains upper case characters
set incsearch   " Do incremental searching
set hlsearch    " Highlight search

" Tabs
set tabstop=4       " Number of spaces of tab character
set softtabstop=4   " Number of spaces of soft tab
set shiftwidth=4    " Number of spaces to (auto)indent
set expandtab       " Expand tabs into spaces
set shiftround      " Round spaces when identing

" Last lines
set wildmenu    " Command-line completion operates in an enhanced mode
"set ruler      " Show the line and column number of the cursor position, separated by a comma
set showmode    " Show mode in the last line
set showcmd     " Show (partial) command in the last line
set showmatch   " Show the match

" Status line
set laststatus=2                                            " Always show statusline
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P           " Default statusline
set statusline=%<%F\ %h%m%r[%{&ff}]%y%=%-14.(%l,%c%V%)\ %P  " Status line

" Indenting
set autoindent  " Auto indentation

" Editor
set number                          " Print the line number in front of each line.
set nowrap                          " Lines will not wrap
if hostname == "kahurangi"
    set list                        " Show tabs and trailing whitespace
    set listchars=tab:>-,trail:.    " Symbols for tabs and trailing whitespace
else
    set list                        " Show tabs and trailing whitespace
    set listchars=tab:»·,trail:·    " Symbols for tabs and trailing whitespace
    set cursorline                  " Highlight current line
endif
set nostartofline                   " Don't jump to first character when paging
set scrolloff=5                     " Keep 5 lines (top/bottom) for scope

" Temporary files
set noswapfile      " No swap files
set nobackup        " No backup files
"set nowritebackup  " No backup while overwriting file

" Tags in $HOME
set tags+=tags;$HOME

" Highlight long lines
" http://vim.wikia.com/wiki/Highlight_long_lines
"autocmd FileType c,cpp,objc,tex autocmd BufWinEnter <buffer> let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
autocmd FileType c,cpp,objc,tex set colorcolumn=81

" Highlight unwanted spaces
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Remove trailing whitespace when saving
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
autocmd FileType apache,c,conf,cpp,make,objc,python,sh,tex,vim,yaml,zsh autocmd BufWritePre <buffer> :%s/\s\+$//e
