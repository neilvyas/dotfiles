set -g DOTFILES_HOME ~/dotfiles

source $DOTFILES_HOME/fish/aliases.fish
source $DOTFILES_HOME/fish/pyenv.fish

eval $DOTFILES_HOME/fish/nix_fish_env 2>/dev/null
