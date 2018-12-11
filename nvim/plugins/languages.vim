scriptencoding utf-8

"
" HTML
"

Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript.jsx']}
let g:user_emmet_settings = {
\  'javascript.jsx': {
\      'extends': 'jsx',
\  },
\}

Plug 'gregsexton/MatchTag', { 'for': 'html' }

Plug 'othree/html5.vim', { 'for': 'html' }
let g:event_handler_attributes_complete = 0
let g:rdfa_attributes_complete = 0
let g:microdata_attributes_complete = 0
let g:atia_attributes_complete = 0

"
" JavaScript
"

Plug 'pangloss/vim-javascript', { 'for': [ 'javascript', 'javascript.jsx', 'html' ] }
let g:javascript_plugin_flow = 1
let g:javascript_conceal_arrow_function       = '⇒'

Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx', 'javascript'] }
Plug 'jxnblk/vim-mdx-js'

"
" TypeScript
"

Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'mhartington/nvim-typescript', { 'for': 'typescript', 'do': './install.sh'  }

"
" Markdown
"

Plug 'tpope/vim-markdown', { 'for': 'markdown'  }

"
" Sass
"
Plug 'cakebaker/scss-syntax.vim'

"
" JSON
"
Plug 'elzr/vim-json', { 'for': 'json' }
let g:vim_json_syntax_conceal = 0

"
" Java
"
Plug 'ObserverOfTime/ncm2-jc2', {'for': ['java', 'jsp']}
Plug 'artur-shaik/vim-javacomplete2', {'for': ['java', 'jsp']}

"
" Rust
"
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

"
" Terraform
"
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
"
" VimScript
"

Plug 'Shougo/neco-vim'
Plug 'ncm2/ncm2-vim'
