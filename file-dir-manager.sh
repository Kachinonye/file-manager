#!/bin/bash

# File: file_dir_manager.sh

# A simple script to create/delete files or directories with features for clarity

echo "Welcome to the File/Directory Manager"

function show_menu {
    echo ""
    echo "Please choose an option:"
    echo "1) Create a file"
    echo "2) Delete a file"
    echo "3) Create a directory"
    echo "4) Delete a directory"
    echo "5) Exit"
}

while true; do
    show_menu
    read -p "Enter your choice [1-5]: " choice

    case "$choice" in
        1)
            read -p "Enter filename to create: " filename
            if [ -e "$filename" ]; then
                echo "File '$filename' already exists."
            else
                touch "$filename" && echo "File '$filename' created."
            fi
            ;;
        2)
            read -p "Enter filename to delete: " filename
            if [ -e "$filename" ]; then
                rm "$filename" && echo "File '$filename' deleted."
            else
                echo "File '$filename' does not exist."
            fi
            ;;
        3)
            read -p "Enter directory name to create: " dirname
            if [ -d "$dirname" ]; then
                echo "Directory '$dirname' already exists."
            else
                mkdir "$dirname" && echo "Directory '$dirname' created."
            fi
            ;;
        4)
            read -p "Enter directory name to delete: " dirname
            if [ -d "$dirname" ]; then
                rmdir "$dirname" && echo "Directory '$dirname' deleted."
            else
                echo "Directory '$dirname' does not exist."
            fi
            ;;
        5)
            echo "Goodbye!"
            break
            ;;
        *)
            echo "Invalid option, please try again."
            ;;
    esac
done
