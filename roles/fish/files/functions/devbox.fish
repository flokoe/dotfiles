function dbox-add --wraps='devbox global add' --description 'alias dbox-add=devbox global add'
  devbox global add $argv
end

function dbox-publish --description 'Add package and publish to GitHub'
  dbox-add $argv && devbox global push git@github.com:flokoe/devbox.git
end

function dbox-pull --description 'Pull devbox config from GitHub'
  devbox global pull git@github.com:flokoe/devbox.git
end

function dbox-update --wraps='devbox global update' --description 'alias dbox-update=devbox global update'
  devbox global update $argv
end
