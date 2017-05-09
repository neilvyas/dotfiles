#!/bin/bash

source $stdenv/setup

echo $src
echo $dotfiles_home
echo $home

#Wire up tmux properly.
ln -sf $dotfiles_home/tmux/base.tmux.conf $home/.tmux.conf

# Don't overwrite stuff put in place by fisherman.
ln -sf $dotfiles_home/fish/functions/* $home/.config/fish/functions

ln -sf $dotfiles_home/nvim $home/.config

ln -sf $dotfiles_home/haskell/conf.ghci $home/.ghci
