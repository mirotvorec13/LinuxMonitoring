#!/bin/bash

if ! [[ $1 =~ ^-?[0-9]+$ ]]
  then
    echo "Input not correct! Parameter is not a number"
    CHECKVALUE=1
  else
    if [ $1 \> 6 ] || [ $1 \< 1 ]
    then
      echo "Input not correct! Parameter can be (> 0 & < 7)"
      CHECKVALUE=1
    fi
fi 
