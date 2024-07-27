#!/bin/bash
if ! [ -d $1 ]; then
echo "The specified directory, does not exist!"
else
START_TIME_N=$(date +%s%N)
START_TIME_S=$(date +%s)

chmod +x count_folder.sh
chmod +x top5_folder_size.sh
chmod +x count_files.sh
chmod +x files_sort.sh
chmod +x top10_files_size.sh
chmod +x top10_executable_files.sh

echo -n "Total number of folders (including all nested ones) = " 
./count_folder.sh $1 # кол-во папок включая вложенные

echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
./top5_folder_size.sh $1 # топ 5 папок с самым большим весом

echo -n "Total number of files = "
./count_files.sh $1

./files_sort.sh $1

echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
./top10_files_size.sh $1

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
./top10_executable_files.sh $1
 
END_TIME_N=$(date +%s%N)
END_TIME_S=$(date +%s)

difference_n=$(( (END_TIME_N - START_TIME_N) / 10000000))
difference_s=$(( END_TIME_S - START_TIME_S ))
echo "Script execution time (in seconds) = ${difference_s}.${difference_n} seconds"

fi
