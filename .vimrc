execute pathogen#infect()
syntax enable
filetype plugin indent on

" Strange backspace shenanigans.
set backspace=indent,eol,start

colorscheme solarized
set background=light
set number
set colorcolumn=101
set showcmd
set cursorline
set wildmenu
set lazyredraw
set showmatch " highlight matching [({})]

let mapleader=","

set incsearch " instant search.
set hlsearch  " highlight results
nnoremap <leader><space> :nohlsearch<CR>

set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za " space un/folds.
set foldmethod=indent

"tabline
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-B> :bprev<CR>

" move vertically by visual lines.
nnoremap j gj
nnoremap k gk

" move to beginning/end of line.
nnoremap B ^
nnoremap E $

" highlight last inserted text
"nnoremap gV `[v`]

set tabstop=2
set softtabstop=2
set expandtab " tabs are spaces.
set shiftwidth=2 " for visual indentation.

" Move around splits more naturally.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Reverse order of lines.
:command -range Rev :<line1>,<line2>!tail -r

" for closing the scratch window automatically, e.g. with python
" documentation.
autocmd CompleteDone * pclose

" PLUGIN CONFIGS.
"
" VimRoom, for writing prose.
let g:vimroom_sidebar_height=0
let g:vimroom_width=100

" Setting mark column color.
highlight SignColumn ctermbg=7

" Unite bindings.
nnoremap <C-p> :Unite file_rec/async<CR>
nnoremap <space>/ :Unite grep:.<CR>
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<CR>
nnoremap <space>s :Unite -quick-match buffer<CR>

" NeoComplete bindings.
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define Dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default':    '',
  \ 'scala':      $HOME.'/.vim/bundle/vim-scala/dict/scala.dict',
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
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" Vim Powerline.
set laststatus=2
source $POWERLINE_BINDINGS/vim/plugin/powerline.vim

" NERDTree.
map <leader>n :NERDTreeToggle<CR>
" Function for automatically closing if this is the only buffer left.
function! s:CloseIfOnlyControlWinLeft()
  if winnr("$") != 1
    return
  endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix'
    q
  endif
endfunction
augroup CloseIfOnlyControlWinLeft
  au!
  au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END
