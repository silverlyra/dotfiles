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

call astral#begin()

Plane 'ui/map'
Plane 'ui/statusline', {'colorscheme': 'one', 'tabline': 'buffers', 'tabline_close': 0}
Plane 'ui/tree', {'position': 'right', 'follow': 0}

Plane 'completion'
Plane 'find'
Plane 'git'
Plane 'make'

Plane 'lang/go', {'gocode': '~/go/bin/gocode'}
Plane 'lang/vim'

runtime plugins/color.vim
runtime plugins/editing.vim
runtime plugins/git.vim
runtime plugins/navigation.vim
runtime plugins/languages.vim

call astral#end()

" Mappings
runtime map.vim

colorscheme onedark

syntax on
filetype plugin indent on
