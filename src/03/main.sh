#!/bin/bash

CHECKVALUE=0
CHECKDUPLICATE=0

if [ $# \= 0 ]
then
  echo "Input not correct: (parameters == 0)"
  CHECKVALUE=1
elif [ $# \< 4 ]
then
  echo "Input not correct: (parameters < 4): Parameter = $#"
  CHECKVALUE=1
elif [ $# \> 4 ]
then
  echo "Input not correct: (parameters > 4): Parameter = $#"
  CHECKVALUE=1
elif [ $CHECKVALUE == 0 ]
then
  count=1
  chmod +x check_param.sh
  for param in $@
  do
    count=$(( $count + 1 ))
    source ./check_param.sh $param
  done
else
 exit 1 
fi

if [ $CHECKVALUE \= 0 ] && ( [ $1 \= $2 ] || [ $3 \= $4 ] )
then
  CHECKDUPLICATE=1
  echo "Input not correct: Parameters should not be duplicated!"
  echo "Launch the application with new settings."
fi

if [ $CHECKVALUE \= 0 ]
then
  chmod +x collor_stat.sh
  ./collor_stat.sh $1 $2 $3 $4 $CHECKDUPLICATE
fi


