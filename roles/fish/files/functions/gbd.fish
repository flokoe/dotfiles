function gbd --wraps='git branch -D' --description 'alias gbd=git branch -D'
  git branch -D $argv
end
