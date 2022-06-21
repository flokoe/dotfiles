# Commands to run in interactive sessions can go here
if status is-interactive
    set -gx EDITOR vim

    starship init fish | source
end
