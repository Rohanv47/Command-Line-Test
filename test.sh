#!/bin/bash
<<Documentation
Name:Rohan V Vernekar
Date: 15-12-2020
Title: Test function 
Documentation

source timer.sh     #to include the timer.sh file

clear
echo -e "              \e[1;32m**********************************************************\e[0m                           "
echo " "
echo -e "                                      \e[1;31mBest of luck\e[0m                                " 
echo " "
echo -e "              \e[1;32m**********************************************************\e[0m                           "
sleep 2
clear


random_number=(`shuf -i 1-10 -n  10`)      #to store random numbers from 1 to 10
actual_answer=(`sed 's/;/ /g' ans.txt`)       #to store all the correct answers from ans.txt file
marks=0
count=1


for i in `seq 0 $((${#random_number[@]}-1))`   #for loop to run for total number of questions
do
    clear
    echo -n "($count)"      #to display the question number
    echo -e "\e[1;91m------------------------------------------------------------------------------\e[0m"
    cat ./questionbank/question${random_number[i]}.txt                    #to display the question
    echo -e "\e[1;92m--------------------------------------------------------------------------------\e[0m"

    echo "Your answer:"     #to ask the user to enter the answer
    count=$(($count+1))     #count value is incremented
    echo " "

    timer &     #timer file is included to read the answer for 10 seconds
    read -t 30 answer   #to read answer
    kill $! 
    clear

    if [[ $answer =~ ^[a-d]+$ ]]    #to check if answer is within a-d
    then

        echo $answer >> useranswer.txt      #answer is stored in useranswer.txt if condition is true
    else
        echo -e "Invalid Input Marks awarded will be 0"     #printed if condition is false
        echo 0 >> useranswer.txt    #e is stored for invalid answer
    fi
    clear
done

user_answer=(`cat useranswer.txt`)      #to store all answers provided from user in an array

correct_answer=()       #Declare an array for correct answer



for j in `seq 0 $((${#random_number[@]}-1))`   
do
    index=${random_number[j]}
    correct_answer+=(${actual_answer[$index-1]})  #to add all the original answers in order the questions are displayed

done

for k in `seq 0 $((${#random_number[@]}-1))`
do
    if [ "${correct_answer[k]}" == "${user_answer[k]}" ]        #comparing all the correct answer with user answers
    then
        marks=$(($marks+1))     #total value is incremented by 1 if condition is true
    fi
done

rm useranswer.txt   #Removing the user answer after taking the test 

#to display when test is completed

echo
echo
echo -e "  \e[1;31m********************************************************\e[0m    "
echo " "
echo -e "                      \e[1;92mTEST COMPLETE\e[0m                          "
echo " "
echo -e "  \e[1;31m********************************************************\e[0m    "
sleep 2
clear

#to display the total marks scored by user

echo -e "  \e[33m*************************************************************************\e[0m"
echo -e "                      ***  You scored \e[1;5;91m$marks/10\e[0m  ***         "
echo -e "  \e[33m*************************************************************************\e[0m"
echo

#to ask the user to view and retake the test
function pass( )
{

    echo "Please Select your option: "  #user asked to select the options mentioned below
    echo "1.View test"
    echo "2.Retake test"
    echo "3.Exit"
    echo -n "choice :"
    read n  #to read the option


    case $n in      #case statements to read various options
        1)	
            echo "View the test:"       #to view the test
            echo -e "\e[33m*************************************************************************\e[0m"
            for i in `seq 0 $((${#random_number[@]}-1))`
            do
                echo -n "$(($i+1))."        #to print question number
                cat ./questionbank/question${random_number[i]}.txt     #to display the question 
                echo "correct answer:"
                echo "${correct_answer[i]}"     #to display the correct answer of the respective question
                echo "Your answer:"
                echo "${user_answer[i]}"        #to display the user answer
                echo " "
            done

            echo -e "\e[33m*************************************************************************\e[0m"

            ;;

        2)
            bash test.sh  #executed when user wants to retake the test
            ;;

        3)
            exit 
            ;;

        *)
            echo "Invalid option!!"
            pass
            ;;

        esac
        while [ 1 ]          
        do
            echo -e "\e[1mDo you want continue ?\e[0m"      #to ask if the user wants to execute procedure again
            echo
            echo *Enter yes to continue
            echo *Enter no to exit
            echo
            read option    
            if [ $option == "yes" ]
            then
                clear
                pass        #executed if the user wants to run again
            else
                clear
                echo " "
                echo -e " \e[1;94m******************************************************************************************************\e[0m "
                echo -e "                                              \e[1;91mTHANK YOU\e[0m                                 "
                echo -e " \e[1;94m******************************************************************************************************\e[0m "         
                sleep 2
                clear
                exit        #executed if the user doesn't want to run
            fi
        done

    }
    pass        #function call

