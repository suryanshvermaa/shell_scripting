#!/bin/bash

# function

function is_greater_than10(){
    if [[ $1 -gt 10 ]];
    then
        echo "number is greater"
    else
        echo "not greater"
    fi
}

is_greater_than10 200