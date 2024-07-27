#!/bin/bash
CHECKVALUE=0

if [ $# == 0 ]
then
  echo "Input not correct (parameters == 0)"
  CHECKVALUE=1
elif [ $# \> 1 ]
then
  echo "Input not correct (parameters > 1): Parameter = $#"
  CHECKVALUE=1
elif [ $CHECKVALUE == 0 ]
then
  source ./checkparam.sh ${!#}
else
  exit 1
fi

if [ $CHECKVALUE == 0 ]
then
  echo $1
fi
