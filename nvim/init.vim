scriptencoding utf-8

" General {{{

filetype plugin indent on

" Basic options {{{

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
set listchars=tab:→\ ,eol:¬,extends:❯,precedes:❮
set shell=/usr/local/bin/zsh        " Override default shell
set matchtime=3                     " Auto-highlight '%' match for 0.3s
set showbreak=↪                     " Use this character to indicate wrapping
set splitbelow                      " Default horizontal splits to appear below
set splitright                      " Default vertical splits to appear at right
set fillchars=diff:⣿                " Fill deleted diff lines in clearly
set autowrite                       " Write modified files on certain commands
set shiftround                      " Round indents to multiple of shiftwidth
set title                           " Update the (terminal) window title
set linebreak                       " Break lines at opportune characters
set nojoinspaces                    " Don't use two spaces between sentences (gq)
set dictionary=/usr/share/dict/words

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" }}}

" Completion settings {{{

set completeopt=noinsert,menuone,noselect

" Wildmenu completion

set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=TAGS                             " Ctags
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code

set wildignore+=node_modules                     " that Node, Node Node Node
set wildignore+=npm-debug.log

set wildignore+=*.orig                           " Merge resolution files

set wildignore+=build

" }}}

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*"

" Tabs, spaces, wrapping

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set textwidth=80
set formatoptions+=tcrqnb
set formatoptions-=o
set colorcolumn=+1

" Leader

let mapleader = ','
let maplocalleader = '\\'

" Search

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault

set scrolloff=3
set sidescroll=1
set sidescrolloff=10

set virtualedit+=block

if has('mouse')
  set mouse=a
endif
if has('termguicolors')
  set termguicolors
endif

" }}}

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  augroup bootstrap
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

call plug#begin('~/.local/share/nvim/plugged')

" Color scheme {{{

syntax on
set background=dark
Plug 'joshdick/onedark.vim'

" }}}

" Status line {{{

Plug 'itchyny/lightline.vim'

let g:lightline = {
  \   'colorscheme': 'one',
  \   'active': {
  \     'left': [ [ 'mode', 'paste' ], [ 'gitbranch' ], [ 'readonly' ] ],
  \     'right': [ [ 'percent' ], [ 'lineinfo' ], [ 'lint_err', 'lint_warn' ] ]
  \   },
  \   'component_expand': {
  \     'lint_warn': 'LightlineLinterWarnings',
  \     'lint_err': 'LightlineLinterErrors'
  \   },
  \   'component_type': {
  \     'readonly': 'warning',
  \     'lint_warn': 'warning',
  \     'lint_err': 'error'
  \   },
  \   'component_function': {
  \       'filename': 'LightlineFileName',
  \       'gitbranch': 'LightlineGitBranch'
  \   },
  \   'tabline': {
  \       'left': [ [ 'tabs' ] ],
  \       'right': [ [ 'close' ] ]
  \   },
  \   'tab': {
  \       'active': [ 'filename', 'modified' ],
  \       'inactive': [ 'filename', 'modified' ],
  \   },
  \   'separator': { 'left': '', 'right': '' },
  \   'subseparator': { 'left': '', 'right': '' }
  \ }

function! LightlineFileName() abort
    let filename = winwidth(0) > 70 ? expand('%') : expand('%:t')
    if filename =~# 'NERD_tree'
        return ''
    endif
    let modified = &modified ? ' +' : ''
    return fnamemodify(filename, ':~:.') . modified
endfunction

function! LightlineLinterWarnings() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : '⚠ ' . printf('%d', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    return l:counts.total == 0 ? '' : '✕ ' . printf('%d', all_errors)
endfunction

function! LightlineLinterOk() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    return l:counts.total == 0 ? 'OK' : ''
endfunction

function! LightlineGitBranch()
    return (exists('*fugitive#head') ? fugitive#head() : '')
endfunction

function! LightlineUpdate()
    call lightline#update()
endfunction

augroup alestatus
    autocmd User ALELintPost call LightlineUpdate()
augroup end

" }}}

" General editing {{{

  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'moll/vim-bbye' | nmap <leader>b :Bdelete<cr>
  Plug 'sickill/vim-pasta'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'wincent/ferret'
  Plug 'wincent/loupe'

" }}}

" Git {{{

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

Plug 'mhinz/vim-signify'
let g:signify_vcs_list = [ 'git' ]

" }}}

" Completion {{{

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'junegunn/fzf'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ }
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

augroup ncm2
  autocmd BufEnter  *  call ncm2#enable_for_buffer()
augroup END

" }}}

" Navigation {{{

Plug 'cloudhead/neovim-fuzzy'
nnoremap <silent> <leader>t :FuzzyOpen<CR>
nnoremap <silent> <leader>g :FuzzyGrep<CR>

" }}}

" Linting {{{

Plug 'w0rp/ale'
let g:ale_set_highlights = 0
let g:ale_change_sign_column_color = 0
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✕'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_error_str = '✕'
let g:ale_echo_msg_warning_str = '⚠'
let g:ale_echo_msg_format = '%severity% %s% [%linter%% code%]'

" }}}

" File tree {{{

Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

augroup nerdtree
  autocmd!
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTreeToggle' | endif
augroup END

" }}}

call plug#end()

colorscheme onedark

" vim:set foldmethod=marker foldlevel=0
