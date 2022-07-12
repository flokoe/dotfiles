# MANAGED BY ANSIBLE, DO NOT TOUCH

function hosts --wraps='sudoedit /etc/hosts' --description 'alias hosts=sudoedit /etc/hosts'
  sudoedit /etc/hosts $argv;
end
