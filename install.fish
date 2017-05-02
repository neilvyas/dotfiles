set DOTFILES_HOME ~/dotfiles

#Wire up tmux properly.
ln -s $DOTFILES_HOME/tmux/base.tmux.conf ~/.tmux.conf

# Don't overwrite stuff put in place by fisherman.
ln -s $DOTFILES_HOME/fish/aliases.fish ~/.config/fish/aliases.fish
ln -s $DOTFILES_HOME/fish/functions/* ~/.config/fish/functions

ln -s $DOTFILES_HOME/nvim ~/.config
