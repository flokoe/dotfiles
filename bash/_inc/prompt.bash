#!/usr/bin/env bash

# Change the window title of X terminals
# Stolen from the manjaro .bashrc
case ${TERM} in
  xterm*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
    ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

# Prompt Features:
#   - display current branch
#   - show if repository is dirty
#   - show if unpulled/unpushed commits exists
#   - show how many commits ahead/behind

# Check if working dir is dirty
# If yes, return yellow escape code, else return green escape code
_git-dirty-color () {
  if [[ $(git status --porcelain 2> /dev/null) ]] ; then
    DIRTYCOLOR="\e[33m"
  else
    DIRTYCOLOR="\e[32m"
  fi
}

#
# Based on https://gist.github.com/vitalk/8639831
# _git-check-commits () {
#   git for-each-ref --format='%(refname:short) %(upstream:short)' refs/heads | \
# while read local upstream; do

#     # Use master if upstream branch is empty
#     [ -z $upstream ] && upstream=master

#     ahead=`git rev-list ${upstream}..${local} --count`
#     behind=`git rev-list ${local}..${upstream} --count`

#     if [[ $local == $branch ]]; then
#         asterisk=*
#     else
#         asterisk=' '
#     fi

#     # Show asterisk before current branch
#     echo -n "$asterisk $local"

#     # Does this branch is ahead or behind upstream branch?
#     if [[ $ahead -ne 0 && $behind -ne 0 ]]; then
#         echo -n " ($ahead ahead and $behind behind $upstream)"
#     elif [[ $ahead -ne 0 ]]; then
#         echo -n " ($ahead ahead $upstream)"
#     elif [[ $behind -ne 0 ]]; then
#         echo -n " ($behind behind $upstream)"
#     fi

#     # Newline
#     echo

#   done;

#   echo -n " "
# }

# If current dir is git repository get branch name
# check if dirty and check status of commits and return everthing
_check-git-repo () {
  if git rev-parse --is-inside-work-tree &> /dev/null; then
    _git-dirty-color

    CURRENTBRANCHNAME=$(git branch --show-current --no-color 2> /dev/null)

    echo -e "${DIRTYCOLOR}${CURRENTBRANCHNAME} "
  fi
}

# Export PS1 prompt
export PS1="\[\e[01;34m\]\w \$(_check-git-repo)\[\e[00;35m\]❯\[\e[00m\] "
