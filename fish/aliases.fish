# vim: fdm=marker
# General terminal utilities {{{
set -U EDITOR nvim
alias vim nvim
alias nvv "nvim -u $HOME/.config/nvim/vanilla.vim"
alias nvn "nvim -u NONE"

# TODO seems there's a race issue with set-default-shell, so this variable is unset, and we depend on it.
alias tmux "env DOTFILES_HOME=$DOTFILES_HOME tmux"
alias st "tree -L 4"

alias ev "nvim $DOTFILES_HOME/nvim/ -c 'cd $DOTFILES_HOME'"
alias ea "nvim $DOTFILES_HOME/fish/aliases.fish -c 'cd $DOTFILES_HOME'"
alias sc "source $HOME/.config/fish/config.fish"

alias sl "pmset sleepnow"
# }}}

# Python {{{
alias py "python" 
alias bp "bpython"

function pyclean
    find . -type f -name "*.py[co]" -delete
    find . -type d -name "__pycache__" -delete
end
# }}}

# Git {{{
alias gbv "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gbvv "git branch -vv"
alias gl "git log"
alias gs "git status -s"
alias gcm "git commit -m"
alias gcf "git commit --fixup"
alias gcfh "git commit --fixup HEAD~1"
alias gap "git add -p"
alias ga "git add"
alias gd "git diff"
alias gri "git rebase -i"
alias gc "git checkout"
alias gcp "git checkout -p"
alias gg "git grep"
# }}}

# Nix {{{
alias n "nix-env"
alias ns "nix-env -qaP"
alias ni "nix-env -i"
alias nb "nix-build"
alias nsh "nix-shell"
# }}}
