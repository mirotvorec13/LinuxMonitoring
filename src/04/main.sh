#!/bin/bash

CHECKVALUE=0
CHECKDUPLICATE=0
CHECKDEFAULTVALUE=0
count=1
n=(0 0 0 0)
i=0
filein=$(cat parameters.conf)

for var in $filein
do
if ! [[ "$var" =~ [0-9]$ ]]; then 
  var1=$(cut -d= -f2 parameters_default.conf | sed -n ${count}p)
  n[$i]=$var1
  i=$(( $i + 1 ))
  count=$(( $count + 1 ))
else
  n[$i]=${var: -1}
  i=$(( $i + 1 ))
  count=$(( $count + 1 ))
fi
done

if [ $CHECKVALUE == 0 ]
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

if [ $CHECKVALUE \= 0 ] && ( [ ${n[0]} \= ${n[1]} ] || [ ${n[2]} \= ${n[3]} ] )
then
  CHECKDUPLICATE=1
  echo "Input not correct: Parameters should not be duplicated!"
  echo "Launch the application with new settings."
fi
i=0
IFS=$'\n'
for var2 in $(cut -d= -f2 parameters_default.conf)
do
  if [ ${n[$i]} \= $var2 ]
  then
    CHECKDEFAULTVALUE=1
  else
    CHECKDEFAULTVALUE=0
    break
  fi
  i=$(( $i + 1 ))
done

if [ $CHECKVALUE \= 0 ]
then
  chmod +x collor_stat.sh
  ./collor_stat.sh ${n[0]} ${n[1]} ${n[2]} ${n[3]} $CHECKDUPLICATE $CHECKDEFAULTVALUE
fi

chmod +x print_color.sh
./print_color.sh ${n[0]} ${n[1]} ${n[2]} ${n[3]} $CHECKDUPLICATE $CHECKDEFAULTVALUE

#IFS=$' '
#for var in $(cat parameters_default.conf)
#do
#  echo $var > parameters.conf
#  done
