#!/bin/bash

color=(black white red blue)
i=0
n=(0 0 0 0)

while [ $i \< 4 ]
do
  case "$1" in
    1) color[$i]='white' 
       n[$i]=1 ;;
    2) color[$i]='red'
       n[$i]=2 ;;
    3) color[$i]='green'
       n[$i]=3 ;;
    4) color[$i]='blue'
       n[$i]=4 ;;
    5) color[$i]='purple'
       n[$i]=5 ;;
    6) color[$i]='black'
       n[$i]=6 ;;
  esac
  shift
  i=$(( $i + 1 ))
done

echo
if [ $1 \= 0 ] && [ $2 \= 0 ]
then
  echo "Column 1 background = ${n[0]} (${color[0]})"
  echo "Column 1 font color = ${n[1]} (${color[1]})"
  echo "Column 2 background = ${n[2]} (${color[2]})"
  echo "Column 2 font color = ${n[3]} (${color[3]})"
else
  echo "Column 1 background = default (${color[0]})"
  echo "Column 1 font color = default (${color[1]})"
  echo "Column 2 background = default (${color[2]})"
  echo "Column 2 font color = default (${color[3]})"
fi


