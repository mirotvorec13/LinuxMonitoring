#!/bin/bash

path_script=$(pwd)
cd $1
IFS=$' '
path_dir=$(pwd)
i=1
files=$(ls -lahS | grep '^-' | awk {'print $9'})
size=$(ls -lahS | grep '^-' | awk {'print $5'})
echo $size > $path_script/size_file.log
echo $files > $path_script/extension.log
IFS=$'\n'

for var in $files
do
  echo -n "$i - $path_dir/$var, "
  echo -n "$(cat $path_script/size_file.log | sed -n ${i}p), "
  echo $(cat $path_script/extension.log | grep '.*$' | sed s/.*'\.'// | sed -n ${i}p)
  i=$(( $i + 1 ))
  if [ $i \= 11 ]
  then
    break
  fi
done

rm $path_script/size_file.log
rm $path_script/extension.log
