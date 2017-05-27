let g:deoplete#enable_at_startup = 1

augroup initialize_completion
    au!
    au VimEnter * call deoplete#initialize()
augroup END


let g:neosnippet#disable_runtime_snippets = {'_' : 1} 
let g:neosnippet#snippets_directory = [
            \ '~/.config/nvim/snippets']
call deoplete#custom#set('neosnippet', 'rank', 1000)


" Press tab to bring up autocompletion.
let g:deoplete#disable_auto_complete = 0
let g:deoplete#max_list = 10  " 100 is an insane default.
let g:deoplete#auto_complete_delay = 50
imap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Use space to make a selection and close the popup.
" I'd love to use <CR> but it messes with delimitMate's auto-indentation for
" some reason, and my terminal doesn't differentiate <CR>, <C-CR>, <S-CR>.
imap <expr> <C-SPACE> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\ : pumvisible() ? deoplete#mappings#close_popup() : delimitMate#JumpAny()

" Fix for jumping over placeholders for neosnippet
smap <expr> <TAB> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_jump)"
\: "\<TAB>"


" setting up specific sources
call deoplete#custom#set(
            \ "dictionary",
            \ "dict__dictionary",
            \ "~/dotfiles/data/sorted_english_words.txt")
