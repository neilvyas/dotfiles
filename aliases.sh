#python
alias py="python" 
#incredible interpreter.
alias bp="bpython"
function pyclean () {
        find . -type f -name "*.py[co]" -delete
        find . -type d -name "__pycache__" -delete
}

#git stuff.
alias gbv="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gbvv="git branch -vv"
# `tree` with ignored files from .gitignore
alias gt='tree -C --prune -I $(cat .gitignore ~/.gitignore | egrep -v "^#.*$|^[[:space:]]*$" | tr "\\n" "|")'
alias gl="git log"
alias gs="git status -s"
alias gcm="git commit -m"
alias gcf="git commit --fixup"
alias gcfh="git commit --fixup HEAD~1"
alias gap="git add -p"
alias ga="git add"
alias gd="git diff"
alias gri="git rebase -i"
alias gc="git checkout"
alias gcp="git checkout -p"
alias gg="git grep"

# git diff commit (against previous).
function gdc () {
  git diff $1^!
}
