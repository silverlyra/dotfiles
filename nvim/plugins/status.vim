" Status line
scriptencoding utf-8

Plug 'itchyny/lightline.vim'

let g:lightline = {
  \   'colorscheme': 'one',
  \   'active': {
  \     'left': [ [ 'mode', 'paste' ], [ 'gitbranch' ], [ 'readonly', 'filename' ] ],
  \     'right': [ [ 'percent' ], [ 'lineinfo' ], ['filetype'], [ 'lint_err', 'lint_warn' ] ]
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
ℹ︎
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
