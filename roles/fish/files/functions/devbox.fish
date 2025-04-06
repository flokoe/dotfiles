function dbox-add --wraps='devbox global add' --description 'alias dbox-add=devbox global add'
  devbox global add $argv
end

function dbox-publish --description 'Add package and publish to GitHub'
  if not dbox-diff
    echo -e "\nRemote and local devbox are not in sync."
    read -P "Pull before pushing new config? (yN): " pull

    if string match -q "y" $pull
      echo ""
      dbox-pull
      echo ""
    end
  end

  dbox-add $argv && devbox global push git@github.com:flokoe/devbox.git
end

function dbox-pull --description 'Pull devbox config from GitHub'
  devbox global pull git@github.com:flokoe/devbox.git
end

function dbox-update --wraps='devbox global update' --description 'alias dbox-update=devbox global update'
  devbox global update $argv
end

function dbox-diff --description 'Diff remote and local devbox config'
  delta -s (devbox global list | cut -d" " -f2 | sort | psub -s "-local") (curl -sSfL https://raw.githubusercontent.com/flokoe/devbox/refs/heads/main/devbox.json | jq -r .packages[] | sort | psub -s "-remote")
end
