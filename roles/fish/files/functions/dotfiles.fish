function dotfiles --wraps='just ~/Projects/dotfiles/update' --description 'alias dotfiles=just ~/Projects/dotfiles/update'
  just ~/Projects/dotfiles/update $argv
end
