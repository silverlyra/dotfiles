" File tree

Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

augroup nerdtree
  autocmd!
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTreeToggle' | endif
augroup END

nnoremap <leader>T :NERDTreeToggle
nnoremap <leader>w :NERDTreeFind
