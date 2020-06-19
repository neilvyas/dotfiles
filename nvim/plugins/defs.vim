set runtimepath+=~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim
let s:bundle_dir = expand('~/.config/nvim/bundle')
let s:plugin_dir = s:bundle_dir . '/repos/github.com'


if dein#load_state(s:bundle_dir)
    call dein#begin(s:bundle_dir)

    " Infrastructural stuff.
    call dein#add(s:plugin_dir . '/Shougo/dein.vim')
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

    " Visual information.
    call dein#add('altercation/vim-colors-solarized')
    call dein#add('mhinz/vim-startify')
    call dein#add('itchyny/lightline.vim')
    call dein#add('kshenoy/vim-signature')
    call dein#add('ntpeters/vim-better-whitespace')
    call dein#add('Yggdroot/indentLine')
    call dein#add('junegunn/limelight.vim')

    " Better vanilla features.
    call dein#add('tpope/vim-unimpaired')
    call dein#add('tmhedberg/SimpylFold')

    " Paredification.
    " The building of vim into an editor that understands more than text.

    " Better text objects.
    call dein#add('kien/rainbow_parentheses.vim')
    call dein#add('Raimondi/delimitMate')
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-commentary')
    call dein#add('tpope/vim-abolish')

    call dein#add('w0rp/ale')
    call dein#add('maximbaz/lightline-ale')

    call dein#add('neomake/neomake')

    " These are like additional modes for vim.
    call dein#add('jceb/vim-orgmode')
    call dein#add('junegunn/goyo.vim')

    " Completion.
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neosnippet')
    call dein#add('Shougo/neco-syntax')

    call dein#add('zchee/deoplete-jedi')

    " Explorers.
    call dein#add('Shougo/denite.nvim')
    call dein#add('Shougo/neoyank.vim')

    call dein#add('rbgrouleff/bclose.vim')
    call dein#add('tpope/vim-vinegar')

    " Interop with other tools, e.g. VCS
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-rhubarb')

    " Code formatting.
    call dein#add('Chiel92/vim-autoformat')
    call dein#add('fisadev/vim-isort')

    " Language plugins.
    " call dein#add('autozimu/LanguageClient-neovim')
    call dein#add('LnL7/vim-nix')
    " NB: can't get this to work properly in all-the-things. deoplete-jedi
    " works nicely though, so I just need to factor out the jedi-server from
    " there.
    " Disabled for now since it messes with deoplete.
    " call dein#add('davidhalter/jedi-vim')
    " call dein#add('leanprover/lean.vim')
    " call dein#add('parsonsmatt/intero-neovim')

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
helptags ALL

filetype plugin indent on
