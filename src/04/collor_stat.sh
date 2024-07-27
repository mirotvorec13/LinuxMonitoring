#!/bin/bash
BACKGROUND_NAME='\033[40m' # black
TEXT_NAME='\e[0;37m' # white
BACKGROUND_OUTPUT='\033[41m' # red
TEXT_OUTPUT='\e[0;34m' # blue
NORMAL='\033[0m\e[0m'

chmod +x pars_collor_back.sh
chmod +x pars_collor_text.sh
if [ $5 \= 0 ]
then
  source ./pars_collor_back.sh $1 $3
  source ./pars_collor_text.sh $2 $4
fi

echo -en "${TEXT_NAME}${BACKGROUND_NAME}HOSTNAME${NORMAL} = "
RESULT=$(hostname)
echo -e "${TEXT_OUTPUT}${BACKGROUND_OUTPUT}$RESULT${NORMAL}"
echo -en "${TEXT_NAME}${BACKGROUND_NAME}TIMEZONE${NORMAL} = "
RESULT=$(timedatectl | grep zone | sed s/' '//g)
echo -e "${TEXT_OUTPUT}${BACKGROUND_OUTPUT}$RESULT${NORMAL}"
echo -en "${TEXT_NAME}${BACKGROUND_NAME}USER${NORMAL} = "
RESULT=$(whoami)
echo -e "${TEXT_OUTPUT}${BACKGROUND_OUTPUT}$RESULT${NORMAL}"
echo -en "${TEXT_NAME}${BACKGROUND_NAME}OS${NORMAL} = "
RESULT=$(cat /etc/issue | sed -n '1p' | sed 's/.\\n.*//')
echo -e "${TEXT_OUTPUT}${BACKGROUND_OUTPUT}$RESULT${NORMAL}"
echo -en "${TEXT_NAME}${BACKGROUND_NAME}DATE${NORMAL} = "
RESULT=$(date +'%e %b %Y %X')
echo -e "${TEXT_OUTPUT}${BACKGROUND_OUTPUT}$RESULT${NORMAL}"
echo -en "${TEXT_NAME}${BACKGROUND_NAME}UPTIME${NORMAL} = "
RESULT=$(uptime | sed s/.*'up'//g | sed s/^' '//g | sed s/'  '.*//g)
echo -e "${TEXT_OUTPUT}${BACKGROUND_OUTPUT}$RESULT${NORMAL}"
echo -en "${TEXT_NAME}${BACKGROUND_NAME}UPTIME_SEC${NORMAL} = "
RESULT=$(cat /proc/uptime | sed s/' '.*//g)
echo -e "${TEXT_OUTPUT}${BACKGROUND_OUTPUT}$RESULT${NORMAL}"
echo -en "${TEXT_NAME}${BACKGROUND_NAME}IP${NORMAL} = "
RESULT=$(hostname -I)
echo -e "${TEXT_OUTPUT}${BACKGROUND_OUTPUT}$RESULT${NORMAL}"
echo -en "${TEXT_NAME}${BACKGROUND_NAME}MASK${NORMAL} = "
RESULT=$(ifconfig | grep netmask | sed s/.*'netmask'//g | sed s/^' '*//g | sed s/' '.*//g | sed -n '1p')
echo -e "${TEXT_OUTPUT}${BACKGROUND_OUTPUT}$RESULT${NORMAL}"
echo -en "${TEXT_NAME}${BACKGROUND_NAME}GATEWAY${NORMAL} = "
RESULT=$(ip route | grep default | sed s/.*'via'//g | sed s/^' '*//g | sed s/' '.*//g | sed -n '1p')
echo -e "${TEXT_OUTPUT}${BACKGROUND_OUTPUT}$RESULT${NORMAL}"
echo -en "${TEXT_NAME}${BACKGROUND_NAME}RAM_TOTAL${NORMAL} = "
RESULT=$(free --mega | grep Mem | awk {'print $2'} | sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1.\2/;')
echo -e "${TEXT_OUTPUT}${BACKGROUND_OUTPUT}$RESULT${NORMAL}"
echo -en "${TEXT_NAME}${BACKGROUND_NAME}RAM_USED${NORMAL} = "
RESULT=$(free --mega | grep Mem | awk {'print $3'} | sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1.\2/;')
echo -e "${TEXT_OUTPUT}${BACKGROUND_OUTPUT}$RESULT${NORMAL}"
echo -en "${TEXT_NAME}${BACKGROUND_NAME}RAM_FREE${NORMAL} = "
RESULT=$(free --mega | grep Mem | awk {'print $4'} | sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1.\2/;')
echo -e "${TEXT_OUTPUT}${BACKGROUND_OUTPUT}$RESULT${NORMAL}"
echo -en "${TEXT_NAME}${BACKGROUND_NAME}SPACE_ROOT${NORMAL} = "
RESULT=$(df | grep '/$' | awk {'print $2'} | sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1.\2/;' | sed 's/[0-9]$//')
echo -e "${TEXT_OUTPUT}${BACKGROUND_OUTPUT}$RESULT${NORMAL}"
echo -en "${TEXT_NAME}${BACKGROUND_NAME}SPACE_ROOT_USED${NORMAL} = "
RESULT=$(df | grep '/$' | awk {'print $3'} | sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{2\}\)/\1.\2/;') 
echo -e "${TEXT_OUTPUT}${BACKGROUND_OUTPUT}$RESULT${NORMAL}"
echo -en "${TEXT_NAME}${BACKGROUND_NAME}SPACE_ROOT_FREE${NORMAL} = "
RESULT=$(df | grep '/$' | awk {'print $4'} | sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1.\2/;' | sed 's/[0-9]$//')
echo -e "${TEXT_OUTPUT}${BACKGROUND_OUTPUT}$RESULT${NORMAL}"
