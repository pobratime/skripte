#!/bin/bash

# Directory to start searching for C files
START_DIR="/Users/lukaajdukovic/Desktop/matf/programiranje1/cas3"

# Delete all .out files
find "$START_DIR" -type f -name "*.out" -exec rm -f {} +

# Traverse through each directory and sub-directory
find "$START_DIR" -type d | while read dir; do
    # For each C file in the directory
    find "$dir" -maxdepth 1 -name "*.c" | while read file; do
        # Extract the filename without the path and .c extension
        base_name=$(basename "$file" .c)
        
        # Compile the C file
        gcc "$file" -o "$dir/$base_name"
        
        # Check if compilation was successful
        if [[ $? -eq 0 ]]; then
            echo "Compiled $file to $dir/$base_name successfully!"
        else
            echo "Compilation of $file failed!"
        fi
    done
done