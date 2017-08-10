#!/usr/bin/env bash

icon="$HOME/.config/i3/lock.png"
lockImage="/tmp/lockImage.png"
n=1
x=0

scrot "$lockImage"

while [ "$n" -le 3 ]
do
  convert -extract 1920x1200+"$x"+0 "$lockImage" /tmp/lockImage"$n".png
  convert /tmp/lockImage"$n".png -scale 25% -blur 0x15 -scale 400% /tmp/lockImage"$n".png
  ((x+=1920))
  ((n++))
done

convert /tmp/lockImage1.png /tmp/lockImage2.png /tmp/lockImage3.png +append "$lockImage"
convert "$lockImage" "$icon" -gravity center -composite -matte "$lockImage"

#i3lock -i "$lockImage"

rm /tmp/lockImage*.png
