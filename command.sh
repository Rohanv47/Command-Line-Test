#!/bin/bash
<<Documentation
Name: Rohan V Vernekar
Date: 15-12-2020
Title: Main function which displays the main page of the ommand line test
Documentation

function pass()
{

    clear
    echo    
    echo -e " \e[1;31m**************************************************************************************************************\e[0m  "
    echo -e "                                                     \e[1;5;96mWELCOME\e[0m                                    "
    echo -e " \e[1;32m**************************************************************************************************************\e[0m  "
    echo
    echo -e "                            \e[1;31mSIGNUP IF YOU ARE NOT REGISTERED USER FOR TAKING TEST\e[0m"
    echo " "
    echo -e  "                                \e[1;31mPLEASE SIGNIN IF YOU ARE A REGISTERED USER\e[0m"
    echo " "

    
    echo -e "\e[1mPlease select an option\e[0m :"       #asking the user to select the options shown below
    echo
    echo "            1-Signin"         #signin option for a existing user
    echo "            2-Signup"         #signup option for a new user
    echo "            3-Exit"           #exit option to exit from the test
    echo
    echo -n "Option: "
    read option         #to read the option from user
    clear

    case $option in         #case statement to execute various options
        1)
            bash signin.sh        # links the signin.sh file to this function
            ;;

        2)
            bash signup.sh        # links the signup.sh file to this function
            ;;

        3)
            exit                  # exit function to exit from program
            ;;

        *)
            echo "Please give valid input";;      #displayed when no valid input is given

    esac
    pass
}
pass        #function call
