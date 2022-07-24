# MANAGED BY ANSIBLE, DO NOT TOUCH

function ssh --wraps='ssh' --description 'alias ssh=kitty +kitten ssh'
  kitty +kitten ssh $argv;
end
