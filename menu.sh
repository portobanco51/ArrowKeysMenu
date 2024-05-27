#!/bin/bash

function MENU() {
  PS3=('Please enter your choice: ')
  DIV="===================="
  YELLOW="\033[0;33m"
  GRAY="\033[1;30m"
  GREEN="\033[1;32m"
  NC="\033[0m"
  INDICATOR="<"
  SELECTED=0
  OPTIONS=("$@")
  LENGTH=$#
  
  PRINT_MENU() {
    # runs clear to prevent infinite scroll when choosing
    clear
    # display menu header
    echo -e "$GREEN$PS3$NC"
    echo -e "$GREEN$DIV$NC"
    # display menu options
    for (( i=0;i<(($LENGTH));i++ ))
    do
      if [[ $SELECTED -eq $i ]]
      # renders current option in bold
      then
        OPT=${OPTIONS[$i]}
        echo -e "\n  $YELLOW$OPT $INDICATOR$NC"
      # renders other options
      else
        OPT=${OPTIONS[$i]}
        echo -e "\n$GRAY$OPT$NC"
      fi
    done
    # display menu footer
    echo -e "\n$GREEN$DIV$NC"
  }

  PRINT_MENU

  # read user input
  while read -rsn1 input
  do
    case $input in
      "A")
        if [[ $SELECTED -lt 1 ]]
        then
          SELECTED=$(($LENGTH-1))
        else
          SELECTED=$(($SELECTED-1))
        fi
        PRINT_MENU
       ;;
      "B")
        if [[ $SELECTED -gt $(($LENGTH-2)) ]]
        then
          SELECTED=0
        else
          SELECTED=$(($SELECTED+1))
        fi
        PRINT_MENU
       ;;
      # return selected option
      "") return $(($SELECTED)) ;;
    esac
  done
}

# USAGE
# Once the menu.sh script is located on the desired directory, source in your code
#
# source menu.sh
# 
# Now just declare your options in an array.
# Finally, call the menu with the following:
#
# OPTIONS=("option 1" "option 2" "option 3")
# MENU ${OPTIONS[@]}
#
# Once you have selected an option, the menu will return the value of the index of the selected option. 
# For example, you can return the value of the selected option with the following:
#
# RESULT=${OPTIONS[$?]} ======> selected option value (output: option 2)
#
# Or you can return the index of the selected option with the following:
#
# RESULT=$? ======> selected index value (output: 1)
# 
# echo -e "\nYou selected: $RESULT" >> echoes the selected option value
# to the terminal 