#!/usr/bin/env bash

set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

usage() {
  cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-v] arg1 [arg2...]

Script description here.

Available options:

-h, --help      Print this help and exit
-v, --verbose   Print script debug info
EOF
  exit
}

cleanup() {
  trap - SIGINT SIGTERM ERR EXIT
  # script cleanup here
}

msg() {
  echo >&2 -e "${1-}"
}

die() {
  local msg=$1
  local code=${2-1} # default exit status 1
  msg "$msg"
  exit "$code"
}

parse_params() {
  # default values of variables set from params

  while :; do
    case "${1-}" in
    -h | --help) usage ;;
    -v | --verbose) set -x ;;
    -?*) die "Unknown option: $1" ;;
    *) break ;;
    esac
    shift
  done

  return 0
}

parse_params "$@"

# script logic starts here

# Ensure needed binaries are installed
su -lc 'DEBIAN_FRONTEND=noninteractive apt-get install -y git vim whois libffi-dev python3 python3-pip python3-venv' root

[[ -d ~/.dotfiles ]] || git clone https://github.com/flokoe/dotfiles.git ~/.dotfiles

cd ~/.dotfiles

# shellcheck source=/dev/null
python3 -m venv env &&
source ./env/bin/activate &&
pip3 install --upgrade pip &&
pip3 install wheel &&
pip3 install ansible
