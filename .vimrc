" vim:fdm=marker

" Package management. {{{

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Appearances.
NeoBundle 'noahfrederick/vim-noctu' " uses terminal colorscheme, so only 16 colors.
" NeoBundle 'morhetz/gruvbox'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'ap/vim-buftabline'
NeoBundle 'mhinz/vim-startify'

" Infrastructural stuff.
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'rstacruz/vim-fastunite'
NeoBundle 'Shougo/neoyank.vim' " adds yank history as a source.
NeoBundle 'Konfekt/FastFold'
NeoBundle 'ervandew/supertab'

" Better vim navigation.
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-commentary'

" IDE type stuff.
NeoBundle 'SirVer/ultisnips'
NeoBundle 'klen/python-mode'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'Raimondi/delimitMate'

" Prose.
NeoBundle 'reedes/vim-pencil'

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

call neobundle#end()

" }}}
" Editor settings. {{{

syntax enable
filetype plugin indent on

" Strange backspace shenanigans.
set backspace=indent,eol,start

" FIXME: perhaps this should be more sophisticated.
set t_Co=256

colorscheme noctu
set background=dark
" let g:gruvbox_contrast_dark="medium"
"remove the pipes in the vertical split separator.
set fillchars+=vert:\ 

set number
set showcmd " show cmd in bottom 
set wildmenu " matching in commands
set lazyredraw
set showmatch " highlight matching [({})]
set nrformats= " treat all numerals as decimal.
" Give one virtual space at end of line
set virtualedit=onemore

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Lower the delay of mode switching.
set timeout timeoutlen=200 ttimeoutlen=1

" Since <C-f> is my tmux prefix.
set cedit=<C-g>
set history=200

" Emphasize current splits.
set colorcolumn=101 cul " on startup, since below is on WinEnter.
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set colorcolumn=101 cul
    autocmd WinLeave * set colorcolumn=0  nocul
augroup END

" still need 256 colors, assumes black background
highlight ColorColumn ctermbg=233 " Grey7
highlight CursorLine ctermbg=233 " Grey7

" Setting mark column color.
highlight SignColumn ctermbg=0

set incsearch " instant search.
set hlsearch  " highlight results
set smartcase " not caps-sensitive unless there's a capital letter.
nnoremap <leader><space> :nohlsearch<CR>
highlight Search cterm=bold,underline ctermfg=yellow ctermbg=NONE

highlight Comment cterm=NONE " italic for iTerm.

set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za " space un/folds.
set foldmethod=indent

" cross-session paste via writing to tmp file.
" TODO: check out easy paste to work around this
vmap <leader>y :w! /tmp/vitmp<CR>                                                                   
nmap <leader>p :r! cat /tmp/vitmp<CR>

"tabline
" TODO: may be able to obviate this with unite 
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-B> :bprev<CR>

" move vertically by visual lines.
nnoremap j gj
nnoremap k gk

"scrollwheel works as expected
set mouse=a

"default split opening locations.
set splitbelow
set splitright

" Move around splits more naturally.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" for closing the scratch window automatically, e.g. with python
" documentation.
autocmd CompleteDone * pclose

" }}}
" Prose. {{{

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
augroup END

" }}}
" Leader commands. {{{

let mapleader=","

" <Leader>1: Toggle between paste mode
nnoremap <silent> <Leader>1 :set paste!<cr>

" <Leader>q: Quit all, very useful in vimdiff
nnoremap <Leader>q :qa<cr>

" <Leader>g: Fugitive shortcuts

" <Leader>m: Make in background with quickfix window.
nnoremap <leader>m :silent make\|redraw!\|cc<CR>

" }}}
" FileType stuff. {{{
set tabstop=2
set softtabstop=2
set expandtab " tabs are spaces.
set shiftwidth=2 " for visual indentation.

au Filetype python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=100

au Filetype javascript,html,css setlocal tabstop=2 softtabstop=2 shiftwidth=2

" Syntax highlighting for odd extensions
au BufNewFile,BufRead *.cls set filetype=tex
au Filetype plaintex,tex,latex setlocal tabstop=2 softtabstop=2 shiftwidth=2 textwidth=100 

" }}}
" PLUGIN CONFIGS. {{{

" Startify.
" NOTE: You can replace this using Unite.
autocmd User Startified setlocal colorcolumn=0 cul

function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction
" Have a nice 'vim' logo on startup :)
let g:startify_custom_header = s:filter_header([
        \ '                           ',
        \ '         __                ',
        \ ' __  __ /\_\    ___ ___    ',
        \ '/\ \/\ \\/\ \ /'' __` __`\ ',
        \ '\ \ \_/ |\ \ \/\ \/\ \/\ \ ',
        \ ' \ \___/  \ \_\ \_\ \_\ \_\',
        \ '  \/__/    \/_/\/_/\/_/\/_/',
        \ ])

" RainbowParentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound

" python stuff.
let g:pymode_rope = 0
" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
"" Auto check on save
let g:pymode_lint_write = 1
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ }
set noshowmode
let g:tmuxline_powerline_separators = 0


" Unite bindings.
nnoremap <C-p> :Unite file_rec/async -start-insert -no-split<CR>
nnoremap <space>/ :Unite grep:. -no-split<CR>
nnoremap <C-y> :Unite history/yank<CR> " masks scroll up motion.
nnoremap <C-e> :Unite -quick-match buffer -no-split<CR>
" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" supertab direction fixes
let g:SuperTabDefaultCompletionType = "<c-n>"

" ultiSnips bindings.
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"

let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<CR>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'

" NeoComplete bindings.
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define Dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default':    '',
  \ }

" Tab completion.
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
      endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() :"\<CR>"

" Omnicompletion.
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:neocomplete#force_omni_input_patterns.python =
\ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" }}}
