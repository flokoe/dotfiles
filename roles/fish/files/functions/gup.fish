function gup --wraps='git push' --description 'alias gup=git push'
  git push $argv
end
