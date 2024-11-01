#!/usr/bin/env bash

set -Eeuo pipefail

tags="${1:-}"

echo "Downloading just..."
latest_release_url="$(curl -sSfL https://api.github.com/repos/casey/just/releases/latest | grep browser_download_url |grep 'x86_64-unknown-linux-musl.tar.gz"' | cut -d'"' -f 4)"
curl -sSfL "$latest_release_url" -o /tmp/just-latest.tar.gz

echo "Extracting just to /tmp..."
dir="$(mktemp -d)"
tar --overwrite -C "$dir" -xzf /tmp/just-latest.tar.gz

echo "Executing just bootstrap..."
echo ""
curl -sSfL https://raw.githubusercontent.com/flokoe/dotfiles/refs/heads/main/justfile | "${dir}/just" -d ~ -f /dev/stdin install "$tags"
