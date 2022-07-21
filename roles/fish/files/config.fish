# MANAGED BY ANSIBLE, DO NOT TOUCH

# Commands to run in interactive sessions can go here
if status is-interactive
    # Disable greeting on startup
    set -U fish_greeting

    # Set important variables
    set -gx EDITOR vim

    # Enable colors for ls in kitty
    dircolors -c | source

    starship init fish | source
end
