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

	# ERROR CODES
	declare -A MENU_ERRORS
	MENU_ERRORS[INVALID_PROMPT]=100
	MENU_ERRORS[INVALID_OPTIONS]=101

	# ERROR MESSAGES
	declare -A ERRORS
	ERROR[INVALID_PROMPT]="\n${RED}MENU ERROR: No prompt provided${EOS}"
	ERROR[INVALID_OPTIONS]="\n${RED}MENU ERROR: No options provided${EOS}"

    # MENU
    if [ -n "$ZSH_VERSION" ]; then
        if [ -z "$1" ]; then
            echo -e ${ERROR[INVALID_PROMPT]}
            return ${MENU_ERRORS[INVALID_PROMPT]}
        fi
        if [ -z "$2" ]; then
            echo -e ${ERROR[INVALID_OPTIONS]}
            return ${MENU_ERRORS[INVALID_OPTIONS]}
        fi
        MENUPROMPT=$1
        SELECTED=1
        OPTIONS=("${@:2}")
        LENGTH=${#OPTIONS[@]}
    else
        if [ -z "$1" ]; then
            echo -e ${ERROR[INVALID_PROMPT]}
            return ${MENU_ERRORS[INVALID_PROMPT]}

        fi
        if [ -z "$2" ]; then
            echo -e ${ERROR[INVALID_OPTIONS]}
            return ${MENU_ERRORS[INVALID_OPTIONS]}
        fi
        PROMPT=("$1")
        SELECTED=0
        OPTIONS="${@:2}"
        LENGTH="$((${#OPTIONS[@]} - 4))"
    fi
    DIV="===================="
    ARROW="$(tput setaf 3; tput bold)"
    INDICATOR="-->"

    # FUNCTIONS
    PRINT_MENU() {
        # Runs clear to prevent infinite scroll when choosing
        clear
        # Displays menu header
        if [ -n "$ZSH_VERSION" ]; then
            echo -e "$GREEN$MENUPROMPT$EOS"
        else
            echo -e "$GREEN${PROMPT[0]}$EOS"
        fi
        echo -e "$GREEN$DIV$EOS"
        # Displays menu options
        if [ -n "$ZSH_VERSION" ]; then
            for (( i=1;i<=${#OPTIONS[@]};i++ ))
            do
            if [[ $SELECTED -eq $i ]]
            # Renders current option in bold
            then
                OPT=${OPTIONS[$i-1]}
                echo -e "\n  $ARROW$INDICATOR$EOS $YELLOW$OPT$EOS"
            # Renders other options
            else
                OPT=${OPTIONS[$i-1]}
                echo -e "\n$GRAY$OPT$EOS"
            fi
            done
        else
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
        fi
        # Displays menu footer
        echo -e "\n$GREEN$DIV$EOS"
    }

    PRINT_MENU
    # Reads user input // Navigation
    if [ -n "$ZSH_VERSION" ]; then
        while read -rsk1 input
        do
            case $input in
            "A")
                if [[ $SELECTED -lt 2 ]]
                then
                    SELECTED=$(($LENGTH))
                else
                    SELECTED=$(($SELECTED - 1))
                fi
                PRINT_MENU
            ;;
            "B")
                if [[ $SELECTED -gt $(($LENGTH - 1)) ]]
                then
                    SELECTED=1
                else
                    SELECTED=$(($SELECTED + 1))
                fi
                PRINT_MENU
            ;;
            # Returns selected option
            ""|"\n") return $(($SELECTED)) ;;
            esac
        done
    else
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
    fi
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