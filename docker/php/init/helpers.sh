#!/bin/bash

function print() {
    if [[ $2 == "green" ]]; then
        tput setaf 2;
        echo "$1"
    elif [[ $2 == "red" ]]; then
        tput setaf 1;
        echo "$1"
    elif [[ $2 == "yellow" ]]; then
        tput setaf 3;
        echo "$1"
    else
        tput setaf 7;
        echo "$1"
    fi
    tput setaf 7;
}
