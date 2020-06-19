set -g DOTFILES_HOME ~/dotfiles

set -gx TERM "xterm-256color"

source $DOTFILES_HOME/fish/aliases.fish

# Source my path munging first so that other scripts doing path munging won't
# have their changes appear twice.
source $DOTFILES_HOME/fish/path.fish

source $DOTFILES_HOME/fish/pyenv.fish
source $DOTFILES_HOME/fish/sensitive.fish

eval $DOTFILES_HOME/fish/nix_fish_env 2>/dev/null
