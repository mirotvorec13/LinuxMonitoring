#!/bin/bash

path_script=$(pwd)
cd $1
IFS=$' '
path_dir=$(pwd)
i=1
count=2
folder=$(du -h --max-depth=1 | sort -hr | awk {'print $2'} | sed s/'.'//)
size=$(du -h --max-depth=1 | sort -hr | sed s/' '$// | sed s/'\t'.*//)
echo $size > $path_script/size_folder.log
IFS=$'\n'

for var in $folder
do
  echo -n "$i - $path_dir$var, "
  echo $(cat $path_script/size_folder.log | sed -n ${count}p)
  i=$(( $i + 1 ))
  count=$(( $count + 1 ))
  if [ $i \= 6 ]
  then
    break
  fi
done

rm $path_script/size_folder.log
