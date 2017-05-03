# Set this locally for install purposes. It gets exported by config.fish.
set DOTFILES_HOME ~/dotfiles

#Wire up tmux properly.
ln -s $DOTFILES_HOME/tmux/base.tmux.conf ~/.tmux.conf

# Don't overwrite stuff put in place by fisherman.
ln -s $DOTFILES_HOME/fish/functions/* ~/.config/fish/functions

ln -s $DOTFILES_HOME/nvim ~/.config

ln -s $DOTFILES_HOME/haskell/conf.ghci ~/.ghci
