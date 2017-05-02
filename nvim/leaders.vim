let mapleader=","
" Fixing character search commands.
noremap \ ,

" <Leader>1: Toggle between paste mode
nnoremap <silent> <leader>1 :set paste!<CR>

" <Leader>2: Turn off search result highlighting
nnoremap <silent> <leader>2 :nohlsearch<CR>

" <Leader>3: Diff against file on disk.
nnoremap <leader>3 :w !diff % -<CR>

" <Leader>5: Toggle VCS-aware functionality.
nnoremap <leader>5 :call VcsAwareSearch()<CR>

" <Leader>q: Quit all, very useful in vimdiff
nnoremap <leader>q :qa<CR>

" <Leader>g: Fugitive shortcuts
nnoremap <leader>gb :Gblame<CR>

" <Leader>m: Make in background with quickfix window.
nnoremap <leader>m :silent make\|redraw!\|cc<CR>

" <Leader>e: open netrw window.
nnoremap <leader>e :Explore<CR>
