alias sl="pmset sleepnow"

#python
alias py="python" 
#incredible interpreter.
alias bp="bpython"

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
alias gl="git log"
alias gs="git status"
alias gcm="git commit -m"
alias gcf="git commit --fixup"
alias gap="git add -p"
alias gd="git diff"
alias gri="git rebase -i"
