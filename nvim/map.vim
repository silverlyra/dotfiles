"
" Key mappings
"

scriptencoding utf-8

" customize
nnoremap <leader>ev :e! $MYVIMRC<cr>

" save
nmap <leader>, :w<cr>

" up, dowm
noremap j gj
noremap k gk

" clear hlsearch
noremap <silent> <space> :noh<cr>:call clearmatches()<cr>

" clipboard
map <leader>p "*p
map <leader>y "*y
map D "_d

" remove trailing whitespace
nmap <leader><space> :%s/\s\+$<cr>

" heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" clever window movements
map <silent> <C-h> :call functions#WinMove('h')<cr>
map <silent> <C-j> :call functions#WinMove('j')<cr>
map <silent> <C-k> :call functions#WinMove('k')<cr>
map <silent> <C-l> :call functions#WinMove('l')<cr>

" rg the last search
noremap <silent> <leader>? :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

" Textmate-style indentation
vnoremap <leader>[ <gv
vnoremap <leader>] >gv
nmap <leader>[ <<
nmap <leader>] >>

" switch between current and last buffer
nmap <leader>. <c-^>

" enable . command in visual mode
vnoremap . :normal .<cr>

" insert the directory of the current buffer in command line mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" sudo to write
cmap w!! w !sudo tee % >/dev/null<Paste>

" error navigation
nnoremap ˚ :lnext<cr>zvzz
nnoremap ¬ :lprevious<cr>zvzz
inoremap ˚ <esc>:lnext<cr>zvzz
inoremap ¬ <esc>:lprevious<cr>zvzz
nnoremap <m-Down> :cnext<cr>zvzz
nnoremap <m-Left> :cc<cr>zvzz
nnoremap <m-Up> :cprevious<cr>zvzz

" visual mode */#
vnoremap * :<C-u>call functions#VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call functions#VSetSearch()<CR>??<CR><c-o>
