#!/bin/bash


dir=$1
text=$2


if [ "${#}" -ne 2 ] 
then 
    echo " Error please provide directory and string to look for "
    exit 1 
fi 

if [ ! -d ${dir} ]
then 
    echo " directory Not found"
    exit 1
fi

# Count the number of files in the directory and subdirectories
num_files=$(find "$dir" -type f | wc -l)





# Loop through each file in the directory and subdirectories to find matching lines
while IFS= read -r -d '' file; do
    num_matching_lines=$(grep -c "$text" "$file")
    lines=$((lines + num_matching_lines))
done < <(find "$dir" -type f -print0)

# Print the results
echo "The number of files are $num_files and the number of matching lines are $lines."

