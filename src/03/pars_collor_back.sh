#!/bin/bash
 
background_white='\033[47m' # white 1
background_red='\033[41m' # red 2
background_green='\033[42m' # green 3
background_blue='\033[44m' # blue 4
background_purple='\033[45m' # purple 5
background_black='\033[40m' # black 6

case "$1" in
  1) BACKGROUND_NAME=${background_white};;
  2) BACKGROUND_NAME=${background_red} ;;
  3) BACKGROUND_NAME=${background_green} ;;
  4) BACKGROUND_NAME=${background_blue} ;;
  5) BACKGROUND_NAME=${background_purple} ;;
  6) BACKGROUND_NAME=${background_black} ;;
esac

case "$2" in
  1) BACKGROUND_OUTPUT=${background_white} ;;
  2) BACKGROUND_OUTPUT=${background_red} ;;
  3) BACKGROUND_OUTPUT=${background_green} ;;
  4) BACKGROUND_OUTPUT=${background_blue} ;;
  5) BACKGROUND_OUTPUT=${background_purple} ;;
  6) BACKGROUND_OUTPUT=${background_black} ;;
esac
