#!/bin/bash

export DOTFILES_HOME="/Users/neilvyas/dotfiles"

# TODO: think about wiring this up with `nix-home` instead of this installer
# (I don't think it's really any different)

#Wire up tmux properly.
ln -sf $DOTFILES_HOME/tmux/base.tmux.conf $HOME/.tmux.conf

# Don't overwrite stuff put in place by fisherman.
ln -sf $DOTFILES_HOME/fish/config.fish $HOME/.config/fish/config.fish
ln -sf $DOTFILES_HOME/fish/functions/* $HOME/.config/fish/functions

fisher bass

ln -sf $DOTFILES_HOME/nvim $HOME/.config

ln -sf $DOTFILES_HOME/haskell/conf.ghci $HOME/.ghci
