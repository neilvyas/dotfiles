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


let g:formatdef_yapf = "'yapf --style=/Users/neilvyas/code/.style.yapf -l '.a:firstline.'-'.a:lastline"
let g:formatters_python = ['yapf']

" Disable fallbacks for autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0


let g:ale_linters = {
\   'python': ['flake8'],
\}

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
" Show which linter is complaining.
let g:ale_echo_msg_format = '[%linter%] [%severity%] [%code%] %s'
let g:ale_echo_msg_info_str = 'I'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'

let g:ale_sign_column_always = 1
let g:ale_sign_error = '=>'
let g:ale_sign_warning = '->'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
