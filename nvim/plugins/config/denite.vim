call denite#custom#option('default', 'prompt', '->')

" Never search these paths.
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])


" Define shortcuts to certain sources.
nnoremap <C-c> :Denite change<CR>
nnoremap <C-l> :Denite line<CR>

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

" Make these sources interactive, i.e. start at a Denite prompt.
" This is awesome but often far too slow.
" call denite#custom#source('grep', 'args', ['', '', '!'])
call denite#custom#source('grep/git', 'args', ['', '', '!'])


" Adjust mappings for the prompt.
call denite#custom#map(
            \ 'insert',
            \ '<C-j>',
            \ '<denite:move_to_next_line>',
            \ 'noremap'
            \)
call denite#custom#map(
            \ 'insert',
            \ '<C-k>',
            \ '<denite:move_to_previous_line>',
            \ 'noremap'
            \)

call denite#custom#map(
            \ 'insert',
            \ '<C-e>',
            \ '<denite:leave_mode>',
            \ 'noremap'
            \)
call denite#custom#map(
            \ 'insert',
            \ '<Esc>',
            \ '<denite:enter_mode:normal>',
            \ 'noremap'
            \)
