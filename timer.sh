#!/bin/bash
<<Documentation
Name: Rohan V Vernekar
Date: 15-12-2020
Title: Timer function to read the answer for 10 seconds
Documentation

function timer()
{

    count=10        #to wait for 10 seconds to read answer in test function
    while [ $count > 0 ]   #executed till the count value becomes zero
    do
        sleep 1
        count=$(($count-1))
        echo -ne "                                                              Time Remaining:$count\033[0K\r"  #to display the time remaining

    done
}
