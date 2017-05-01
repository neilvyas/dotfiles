set runtimepath+=~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim
let s:bundle_dir = expand('~/.config/nvim/bundle')
let s:plugin_dir = s:bundle_dir . '/repos/github.com'

if dein#load_state(s:bundle_dir)
    call dein#begin(s:bundle_dir)
    call dein#add(s:plugin_dir . '/Shougo/dein.vim')

    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neosnippet')

    call dein#end()
    call dein#save_state()
endif

" Check for uninstalled plugins and then fetch and install them.
if dein#check_install()
  call dein#install()
endif

" Delete removed plugins.
call map(dein#check_clean(), "delete(v:val, 'rf')")

helptags ALL
