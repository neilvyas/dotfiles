#Source Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export KEYTIMEOUT=1
ZSH_THEME="neil"

# Uncomment the following line to disable auto-setting terminal title.
# Neil - have to enable this because it ruins tmux otherwise.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git history history-substring-search brew)

# User configuration

# Giant Clod of Paths
# TODO: Figure out which ones of these are disposable.
py27="/Library/Frameworks/Python.framework/Versions/2.7/bin"
home_bin="$HOME/bin"
usr_local_bin="/usr/local/bin" #isn't this Homebrew?
usr_local_sbin="/usr/local/sbin"
usr_bin="/usr/bin"
usr_sbin="/usr/sbin"
bin="/bin"
sbin="/sbin"
x11_bin="/opt/X11/bin"
git_bin="/usr/local/git/bin"
cabal_bin="$HOME/.cabal/bin"
jenv_bin="$HOME/.jenv/bin"
jenv_shims="$HOME/.jenv/shims"
#texbin="/usr/texbin" El Capitan breaks this location for MacTeX
texbin="/Library/TeX/texbin"
#set(['/Users/neil/.jenv/shims', '//Users/neil/.jenv/bin', '/Users/neil/.cabal/bin/', '/usr/bin', '/usr/sbin'])

paths=($py27 $home_bin $usr_local_bin $usr_local_sbin $usr_bin $usr_sbin $bin $sbin $x11_bin \
  $git_bin $cabal_bin $jenv_bin $jenv_shims $texbin)
export PATH="${paths[*]// /:}"
#for jenv manager.
eval "$(jenv init -)"
#LaTeX stuff.
export TEXINPUTS=".:~/latex:"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
# Source paths for dotfiles.
source $HOME/dotfiles/paths.sh
# Don't look for these.
source $HOME/sensitive.sh

# Preferred editor for local and remote sessions
export EDITOR=vim

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias sl="pmset sleepnow"

#python
alias py="python" 
#incredible interpreter.
alias bp="bpython"

#terminal stuff.
bindkey -v
bindkey "^?" backward-delete-char # fixes backspacing after coming out of normal mode

#UT stuff.
function dir() { finger $1@directory.utexas.edu }
#school stuff specifically
CDIR=~/Classes
alias pde="cd $CDIR/M372K"
alias eeml="cd $CDIR/EE381V_ML"
alias aas="cd $CDIR/AAS325"
alias real="cd $CDIR/M365C"
alias jazz="cd $CDIR/MUS307"
alias classes="echo 'pde eeml aas real jazz'"

#git stuff.
alias gbv="git log --oneline --abbrev-commit --all --graph --decorate --color" 
