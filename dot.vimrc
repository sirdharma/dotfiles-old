"
" .vimrc by François
" Thanks to Opera, Bombela and Hotgloupi
"

" Variables
let hostname = substitute(system('hostname'), '\n', '', '')

" Global options
set nocompatible                " Not Vi-compatible
set backspace=indent,eol,start  " Fix backspace
set mouse=a                     " Enable the use of the mouse
"set ttyfast                     " Indicates a fast terminal connection

" Bells
set noerrorbells  " No error bells for error messages
set visualbell    " Visual bell instead of beeping

" Search
set ignorecase  " Case-insensitive search
set smartcase   " Case-sensitive if search contains upper case characters
set incsearch   " Do incremental searching
"set nohlsearch  " No highlight search
set hlsearch    " Highlight search

" Tabs
"set tabstop=8    " Number of spaces of tab character
set softtabstop=2 " Number of spaces of soft tab
set shiftwidth=2  " Number of spaces to (auto)indent
set expandtab     " Expand tabs into spaces
set shiftround    " Round spaces when identing

" Last lines
set wildmenu  " Command-line completion operates in an enhanced mode
"set ruler    " Show the line and column number of the cursor position, separated by a comma
set showmode  " Show mode in the last line
set showcmd   " Show (partial) command in the last line
set showmatch " Show the match

" Status line
set laststatus=2                                            " Always show statusline
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P            " Default statusline
set statusline=%<%F\ %h%m%r[%{&ff}]%y%=%-14.(%l,%c%V%)\ %P  " Status line

" Indenting
set autoindent  " Auto indentation
"set smartindent " Smart indentation
"set cindent     " C indentation

" Editor
set number                      " Print the line number in front of each line.
set nowrap                      " Lines will not wrap
if hostname == "yellowstone"
  set list                      " Show tabs and trailing whitespace
  set listchars=tab:>-,trail:.  " Symbols for tabs and trailing whitespace
else
  set list                      " Show tabs and trailing whitespace
  set listchars=tab:»·,trail:·  " Symbols for tabs and trailing whitespace
  set cursorline                " Highlight current line
endif
set nostartofline               " Don't jump to first character when paging
set scrolloff=5                 " Keep 5 lines (top/bottom) for scope

" Temporary files
set noswapfile    " No swap files
set nobackup      " No backup files
"set nowritebackup " No backup while overwriting file

" Color scheme
set background=dark       " Dark background.
"colorscheme ir_dark       " (http://blog.infinitered.com/entries/show/8)
"colorscheme wombat        " http://www.vim.org/scripts/script.php?script_id=1778
set t_Co=256              " 256 colors in terminal
colorscheme wombat256mod  " http://www.vim.org/scripts/script.php?script_id=2465

" Filetype
filetype plugin indent on " Detection: on, plugin: on, indent: on

" Syntax
syntax on " Syntax highlighting

" Tags
set tags+=tags;$HOME

" Highlight long lines
" http://vim.wikia.com/wiki/Highlight_long_lines
"au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
autocmd FileType c,cpp,objc,tex autocmd BufWinEnter <buffer> let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"autocmd FileType c,cpp,objc,tex set columns=80

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
"autocmd FileType apache,c,conf,cpp,make,objc,python,sh,tex,vim,yaml,zsh autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
autocmd FileType apache,c,conf,cpp,make,objc,python,sh,tex,vim,yaml,zsh autocmd BufWritePre <buffer> :%s/\s\+$//e

" Project-specific .vimrc
" http://vim.runpaint.org/basics/configuring-vim/
set exrc
set secure

" Latex suite
" http://vim-latex.sourceforge.net/documentation/latex-suite/recommended-settings.html
"
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex can be
" called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you search in
" a singe file. This will confuse Latex-Suite. Set your grep program to always
" generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded. The
" following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
