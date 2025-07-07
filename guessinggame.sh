#!/bin/bash
 
# Function to get total number of regular files (including hidden) in current directory
function get_file_count {
  find . -maxdepth 1 -type f | wc -l
}
 
echo "Welcome to the Guessing Game!"
echo "Can you guess how many files are in the current directory?"
echo "(Note: It includes hidden files too!)"
 
# Actual file count
actual=$(get_file_count)
guess=-1
 
# Loop until user guesses correctly
while [[ $guess -ne $actual ]]
do
  read -p "Enter your guess: " guess
  if ! [[ $guess =~ ^[0-9]+$ ]]; then
    echo "Please enter a valid number."
  elif [[ $guess -lt $actual ]]; then
    echo "Too low!"
  elif [[ $guess -gt $actual ]]; then
    echo "Too high!"
  else
    echo "Congratulations! You guessed it right."
  fi
done
