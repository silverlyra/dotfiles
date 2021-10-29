# One-word wonders

alias b=bat
alias c=cat
alias g=git
alias l=exa
alias ll='exa -l'
alias v=nvim

alias bj='bat -l json'
alias by='bat -l yaml'

# Git aliases

alias ga='git add'
alias gaa='git add --all'
alias gau='git add --update'
alias gap='git add --patch'

alias gc='git commit'
alias gca='git commit -a'
alias gcA='git commit --amend'
alias gcAm='git commit --amend -m'
alias gam='git commit --amend -C HEAD'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gcc='git commit -m checkpoint'

alias gbb='git config --default main gitflow.branch.develop'

alias gco='git checkout'
alias gcp='git cherry-pick'

alias gd='git diff'
alias gds='git diff --staged'

alias gl="git log --pretty='format:%C(yellow)%h %C(green)%ad %Creset%s%Cblue  [%an]' --decorate --date=relative"
alias gll='gl --stat'
alias glm='gl $(gbb)..HEAD'
alias glu='gl @{upstream}..HEAD'

alias gp='git pull --rebase --no-tags'

alias gcr='git rebase -i --autosquash'
alias gcrm='gcr $(gbb)'
alias gra='git rebase --abort'
alias grc='git add --update && git rebase --continue'

alias gs='git status'

alias gsh='git show'

alias gS='git stash'
alias gSp='git stash pop'
alias gSs='git stash show'

alias gre='git reset'
alias greh='git reset HEAD'
alias gre1='git reset HEAD~'

alias gu='git push'
alias guf='git push -f'
alias guu='git push -u'
alias gut='git push -u origin $(git branch --show-current)'
