#!/bin/bash
 
# Function to count all regular files (including hidden) in the current directory
get_file_count() {
  find . -maxdepth 1 -type f | wc -l
}
 
echo "Welcome to the Guessing Game!"
echo "Your task is to guess how many files are in the current directory."
echo "(Note: This includes hidden files, but only regular files — not directories.)"
 
# Actual number of files
actual=$(get_file_count)
guess=""
 
# Loop until the correct guess is made
while [[ "$guess" != "$actual" ]]
do
  read -p "Enter your guess: " guess
 
  # Validate that input is a number
  if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a numeric value."
  elif [[ "$guess" -lt "$actual" ]]; then
    echo "Too low!"
    echo "Please try again."
  elif [[ "$guess" -gt "$actual" ]]; then
    echo "Too high!"
    echo "Please try again."
  else
    echo "Congratulations! You guessed it right. There are $actual files."
  fi
done
