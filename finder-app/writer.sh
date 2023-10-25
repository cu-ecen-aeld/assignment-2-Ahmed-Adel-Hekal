#!/bin/bash


dir=$1
text=$2


if [ "${#}" -ne 2 ] 
then 
    echo " Error please provide directory and string "
    exit 1 
fi 

dirpath=$(dirname "$dir")

if [ ! -d ${dirpath} ]
then 
    mkdir -p "$dirpath" || { echo "Error" ; exit 1; }
fi 

echo "$text" > "$dir" || { echo "Error " ; exit 1; }