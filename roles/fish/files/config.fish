# MANAGED BY ANSIBLE, DO NOT TOUCH

fish_add_path ~/bin
fish_add_path ~/.local/bin

# Commands to run in interactive sessions can go here
if status is-interactive
    # Disable greeting on startup
    set -U fish_greeting

    # Set important variables
    set -gx EDITOR nvim

    # Enable colors for ls in kitty
    dircolors -c | source

    starship init fish | source

    direnv hook fish | source

    abbr -a -- gcop 'gco production'
    abbr -a -- gcom 'gco main'
    abbr -a -- gcob 'gco -b'
    abbr -a -- gsh 'git stash'
    abbr -a -- gshp 'git stash pop'
    abbr -a -- gshl 'git stash list'
    abbr -a -- grbk 'grb --keep-base'
    abbr -a -- grbik 'grbi --keep-base'
end
