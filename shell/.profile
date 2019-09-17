# This is the .profile of Florian Köhler
# https://github.com/flokoe/dotfiles

# This file is read by (non-) interactive login shells.
# `sh` will always read this file, so be aware of posix compatibility.
# bash will read this file if `.bash_profile` doesn't exist.

# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
