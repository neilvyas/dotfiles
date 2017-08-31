let mapleader=","
let maplocalleader=","

" Fixing character search commands.
noremap \ ,

nnoremap <silent> <leader>2 :nohlsearch<CR>

nnoremap <leader>3 :w !diff % -<CR>

nnoremap <leader>4 :IndentLinesToggle<CR>

nnoremap <leader>q :qa<CR>

nnoremap <leader>j :Goyo 120<CR>:set nu<CR>

nnoremap <leader>gb :Gblame<CR>

nnoremap <leader>m :silent make\|redraw!\|cc<CR>

nnoremap <leader>e :Explore<CR>

nnoremap <leader>d :20Lexplore<CR>
