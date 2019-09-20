#!/usr/bin/env bash

# Add android sdk to PATH if it exists
if [[ -d $HOME/android-sdk-linux/platform-tools/ ]]; then
	PATH="$HOME/android-sdk-linux/platform-tools/:$PATH"
fi

# Prepend ~/.local/bin to PATH, e.g. to use local python binaries
if [[ -d $HOME/.local/bin/ ]]; then
	PATH="$HOME/.local/bin/:$PATH"
fi
