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

" Use git features if possible.
call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
\ ['git', 'ls-files', '-co', '--exclude-standard'])

nnoremap <silent> <C-p> :<C-u>Denite
\ `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`
\ -no-quit
\ <CR>

if executable('rg')
    call denite#custom#var('grep', 'command', ['rg'])
    call denite#custom#var('grep', 'default_opts',
      \ ['--vimgrep', '--no-heading', '--smart-case'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
    " Make grep command interactive. ripgrep is performant enough to enable this.
    " NB: interactivity seems to ruin highlighting, so I've turned it off.
    " It also means the initial search string is specific, which increases
    " performance.
    "call denite#custom#source('grep', 'args', ['.', '', '!'])
endif

" NB: It doesn't seem like "-auto-preview" comes at any cost, and it's super
" cool, so I'm keeping it in.
" NB: "-auto-preview" definitely has a steep cost.
nnoremap <silent> <C-s> :<C-u>Denite grep<CR>
" This is analagous to "find uses of."
" By default, load results into quickfix, since there will likely be more than
" one. Since this starts in normal mode, use "*" to mark all candidates, then
" "<CR>" to load into quickfix.
" NB: This is not meant to replace "jump to definition" and doesn't work well
" for scalar responses.
nnoremap <silent> <C-d> :<C-u>DeniteCursorWord grep
\ -mode=normal
\ -default-action=quickfix
\ <CR>



" Adjust mappings for the prompt.
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')

call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('insert', '<C-e>', '<denite:quit>', 'noremap')
call denite#custom#map('normal', '<C-e>', '<denite:quit>', 'noremap')
