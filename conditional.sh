#!/bin/bash

 # conditional
 read -p "enter number: " number

 if [[ $number == 50 ]];
 then
     echo "correct"
elif [[ $number -gt 50 ]];
then
    echo "also correct"
else 
    echo "incorrect"
fi