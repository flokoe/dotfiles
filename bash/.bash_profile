# This is the .bash_profile of Florian Köhler
# https://github.com/flokoe/dotfiles

# This file is read by (non-) interactive login shells of bash.
# If `.bash_profile` doesn't exist it tries to red `.profile`.

# Load standard configuration from `.profile`
[[ -r $HOME/.profile && -s $HOME/.profile ]] && source "$HOME/.profile"

# Load the shell dotfiles, and then some:
# * ~/.dotfiles/bash/_inc/path.bash can be used to extend `$PATH`.
# * ~/.dotfiles/bash/_inc/local.bash can be used for other settings you don’t want to commit.
for file in ~/.dotfiles/bash/_inc/{path,prompt,exports,aliases,functions,local}.bash; do
	[[ -r $file && -f $file && -s $file ]] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Do not autocomplete when accidentally pressing Tab on an empty line.
#shopt -s no_empty_cmd_completion

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Enable alias expansion even for in interactive shells
shopt -s expand_aliases

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh

# Add `killall` tab completion for common apps
complete -o "nospace" -W "thunderbird" killall;
