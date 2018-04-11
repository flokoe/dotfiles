#!/usr/bin/env bash

# Script to gather information of all installed packages
# 
# To restore all the packages, sources and key execute the following
#
# Restore source lists
#
# import all trusted keys
# sudo apt-key add trusted-keys.gpg
# sudo apt-get update
#
# install all packages
# xargs -a "packages.list.save" sudo apt-get install
#
# restore install status
# xargs -a "package-states-auto" sudo apt-mark auto
# xargs -a "package-states-manual" sudo apt-mark manual 


# Get distribution e.g. Debian-stretch
distri="$(lsb_release -is)-$(lsb_release -cs)"

mkdir -p /home/flo/Documents/pkgs
target="/home/flo/Documents/pkgs/$distri"

# Get installed packages
dpkg --get-selections | awk '$2 == "install" {print $1}' > "$target"-packages.list.save

#
apt-mark showauto > "$target"-package-states-auto
apt-mark showmanual > "$target"-package-states-manual 

# Get all source lists
find /etc/apt/sources.list* -type f -name '*.list' -exec bash -c 'echo -e "\n## $1 ";grep "^[[:space:]]*[^#[:space:]]" ${1}' _ {} \; > "$target"-sources.list.save

# Get trusted keys
cp /etc/apt/trusted.gpg "$target"-trusted-keys.gpg 

