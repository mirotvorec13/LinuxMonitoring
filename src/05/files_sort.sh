#!/bin/bash

cd $1

echo -n "Configuration files (with the .conf extension) = "
echo $(ls | grep '\.conf*$' | wc -l)
echo -n "Text files = "
echo $(ls | grep '\.txt*$' | wc -l)
echo -n "Executable files = "  
echo $(ls | grep '\.exe*$' | wc -l)
echo -n "Log files (with the extension .log) = "  
echo $(ls | grep '\.log*$' | wc -l)
echo -n "Archive files = "
echo $(ls | grep -e '\.Z*$' -e '\.tar*$' -e '\.gz*$' -e '\.tgz*$' | wc -l)
echo -n "Symbolic links = "
echo $(ls -l | grep '^l' | wc -l)
