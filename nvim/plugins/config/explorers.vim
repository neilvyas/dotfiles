" Exploring hierarchical things.
augroup netrw_change_mappings
    au!
    au filetype netrw call Change_netrw_mappings()
augroup END
function! Change_netrw_mappings()
    nmap <buffer> <Space> mf
endfunction


" Exploring searches. I use denite for this.
call denite#custom#option('default', 'prompt', '->')

" Never search these paths.
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])


" Define shortcuts to certain sources.
nnoremap <C-c> :Denite change<CR>
nnoremap <C-b> :Denite buffer<CR>
nnoremap <C-SPACE> :Denite documentSymbol<CR>  " from language-server-protocol

" Use git features if possible.
call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
\ ['git', 'ls-files', '-co', '--exclude-standard'])
nnoremap <silent> <C-p> :<C-u>Denite
\ `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`
\ -no-quit
\ <CR>

call denite#custom#alias('source', 'grep/git', 'grep')
call denite#custom#var('grep/git', 'command', ['git', '--no-pager', 'grep'])
call denite#custom#var('grep/git', 'recursive_opts', [])
call denite#custom#var('grep/git', 'final_opts', [])
call denite#custom#var('grep/git', 'separator', [])
call denite#custom#var('grep/git', 'default_opts', ['-nH'])
nnoremap <silent> <C-s> :<C-u>Denite
\ `finddir('.git', ';') != '' ? 'grep/git' : 'grep'`
\ <CR>

" Only make the grep/git source interactive, as it's fast enough to not choke.
" TODO investigate making this toggleable or adding an initial delay?
" TODO figure out how this interacts with <C-R><C-W> insertion?
call denite#custom#source('grep/git', 'args', ['', '', '!'])


" Adjust mappings for the prompt.
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')

call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('insert', '<C-e>', '<denite:quit>', 'noremap')
call denite#custom#map('normal', '<C-e>', '<denite:quit>', 'noremap')
