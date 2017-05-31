let mapleader=","
" Fixing character search commands.
noremap \ ,

nnoremap <silent> <leader>2 :nohlsearch<CR>

nnoremap <leader>3 :w !diff % -<CR>

nnoremap <leader>q :qa<CR>

nnoremap <leader>j :Goyo<CR>

nnoremap <leader>gb :Gblame<CR>

nnoremap <leader>m :silent make\|redraw!\|cc<CR>

nnoremap <leader>e :Explore<CR>

nnoremap <leader>d :20Lexplore<CR>
