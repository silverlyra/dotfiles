"
" welcome home
"

scriptencoding utf-8

" Vim settings

runtime settings/basic.vim
runtime settings/completion.vim
runtime settings/editing.vim
runtime settings/filetypes.vim

" Plugin management

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  augroup bootstrap
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

call plug#begin('~/.local/share/nvim/plugged')

runtime plugins/color.vim
runtime plugins/status.vim
runtime plugins/editing.vim
runtime plugins/git.vim
runtime plugins/completion.vim
runtime plugins/navigation.vim
runtime plugins/linting.vim
runtime plugins/tree.vim
runtime plugins/languages.vim

call plug#end()

call ncm2#register_source({'name' : 'terraform',
            \ 'priority': 9,
            \ 'subscope_enable': 1,
            \ 'scope': ['hcl', 'terraform'],
            \ 'mark': 'tf',
            \ 'word_pattern': '[\w\-]+',
            \ 'complete_pattern': '[^ *\t"{=$]\w*',
            \ 'on_complete': ['ncm2#on_complete#omni', 'terraformcomplete#Complete'],
            \ })

" Mappings
runtime map.vim

colorscheme onedark

syntax on
filetype plugin indent on
