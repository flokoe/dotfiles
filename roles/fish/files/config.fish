# Commands to run in interactive sessions can go here
if status is-interactive
    # Disable greeting on startup
    set -U fish_greeting

    # Set important variables
    set -gx EDITOR vim

    starship init fish | source
end
