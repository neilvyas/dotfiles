#Source Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
bindkey -v

export KEYTIMEOUT=1
ZSH_THEME="neil"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# Neil - have to enable this because it ruins tmux otherwise.
 DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git history history-substring-search brew)

# User configuration

export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:/Users/neil/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:$HOME/.cabal/bin/"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
# Source paths for dotfiles.
source $HOME/dotfiles/paths.sh
# Don't look for these.
source $HOME/sensitive.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR=vim
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
export PATH="/$HOME/.jenv/bin:/usr/texbin:/usr/local/sbin:$PATH"
eval "$(jenv init -)"
alias sl="pmset sleepnow"

#python
alias py="python" 
#incredible interpreter.
alias bp="bpython"

#terminal stuff.
bindkey -v
alias show="pygmentize"

#UT stuff.
function dir() { finger $1@directory.utexas.edu }

#git stuff.
alias gbv="git log --oneline --abbrev-commit --all --graph --decorate --color"

#LaTeX stuff.
export TEXINPUTS=".:~/latex:"

#for rendering writings.
render () {
        d=$(date +"%A, %B %e, %Y")
        b=$(echo $1 | cut -f 1 -d '.')
        h="<center><small><i>$d</i></small></center>
  <hr>"
        cp $1 $1.bak
        echo $h | cat - $1.bak > /tmp/out && mv /tmp/out $1.bak
        pandoc -s -t html -c c.css -o $b.html $1.bak --self-contained
        rm $1.bak
}

