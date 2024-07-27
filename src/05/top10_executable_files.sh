#!/bin/bash

path_script=$(pwd)
cd $1
IFS=$' '
path_dir=$(pwd)
i=1
files=$(ls -lahS | awk {'print $9'} | grep '.exe*$')
size=$(ls -lahS | grep '.exe*$' | awk {'print $5'})
echo $size > $path_script/size_file.log
IFS=$'\n'

for var in $files
do
  sum=$path_dir/$var
  echo -n "$i - $sum, "
  echo -n "$(cat $path_script/size_file.log | sed -n ${i}p), "
  echo $(md5sum $sum | awk {'print $1'})
  i=$(( $i + 1 ))
  if [ $i \= 11 ]
  then
    break
  fi
done

rm $path_script/size_file.log

