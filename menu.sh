#!/bin/bash

function MENU() {

	# COLORS
	GRAY="$(tput setaf 0; tput bold)"
	RED="$(tput setaf 1; tput bold)"
	GREEN="$(tput setaf 2; tput bold)"
	YELLOW="$(tput setaf 3; tput bold; tput smul)"
	BLUE="$(tput setaf 4; tput bold)"
	MAGENTA="$(tput setaf 5; tput bold)"
	CYAN="$(tput setaf 6; tput bold)"
	WHITE="$(tput setaf 7; tput bold)"
	EOS="$(tput sgr0)"	
	# MENU
	PROMPT=("$1")
	DIV="===================="
	ARROW="$(tput setaf 3; tput bold)"
	INDICATOR="-->"
	SELECTED=0
	OPTIONS="${@:2}"
	LENGTH="$((${#OPTIONS[@]} - 4))"

	# FUNCTIONS
	PRINT_MENU() {
		# Runs clear to prevent infinite scroll when choosing
		clear
		# Displays menu header
		echo -e "$GREEN$PROMPT$EOS"
		echo -e "$GREEN$DIV$EOS"
		# Displays menu options
		for (( i=0;i<${#OPTIONS[@]};i++ ))
		do
			if [[ $SELECTED -eq $i ]]
			# Renders current option in bold
			then
				OPT=${OPTIONS[$i]}
				echo -e "\n  $ARROW$INDICATOR$EOS $YELLOW$OPT$EOS"
			# Renders other options
			else
				OPT=${OPTIONS[$i]}
				echo -e "\n$GRAY$OPT$EOS"
			fi
		done
		# Displays menu footer
		echo -e "\n$GREEN$DIV$EOS"
	}

	PRINT_MENU	
	# Reads user input // Navigation
	while read -rsn1 input
	do
    case $input in
		"A")
			if [[ $SELECTED -lt 1 ]]
			then
				SELECTED=$(($LENGTH + 3))
			else
				SELECTED=$(($SELECTED - 1))
			fi
			PRINT_MENU
		;;
		"B")
			if [[ $SELECTED -gt $(($LENGTH + 2)) ]]
			then
				SELECTED=0
			else
				SELECTED=$(($SELECTED + 1))
			fi
			PRINT_MENU
		;;
		# Returns selected option
		"") return $(($SELECTED)) ;;
    esac
	done
}

#################################################################################################################
#
# USAGE
#
# Once the menu.sh script is located on the desired directory, source in your code:
#
# source menu.sh
# 
# Now just declare your options in an array.
# Finally, call the menu with the following:
#
# PROMPT="Choose an option from the menu below: "
# OPTIONS=("Option 1" "Option 2" "Option 3")
# MENU "${PROMPT}" "${OPTIONS}"
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
#
# Enjoy!
#
#################################################################################################################