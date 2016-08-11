function __gitstashpullstashpop() {
  status=$(git status)

  if [[ ${status} == *"Changes to be committed"* ]] ||
    [[ ${status} == *"Changes not staged for commit"* ]] ||
    [[ ${status} == *"Changes to be committed"* ]]; then
    git stash -u
    git pull
    git stash pop
  else
    git pull
  fi
}

function __gitStatusOrGit() {
  if [[ $# -eq 0 ]]; then
    git status
  else
    git $@
  fi
}

function __contextual_rm() {
  git rm -f $@ 2>/dev/null || rm -f $@
}

function __contextual_mv() {
  mv -f $@ 2>/dev/null || mv -f $@
}

function __contextual_reset() {
  git status 2>/dev/null >/dev/null && git reset $@ || reset $@
}

function __contextual_rebase() {
  git status 2>/dev/null >/dev/null && git rebase $@ || rebase $@
}

function __contextual_diff() {
  git status 2>/dev/null >/dev/null && git diff $@ || diff $@
}

function __contextual_c() {
  if [[ $# -eq 0 ]]; then
    cd ~/dns/provisioning
  elif [[ $1 == "." ]]; then
    git commit .
  else
    git checkout $@
  fi
}


alias gradlew=./gradlew
alias g=__gitStatusOrGit
alias p=__gitstashpullstashpop
alias c=__contextual_c
alias b="./gradlew clean build"
alias r=git\ reset\ --hard\ HEAD

alias init=git\ init
alias clone=git\ clone
alias add=git\ add
alias reset=__contextual_reset
alias rm=__contextual_rm
alias mv=__contextual_mv
alias log=git\ log
alias show=git\ show
alias branch=git\ branch
alias checkout=git\ checkout
alias commit=git\ commit
alias diff=__contextual_diff
alias merge=git\ merge
alias rebase=__contextual_rebase
alias tag=git\ tag
alias fetch=git\ fetch
alias pull=git\ pull
alias push=git\ push
alias status=git\ status
alias stash=git\ stash
alias ggrep=git\ grep
alias show-branch=git\ show-branch
alias master=git\ checkout\ master