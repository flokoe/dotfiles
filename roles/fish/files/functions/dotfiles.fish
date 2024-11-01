function dotfiles --description 'alias dotfiles=just ~/Projects/dotfiles/update'
  argparse p/pull -- $argv

  if set -ql _flag_pull
    just ~/Projects/dotfiles/update $argv
  else
    just ~/Projects/dotfiles/install $argv
  end
end
