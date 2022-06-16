if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx EDITOR vim

    starship init fish | source
end
