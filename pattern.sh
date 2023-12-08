#!/bin/bash

while true; do
    echo "Menu:"
    echo "1. Print pattern"
    echo "2. Display currently logged in usernames"
    echo "3. Display your terminal number"
    echo "4. Print addition of two floating point numbers"
    echo "5. Check if a string is palindrome"
    echo "6. Exit"

    read -p "Enter your choice (1-6): " choice

    case $choice in
        1)
            read -p "Enter the number of rows for the pattern: " num
            
            for(( i = num; i > 0 ; i--))
	    do
    		for(( j = 0; j < num-i; j++ ))
                do
                    echo -n " "
                done 
                for(( j = num; j > num-i; j--))
                do
                    echo -n "$j "	
                done

             echo ""
            done 
    
            ;;
        2)
            who | awk '{print $1}' | sort -u
            ;;
        3)
            echo "Your terminal number is: $$ "
            ;;
        4)
            read -p "Enter the first floating-point number: " num1
            read -p "Enter the second floating-point number: " num2
            result=$(echo "$num1 + $num2" | bc)
            echo "The addition of $num1 and $num2 is: $result"
            ;;
        5)
            read -p "Enter a string to check if it's a palindrome: " input_string
            reversed_string=$(echo "$input_string" | rev)
            if [ "$input_string" == "$reversed_string" ]; then
                echo "The string is a palindrome."
            else
                echo "The string is not a palindrome."
            fi
            ;;
        6)
            echo "Exiting the script. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 6."
            ;;
    esac
done

