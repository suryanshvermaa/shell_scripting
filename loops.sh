#!/bin/bash

# for loop

for (( num=1; num<=5;num++))
do
    mkdir -p "demo$num"
done

# while loop
num=5
while [[ $num -le 5 ]]
do
    echo "hi $num"
    num=$((num+1))
done