"
" .vimrc by François
" Thanks to Opera, Bombela and Hotgloupi
"

" Global options
    set nocompatible                " Not Vi-compatible
    set backspace=indent,eol,start  " Fix backspace
    set mouse=a                     " Enable the use of the mouse

" Bells
    set novisualbell    " No visual bell
    set noerrorbells    " No error bells

" Search
    set ignorecase  " Case-insensitive search
    set incsearch   " Do incremental searching
    set hlsearch    " Highlight search

" Tabs
    set expandtab       " Expand tabs into spaces
    set tabstop=8       " Number of spaces of tab character
    set softtabstop=4   " Number of spaces of soft tab
    set shiftwidth=4    " Number of spaces to (auto)indent
    set shiftround      " Round spaces when identing

" Last lines
    set wildmenu        " Command-line completion operates in an enhanced mode
"   set ruler           " Show the line and column number of the cursor position, separated by a comma
    set showmode        " Show mode in the last line
    set showcmd         " Show (partial) command in the last line
    set showmatch       " Show the match

" Status line
    set laststatus=2                                            " Always show statusline
"   set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P            " Default statusline
    set statusline=%<%F\ %h%m%r[%{&ff}]%y%=%-14.(%l,%c%V%)\ %P  " Status line

" Indenting
    set autoindent  " Auto indentation
    set smartindent " Smart indentation
    set cindent     " C indentation

" Editor
    set number                      " Print the line number in front of each line.
    set cursorline                  " Highlight current line
    set list                        " Show tabs and trailing whitespace
    set listchars=tab:»·,trail:·    " Symbols for tabs and trailing whitespace
    set nostartofline               " Don't jump to first character when paging
    set scrolloff=10                " Keep 10 lines (top/bottom) for scope

" Temp files
    set noswapfile      " No swap files
    set nobackup        " No backup files
"   set nowritebackup   " No backup while overwriting file

" Color scheme
    set background=dark     " Dark background.
    colorscheme ir_dark     " (http://blog.infinitered.com/entries/show/8)

" Filetype
    filetype plugin indent on    " Detection: on, plugin: on, indent: on

" Syntax
    syntax on   " Syntax highlighting

" Highlight trailing whitespace
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
    highlight TrailingWhitespace ctermbg=red guibg=red
    match TrailingWhitespace /\s\+$/
    autocmd BufWinEnter * match TrailingWhitespace /\s\+$/
    autocmd InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match TrailingWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()

" Remove trailing whitespace when saving
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
    autocmd FileType c,cpp,zsh,vim,tex autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" Arduino
" http://www.vim.org/scripts/script.php?script_id=2654
    autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
