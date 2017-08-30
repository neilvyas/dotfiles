set -g DOTFILES_HOME ~/dotfiles

set -gx TERM "xterm-256color"

if pip show virtualfish > /dev/null
    eval (python -m virtualfish)
end

source $DOTFILES_HOME/fish/aliases.fish
source $DOTFILES_HOME/fish/pyenv.fish
source $DOTFILES_HOME/fish/sensitive.fish

eval $DOTFILES_HOME/fish/nix_fish_env 2>/dev/null
