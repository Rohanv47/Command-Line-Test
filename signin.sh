#!/bin/bash
<<Documentation
Name: Rohan V Vernekar
Date: 15-12-2020
Title: Signin function 
Documentation

function pass( )
{

    echo
    echo -e " \e[1;31m**************************************************************************************************************\e[0m  "
    echo -e "                                             \e[1;5;96mWELCOME TO SIGNIN PROCESS\e[0m                                   "
    echo -e " \e[1;32m**************************************************************************************************************\e[0m  "


    echo -e "\e[1mEnter the Username:\e[0m"     #asks the user to enter the username
    read username       #to read the username
    echo " "

    echo -e "\e[1mPassword:\e[0m"       #asks user to enter the password
    read -s password        #to read the password in secure mode

    userfile=(`cat user.csv | cut -d "," -f1`)      #stores all the user present in user.csv file
    passfile=(`cat user.csv | cut -d "," -f2`)      #stores the passwords of all the users from user.csv file
    c=${#userfile[@]}       #to store the total users
    
    flag=0         

    #Verifying the username and password given by the user

    for i in `seq 0 $((${#userfile[@]}-1))`     #to run the for loop for total number of users
    do
        if [ $username == ${userfile[i]} ]      #to compare the given username from all the usernames in userfile array
        then
            if [ $password == ${password[i]} ]  #to compare the given password from all the passwords
            then
                flag=1      #falg value is changed to 1 when all conditions are true
                clear

                #displayed when successfully logged in
                echo
                echo -e " \e[1;31m**************************************************************************************************************\e[0m  "
                echo " "
                echo -e "                                  \e[1;5;96mLOGGED IN SUCESSFULLY!!WELCOME TO TEST PORTAL\e[0m                                   "
                echo " "
                echo -e " \e[1;32m**************************************************************************************************************\e[0m  "

                echo " "
                echo -e "                                      \e[1;5;96mPLEASE PRESS ENTER TO START THE TEST\e[0m                                             "
                read key        #used to read enter key to start test

                if [ "$key" == "\n" ]   
                then

                    echo "Press Enter"


                fi
                bash test.sh        #the file test.sh is linked and executed when all conditions are true
            fi
        fi

    done



    if [ $flag = 0 ]        #to check if flag value is zero or not
    then
        echo -e "\e[1;31mIncorrect Username or Password!!Try again\e[0m"    #if zero then this message is printed
        pass        #again the signin function is called 
    fi
}
pass #function is called when this file is executed
