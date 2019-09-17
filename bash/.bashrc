# This is the .bashrc of Florian Köhler
# https://github.com/flokoe/dotfiles

# This file is read by (non-) interactive non-login shells of bash.

# If not running interactively, don't do anything
case "$-" in
    *i*) ;;
      *) return ;;
esac

# Load everything from `.bash_profile` if it exists
[[ -r $HOME/.bash_profile && -s $HOME/.bash_profile ]] && source "$HOME/.bash_profile"
