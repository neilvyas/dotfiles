set completeopt=menu  " No scratch windows for completion, please.


let g:deoplete#enable_at_startup = 1

" NB: This breaks deoplete for some reason after updating on 1/20/2018.
" augroup initialize_completion
"     au!
"     au VimEnter * call deoplete#initialize()
" augroup END


let g:neosnippet#disable_runtime_snippets = {'_' : 1}
let g:neosnippet#snippets_directory = [
            \ '~/.config/nvim/snippets']


" Press tab to bring up autocompletion.
let g:deoplete#disable_auto_complete = 0
let g:deoplete#max_list = 20  " 100 is an insane default.
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
call deoplete#custom#source(
            \ "dictionary",
            \ "dict__dictionary",
            \ "~/dotfiles/data/sorted_english_words.txt")


call deoplete#custom#source('neosnippet', 'rank', 1000)
call deoplete#custom#source('jedi', 'rank', 999)

let g:deoplete#sources#jedi#extra_path = [
            \ "/Users/neilvyas/code/all-the-things/actions",
            \ "/Users/neilvyas/code/all-the-things/admins",
            \ "/Users/neilvyas/code/all-the-things/affirm-cli",
            \ "/Users/neilvyas/code/all-the-things/affirm-frontend",
            \ "/Users/neilvyas/code/all-the-things/affirm-users",
            \ "/Users/neilvyas/code/all-the-things/agents",
            \ "/Users/neilvyas/code/all-the-things/aliases",
            \ "/Users/neilvyas/code/all-the-things/analytics_context",
            \ "/Users/neilvyas/code/all-the-things/anywhere",
            \ "/Users/neilvyas/code/all-the-things/applications",
            \ "/Users/neilvyas/code/all-the-things/ari-service",
            \ "/Users/neilvyas/code/all-the-things/auth",
            \ "/Users/neilvyas/code/all-the-things/bank_api",
            \ "/Users/neilvyas/code/all-the-things/bank_ledger",
            \ "/Users/neilvyas/code/all-the-things/bank_loan_sales",
            \ "/Users/neilvyas/code/all-the-things/bank_portal",
            \ "/Users/neilvyas/code/all-the-things/bankroutingdb",
            \ "/Users/neilvyas/code/all-the-things/batch",
            \ "/Users/neilvyas/code/all-the-things/blueprints",
            \ "/Users/neilvyas/code/all-the-things/build-tools",
            \ "/Users/neilvyas/code/all-the-things/business_logic",
            \ "/Users/neilvyas/code/all-the-things/capabilities",
            \ "/Users/neilvyas/code/all-the-things/cards",
            \ "/Users/neilvyas/code/all-the-things/charlotte",
            \ "/Users/neilvyas/code/all-the-things/charlotte4",
            \ "/Users/neilvyas/code/all-the-things/counters",
            \ "/Users/neilvyas/code/all-the-things/crm",
            \ "/Users/neilvyas/code/all-the-things/crypto",
            \ "/Users/neilvyas/code/all-the-things/data_migration",
            \ "/Users/neilvyas/code/all-the-things/debugapp",
            \ "/Users/neilvyas/code/all-the-things/employees",
            \ "/Users/neilvyas/code/all-the-things/event_bus",
            \ "/Users/neilvyas/code/all-the-things/experiments",
            \ "/Users/neilvyas/code/all-the-things/ext_services",
            \ "/Users/neilvyas/code/all-the-things/fpna",
            \ "/Users/neilvyas/code/all-the-things/fquid",
            \ "/Users/neilvyas/code/all-the-things/furnishing",
            \ "/Users/neilvyas/code/all-the-things/http",
            \ "/Users/neilvyas/code/all-the-things/identifier_events",
            \ "/Users/neilvyas/code/all-the-things/infra",
            \ "/Users/neilvyas/code/all-the-things/issuer",
            \ "/Users/neilvyas/code/all-the-things/login-flows",
            \ "/Users/neilvyas/code/all-the-things/login-sessions",
            \ "/Users/neilvyas/code/all-the-things/marketing",
            \ "/Users/neilvyas/code/all-the-things/merchants",
            \ "/Users/neilvyas/code/all-the-things/merchants-analytics",
            \ "/Users/neilvyas/code/all-the-things/messages",
            \ "/Users/neilvyas/code/all-the-things/metadata",
            \ "/Users/neilvyas/code/all-the-things/ml",
            \ "/Users/neilvyas/code/all-the-things/models",
            \ "/Users/neilvyas/code/all-the-things/nosql_models",
            \ "/Users/neilvyas/code/all-the-things/orchestration",
            \ "/Users/neilvyas/code/all-the-things/pfm",
            \ "/Users/neilvyas/code/all-the-things/policy",
            \ "/Users/neilvyas/code/all-the-things/policy_store",
            \ "/Users/neilvyas/code/all-the-things/policy_tracking",
            \ "/Users/neilvyas/code/all-the-things/preferences",
            \ "/Users/neilvyas/code/all-the-things/promos",
            \ "/Users/neilvyas/code/all-the-things/protobufs",
            \ "/Users/neilvyas/code/all-the-things/reconciliation",
            \ "/Users/neilvyas/code/all-the-things/repayment",
            \ "/Users/neilvyas/code/all-the-things/reports",
            \ "/Users/neilvyas/code/all-the-things/risk",
            \ "/Users/neilvyas/code/all-the-things/risk_offline",
            \ "/Users/neilvyas/code/all-the-things/roles",
            \ "/Users/neilvyas/code/all-the-things/search",
            \ "/Users/neilvyas/code/all-the-things/session",
            \ "/Users/neilvyas/code/all-the-things/signals",
            \ "/Users/neilvyas/code/all-the-things/sql-store",
            \ "/Users/neilvyas/code/all-the-things/testing-toolbox",
            \ "/Users/neilvyas/code/all-the-things/tokens",
            \ "/Users/neilvyas/code/all-the-things/toolbox",
            \ "/Users/neilvyas/code/all-the-things/tracking",
            \ "/Users/neilvyas/code/all-the-things/traintrack",
            \ "/Users/neilvyas/code/all-the-things/trainyard",
            \ "/Users/neilvyas/code/all-the-things/unity",
            \ "/Users/neilvyas/code/all-the-things/virtual_cards",
            \ ]


" NB: jedi-vim is disabled for now.
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#goto_assignments_command = '<leader>a'  " dynamically done for ft=python.
" let g:jedi#goto_definitions_command = '<leader>d'
" let g:jedi#use_tabs_not_buffers = 0  " current default is 1.
" let g:jedi#rename_command = '<leader>gR'
" let g:jedi#usages_command = '<leader>gu'
" let g:jedi#completions_enabled = 0
" let g:jedi#smart_auto_mappings = 1
