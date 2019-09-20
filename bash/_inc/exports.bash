#!/usr/bin/env bash

# Set TERM variable to use up to 256 different colors
# This is bad practice, see
# https://sanctum.geek.nz/arabesque/term-strings/
# https://gist.github.com/XVilka/8346728
#export TERM='xterm-256color'

# Define XDG default config directory
#export XDG_CONFIG_HOME="$HOME/.config";

# Make vim the default editor
export EDITOR="$(which vim)";

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';
# Ignore ls and clear commands
export HISTIGNORE="ls:ll:la:clear:cls";

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
#export MANPAGER='less -X';

# Better yaourt colors
# Arch Linux specific
# Stolen from manjaro .bashrc
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"
