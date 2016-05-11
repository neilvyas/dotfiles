source ~/.zplug/zplug
zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh", nice:8

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", nice:10

zplug "themes/minimal", from:oh-my-zsh, nice:9

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

#local packages
zplug "~/dotfiles", as:plugin, use:"*.sh", from:local

# Then, source plugins and add commands to $PATH
zplug load --verbose
