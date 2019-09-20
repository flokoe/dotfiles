#!/usr/bin/env bash

# Show colors and coresponding escape codes
# stolen from the manjaro .bashrc
colors () {
  local fgc bgc vals seq0

  printf "Color escapes are %s\n" '\e[${value};...;${value}m'
  printf "Values 30..37 are \e[33mforeground colors\e[m\n"
  printf "Values 40..47 are \e[43mbackground colors\e[m\n"
  printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

  # foreground colors
  for fgc in {30..37}; do
    # background colors
    for bgc in {40..47}; do
      fgc=${fgc#37} # white
      bgc=${bgc#40} # black

      vals="${fgc:+$fgc;}${bgc}"
      vals=${vals%%;}

      seq0="${vals:+\e[${vals}m}"
      printf "  %-9s" "${seq0:-(default)}"
      printf " ${seq0}TEXT\e[m"
      printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
    done
    echo; echo
  done
}

calc () {
  echo "$*" | bc -l;
}

# Print all duplicate lines once
duplines () {
  sort $1 | uniq -d
}

# Print all unique lines
uniqlines () {
  sort $1 | uniq -u
}

# Magically extract any archive regardless if its file extension
ex () {
  # for each argument (file) try to extract
  while [[ $# > 0 ]] ; do
    # Check if file exists
    if [[ -f $1 ]] ; then
      case "$1" in
        *.tar.bz2|*.tbz|*.tbz2) tar "x${verbose}jf" "$1" ;;
        *.tar.gz|*.tgz) tar "x${verbose}zf" "$1" ;;
        *.tar.xz) xz --decompress "$1"; set -- "$@" "${1:0:-3}" ;;
        *.tar.Z) uncompress "$1"; set -- "$@" "${1:0:-2}" ;;
        *.bz2) bunzip2 "$1" ;;
        *.deb) dpkg-deb -x${verbose} "$1" "${1:0:-4}" ;;
        *.pax.gz) gunzip "$1"; set -- "$@" "${1:0:-3}" ;;
        *.gz) gunzip "$1" ;;
        *.pax) pax -r -f "$1" ;;
        *.pkg) pkgutil --expand "$1" "${1:0:-4}" ;;
        *.rar) unrar x "$1" ;;
        *.rpm) rpm2cpio "$1" | cpio -idm${verbose} ;;
        *.tar) tar "x${verbose}f" "$1" ;;
        *.txz) mv "$1" "${1:0:-4}.tar.xz"; set -- "$@" "${1:0:-4}.tar.xz" ;;
        *.xz) xz --decompress "$1" ;;
        *.zip|*.war|*.jar) unzip "$1" ;;
        *.Z) uncompress "$1" ;;
        *.7z) 7za x "$1" ;;
        *) echo "'$1' cannot be extracted via ex" ;;
      esac
    else
      echo "ex: '$1' is not a valid file"
    fi

    shift
  done
}
