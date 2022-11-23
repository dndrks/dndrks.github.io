#!/bin/bash

d=$(date +%y%m%d)
f=$d

if test -f "$1"; then
  echo "photo: $1"
  if [ $2 ]
    then f="$f-$2"
  fi 
  echo "file: $f"
  high="image/high/$d.jpg"
  low="image/$d.jpg"
  convert $1 -auto-orient -resize 50% $high
  convert $high -auto-orient -resize 800 $low
  echo "[![$d](/$low)](/$high)" > $f.md
  nano $f.md
fi

