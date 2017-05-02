set runtimepath+=~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim
let s:bundle_dir = expand('~/.config/nvim/bundle')
let s:plugin_dir = s:bundle_dir . '/repos/github.com'

if dein#load_state(s:bundle_dir)
    call dein#begin(s:bundle_dir)
    call dein#add(s:plugin_dir . '/Shougo/dein.vim')
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

    call dein#add('altercation/vim-colors-solarized')
    call dein#add('mhinz/vim-startify')
    call dein#add('itchyny/lightline.vim')
    call dein#add('kshenoy/vim-signature')

    call dein#add('kien/rainbow_parentheses.vim')
    call dein#add('Raimondi/delimitMate')
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-commentary')

    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neco-syntax')
    call dein#add('Shougo/neosnippet')

    call dein#add('Shougo/denite.nvim')

    " Language plugins.
    call dein#add('LnL7/vim-nix')

    call dein#end()
    call dein#save_state()
endif

" Check for uninstalled plugins and then fetch and install them.
if dein#check_install()
  call dein#install()
endif

" Delete removed plugins.
call map(dein#check_clean(), "delete(v:val, 'rf')")

" Nix breaks this, because (which nvim)/share/... is write-protected.
" helptags ALL

filetype plugin indent on
