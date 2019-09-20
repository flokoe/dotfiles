#!/usr/bin/env bash

# Create simple alias to reload bashrc
alias reload="source ~/.bashrc"

# Good ol' clear screen command
alias cls='clear'

# Simple alias for best command fixer
alias fuck='sudo $(history -p \!\!)'

# Automatically open file or url with correct application
alias open="xdg-open"
alias o="open"

# Always use colors with grep
alias grep='grep --color=auto'

# Quick edit of hosts file
alias hosts="sudo $EDITOR /etc/hosts"

alias quit="exit"

alias rm="rm -i"

# Alias to force recursive remove
alias rr="rm -rfi"

# Use human readable sizes
alias df="df -h"
alias free="free -m"

# Trim new lines and copy to clipboard
# similar to paste -sd "" ?
alias c="tr -d '\n' | pbcopy"

# Standard directory listing/traversal
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Quick access to frequent used directories
alias dl="cd ~/Downlods"
alias pt="cd ~/Pictures"
alias dm="cd ~/Documents"
alias p="cd ~/projects"

# ls shortcuts
# Use ls with colors, group dirs first and use iso date and time
alias ls="ls -lh --color=auto --time-style=long-iso --group-directories-first"
alias la="ls -a"

# tree shortcuts
alias tree="tree -AC"
alias tree1="tree -L 1"
alias tree2="tree -L 2"
alias treed="tree -d"
alias treed1="treed -L 1"
alias treed2="treed -L 2"

# List declared aliases, functions, and paths
alias aliases="alias | sed 's/alias //; s/=.*//'"
alias functions="declare -f | grep '^[a-z].* ()' | sed 's/{$//'"
alias paths='echo -e ${PATH//:/\\n}'

# Show function
alias function="declare -f"

# git shortcuts
alias g="git"
