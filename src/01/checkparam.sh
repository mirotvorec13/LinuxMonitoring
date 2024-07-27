#!/bin/bash

if [[ $1 =~ ^-?[0-9]+$ ]]
  then
    echo "Input not correct! Parameter is number"
    CHECKVALUE=1
fi 
