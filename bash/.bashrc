# This is the .bashrc of Florian Köhler
# https://github.com/flokoe/dotfiles

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

## GENERAL ##
export TERM='xterm-256color'
export PS1='\[\033[01;32m\]\u\[\033[01;34m\]@\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
export EDITOR="/usr/bin/vim"

## HISTROY ##
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
HISTIGNORE="ls:clear"
shopt -s histappend

## ALIASES ##
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


