#!/bin/bash

# Script to change the sensitivity.

function print_usage
{
    echo "Usage: $0 <mouse nameish or dk for don't know> <sensitivity from -1 to 1>"
    exit 1
}

# from Tiago Lopo on stackexchange. Thanks!
function yes_or_no {
    while true; do
        read -p "$* [y/n]: " yn
        case $yn in
            [Yy]*) echo 0 ; return 0  ;;
            [Nn]*) echo 1 ; return  1 ;;
        esac
    done
}

if [ $# -ne 2 ]
then
    print_usage
fi

ID=

if [[ $1 == "dk" ]]
then
    IFS=$'\n'
    for line in $(xinput list)
    do
        echo $line
        INP=$(yes_or_no "Is this the mouse?")
        if [ $INP -eq 0 ]
        then
            ID=$line
            break
        fi
    done
    echo $ID
    if [ -z $ID ]
    then
        echo "Nothing selected. Exiting..."
        exit 0
    fi
    echo ""
else
    ID=$(xinput list | grep $1 | grep pointer)
fi


IDD=$(echo $ID | awk '{ print $9 }')
IDD=${IDD#*=}

echo $ID
INP=$(yes_or_no "Is this the correct mouse?")
if [ $INP -eq 1 ]
then
    echo "Exiting..."
    exit 0
fi

xinput --set-prop $IDD 'libinput Accel Speed' $2
