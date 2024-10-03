#!/bin/bash

# Prompt the user for their name
read -p "Enter your name: " yourName

# Find the maximum number from the existing files
maxNumber=$(ls ${yourName}[0-9]* 2>/dev/null | sed -E "s/[^0-9]*([0-9]+).*/\1/" | sort -n | tail -n 1)

# If no files exist, start from 0
if [[ -z "$maxNumber" ]]; then
    maxNumber=0
fi

# Create the next 25 files
for i in {1..25}
do
    nextNumber=$((maxNumber + i))
    touch "${yourName}${nextNumber}"
done

echo "Created files from ${yourName}$((maxNumber + 1)) to ${yourName}$((maxNumber + 25))"

