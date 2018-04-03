#!/usr/bin/env bash

# mk-enc-bak.sh – Creates snapshot backups with rsync on an encrypted device
# Author: Florian Köhler
# Repository: https://github.com/flokoe/dotfiles

# I needed a backup which could create incremental snapshots on an encrypted device.
# Furthermore it should delete very old backups and it shuld be very portable and not depentand on GUI.
# Therefore I decided to use rsync and write this script.


## OPTIONS – change to your needs ##

# fallbacks if no commandline argument is profided
# Name of your target partition/device
device=""
# Sub directory for seperation e.g. private or work
subdir=""


## DO NOT EDIT ANYTHING BELOW THIS LINE ##
# applications
SUDO="/usr/bin/sudo"; MOUNT="/bin/mount"; CRYPTSETUP="/sbin/cryptsetup"
MKDIR="/bin/mkdir"; CHOWN="/bin/chown"; CHMOD="/bin/chmod"

# variables
name="$(basename $0)"
version="0.0.1"
repo="https://github.com/flokoe/dotfiles"
license="MIT"
author="Florian Köhler"
mapping_name="enc-bak"
mapping_path="/dev/mapper/$mapping_name"
mount_path="/mnt/$mapping_name"

# help text output
help() {
  echo "Usage: $name [OPTIONS]..."
  echo "Creates backup snapshot with rsync on an encrypted device"
  echo ""
  echo "Available arguments:"
  echo "  -s              target sub directory to use"
  echo "  -d              target device name"
  echo "  -h, --help      display this help and exit"
  echo "      --version   output version information and exit"
}

# argument parsing
while [[ $# > 0 ]]
do
  case "$1" in
    -h | --help)
      help
      exit 0
    ;;
    --version)
      echo "$name $version"
      echo "Repository: $repo"
      echo "Lincense $license"
      echo ""
      echo "Written by $author"
      exit 0
    ;;
    -s)
      subdir="$2"
			shift 2
    ;;
    -d)
      device="$2"
      shift 2
    ;;
    *)
			echo "Unknown option '$1'"
      echo ""
      help
      exit 1
    ;;
  esac
done

# subdir and device validation
if [[ ! $device =~ ^\/dev\/sd[a-z][0-9]$ || ! $subdir =~ ^[a-zA-Z0-9_-]+$ ]]; then
	echo "'$device' or '$subdir' is not a valid name or path."
	exit 1
fi

# mount of encrypted device
"$SUDO" "$CRYPTSETUP" open "$device" "$mapping_name"
if [[ ! -d $mount_path || ! -r $mount_path || ! -w $mount_path ]]; then
	"$SUDO" "$MKDIR" -p "$mount_path"
	"$SUDO" "$CHOWN" -R "$USER:$USER" "$mount_path"
	"$SUDO" "$CHMOD" -R 775 "$mount_path"
fi
"$SUDO" "$MOUNT" "$mapping_path" "$mount_po
