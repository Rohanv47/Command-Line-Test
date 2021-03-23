#!/bin/bash
<<Documentation
Name: Rohan V Vernekar
Date: 15-12-2020
Title: Signup function
Documentation

#displayed when this file executed
echo
echo -e " \e[1;31m**************************************************************************************************************\e[0m  "
echo -e "       #####                                 \e[1;5;96mWELCOME TO SIGNUP PROCESS\e[0m                                   ##### "
echo -e " \e[1;32m**************************************************************************************************************\e[0m  "


#Prompt the user to enter the username
function user( )
{
    echo -e "\e[1mUsername\e[0m:"       #asks the new user to enter the username
    read username       #to read the username
    flag=1
    userfile=(`cat user.csv | cut -d "," -f1`)      #stores all the usernames from user.csv file

    for i in `seq 1 $((${#userfile[@]}-1))`         #to run the for loop to total number of users
    do
        if [ "$username" == "${userfile[i]}" ]      #to check if the username is unique
        then
            flag=0      #flag is set to zero if username is not unique
            break       #the loop is terminated when the condition becomes true
        fi       
    done

    #Verifying the username if it is already exists or not

    if [ $flag -eq 0 ]  #to check if flag is zero
    then
        echo -e "\e[1;31mUsername already exists!!Try again\e[0m"       #printed when username is not unique and flag is zero
        user    #function is called again
    fi

    echo -n "$username" >>user.csv      #username is stored in user.csv if unique
}

user    # user function is called

#prompt the user to enter the password
function pass( )
{
    echo -e "\e[1mPassword\e[0m\e[1;91m(should contain atleast a number and min. 8 characters long)\e[0m:"          #asking the user to enter the new password containing atleast a number and minimum 8 characters long
    read -s password        #to read the password in secure mode
    if [[ $password =~ ^.*[0-9].*$ ]] && [[ ${#password} -ge 8 ]]           #to check if password has atleast one numberand atleast 8 characters long
    then
        echo
        echo Re-enter the password      #user asked to re-enter the password to confirm
        read -s re_enter_pass       
        echo
        if [ "$re_enter_pass" == "$password" ]      #to check if entered and re-entered password is same
        then
            echo -n ",$pass" >> user.csv             #password added to database with respective username
            echo >> user.csv                         #to go to next line   
            echo -e "\e[36;1mSignup Successful\e[0m" #displayed when password and username meet requirements
            sleep 2
        else
            echo -e "\e[1;31mInvalid input!!Password not matching re-entered password\e[0m"     #displayed when both passwords dont match
            pass #ask user to enter password again as not matching re-entered password      #function called again
        fi
    else
        echo -e "\e[1;31mInvalid input!!Password not matching requirements\e[0m"        #displayed when the password do not meet requirements
        pass #ask user to enter password again as not matching requirements         #function called again

    fi

}
pass    #pass function is called


