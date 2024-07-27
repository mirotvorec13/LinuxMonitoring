#!/bin/bash

text_white='\e[0;37m' # white 1
text_red='\e[0;31m' # red 2
text_green='\e[0;32m' # green 3
text_blue='\e[0;34m' # blue 4
text_purple='\e[0;35m' # purple 5
text_black='\e[0;30m' # black 6

case "$1" in
  1) TEXT_NAME=${text_wite} ;;
  2) TEXT_NAME=${text_red} ;;
  3) TEXT_NAME=${text_green} ;;
  4) TEXT_NAME=${text_blue} ;;
  5) TEXT_NAME=${text_purple} ;;
  6) TEXT_NAME=${text_black} ;;
esac
 
case "$2" in
  1) TEXT_OUTPUT=${text_wite} ;;
  2) TEXT_OUTPUT=${text_red} ;;
  3) TEXT_OUTPUT=${text_green} ;;
  4) TEXT_OUTPUT=${text_blue} ;;
  5) TEXT_OUTPUT=${text_purple} ;;
  6) TEXT_OUTPUT=${text_black} ;;
esac
