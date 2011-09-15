
" Arduino
" http://www.vim.org/scripts/script.php?script_id=2654
    autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino

" Nginx
" http://www.vim.org/scripts/script.php?script_id=1886
    au BufRead,BufNewFile /usr/local/nginx/conf/* set ft=nginx
