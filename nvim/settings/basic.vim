"
" Basic vim options
"
"
scriptencoding utf-8

set modelines=2                     " Check 2 lines of files for commands
set autoindent                      " Continue previous line's indent by default
set noshowmode                      " Show mode in last line
set showcmd                         " Show visual selection size in last line
set hidden                          " Don't unload abandoned buffers
set visualbell                      " Use the visual bell instead of beeping
set cursorline                      " Highlight the entire line the cursor is on
set ruler                           " Show cursor position
set backspace=indent,eol,start      " Sane edge case behavior for Backspace key
set relativenumber                  " Use relative line numbering
set laststatus=2                    " Show a status line for all windows always
set history=1000                    " Size of command and search pattern history
set undofile                        " Store undo history persistently on disk
set undoreload=10000                " Save the whole buffer for undo
set list                            " Show invisible characters
set listchars=tab:→\ ,eol:¬,trail:·,extends:❯,precedes:❮
set shell=/usr/local/bin/zsh        " Override default shell
set matchtime=3                     " Auto-highlight '%' match for 0.3s
set showbreak=↪                     " Use this character to indicate wrapping
set splitbelow                      " Default horizontal splits to appear below
set splitright                      " Default vertical splits to appear at right
set fillchars=diff:⣿                " Fill deleted diff lines in clearly
set autoread                        " Pick up external modifications
set autowrite                       " Write modified files on certain commands
set shiftround                      " Round indents to multiple of shiftwidth
set title                           " Update the (terminal) window title
set linebreak                       " Break lines at opportune characters
set nojoinspaces                    " Don't use two spaces between sentences (gq)
set dictionary=/usr/share/dict/words

if has('mouse')
  set mouse=a
endif
if has('termguicolors')
  set termguicolors
endif

let mapleader = ','
let maplocalleader = '\\'

augroup basic
    au!

    au FocusLost * :silent! wall
    au VimResized * :wincmd =
augroup END
