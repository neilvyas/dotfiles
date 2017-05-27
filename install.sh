#!/bin/bash

# TODO: think about wiring this up with `nix-home` instead of this installer
# (I don't think it's really any different)

#Wire up tmux properly.
ln -sf $dotfiles_home/tmux/base.tmux.conf $home/.tmux.conf

# Don't overwrite stuff put in place by fisherman.
ln -sf $dotfiles_home/fish/functions/* $home/.config/fish/functions

ln -sf $dotfiles_home/nvim $home/.config

ln -sf $dotfiles_home/haskell/conf.ghci $home/.ghci
