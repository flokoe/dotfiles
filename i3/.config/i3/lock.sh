#!/usr/bin/env bash

icon="$HOME/.config/i3/lock.png"
lockImage="/tmp/lockImage.png"
n=1
x=0
displays="$(xrandr |grep -c -w connected)"

scrot "$lockImage"

while [ "$n" -le $displays ]
do
  mogrify -region 1920x1200+"$x"+0 -scale 25% -blur 0x15 -scale 400% "$lockImage"
  ((x+=1920))
  ((n++))
done

convert "$lockImage" "$icon" -gravity center -composite -matte "$lockImage"

i3lock -i "$lockImage"

rm "$lockImage"
