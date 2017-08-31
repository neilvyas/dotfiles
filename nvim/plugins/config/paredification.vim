let g:LanguageClient_serverCommands = {
    \ 'python': ['/Users/neilvyas/.pyenv/versions/3.4.4/envs/neovim3/bin/pyls'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>r :call LanguageClient_textDocument_rename()<CR>


au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound


let g:delimitMate_smart_matchpairs = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_jump_expansion = 1
let g:delimitMate_balance_matchpairs = 1

let delimitMate_nesting_quotes = ['"','`']  " For multi-line string literals and code fences.


let g:neomake_python_enabled_makers = ['pep8', 'pylint']


augroup org_change_mappings
  au!
  au filetype org call Change_org_mappings()
augroup END
function! Change_org_mappings()
  let maplocalleader=<Space>
  nmap <buffer> nj m}
  nmap <buffer> nk m{
endfunction

let g:org_todo_keywords = [
  \ ['TODO(t)', '|', 'DONE(d)'],
  \ ['BACKLOG(b)', 'CONTEXT(c)', 'SPEC(s)', 'FEEDBACK(f)', '|', 'ACCEPTED(a)', 'VOID(v)'],
  \ ]
