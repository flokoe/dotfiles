#!/usr/bin/env bash

set -Eeuo pipefail

tags="${1:-all}"

# Install Nix via Determinate Nix Installer if not already installed.
if ! command -v nix &> /dev/null; then
  echo foo
  # curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --determinate
else
  echo "Nix is already installed."
fi

# Install devbox if not already installed.
if ! command -v devbox &> /dev/null; then
  curl -fsSL https://get.jetify.com/devbox | bash
else
  echo "Devbox is already installed."
fi

# Install git if not already installed.
if ! command -v git &> /dev/null; then
  # shellcheck source=/dev/null
  source /etc/os-release
  id="${ID_LIKE:-$ID}"

  case $id in
    fedora)
      dnf install -y git
      ;;
    debian|ubuntu)
      apt install -y git
      ;;
    arch)
      pacman -S --noconfirm git
      ;;
    *)
      echo "Unsupported OS: $id"
      exit 1
      ;;
  esac
else
  echo "Git is already installed."
fi

# Install my global devbox config.
devbox global pull https://github.com/flokoe/devbox.git
eval "$(devbox global shellenv --preserve-path-stack -r)" && hash -r

echo "Executing just bootstrap..."
curl -sSfL https://raw.githubusercontent.com/flokoe/dotfiles/refs/heads/main/justfile | just -d ~ -f /dev/stdin bootstrap "$tags"
