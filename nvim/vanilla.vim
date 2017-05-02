if &compatible
  set nocompatible
endif

filetype plugin indent on
set hidden

syntax enable
set number
set showmatch
set nrformats= " treat all numerals as decimal.
set virtualedit=onemore

" Emphasize current splits.
set colorcolumn=101 cul " on startup, since below is on WinEnter.
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set colorcolumn=101 cul
    autocmd WinLeave * set colorcolumn=0  nocul
augroup END

" Lower the delay of mode switching.
set timeout timeoutlen=200 ttimeoutlen=1

set showcmd
set wildmenu
" Since <C-f> is my tmux prefix.
set cedit=<C-g>
set history=200

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

set incsearch
set hlsearch
set smartcase

set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Move vertically by visual lines.
nnoremap j gj
nnoremap k gk

set mouse=a

set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

command WQ wq
command Wq wq
command W w
command Q q

nnoremap ; :
