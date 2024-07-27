#!/bin/bash

chmod +x stat.sh
./stat.sh
echo -n 'Save the stat on file? [Y/y]: '
read file
if [ $file \= y ] || [ $file \= Y ]
then
  date_file_name=$( date +'%e_%m_%y_%H_%M_%S.status' )
  ./stat.sh >> ${date_file_name}
  echo 'New file "'$date_file_name'" create!'
else
  exit 1
fi
