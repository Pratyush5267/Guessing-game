#!/bin/bash
 
function get_file_count {
  echo $(ls -1 | wc -l)
}
 
echo "Welcome to the Guessing Game!"
actual=$(get_file_count)
guess=-1
 
while [[ $guess -ne $actual ]]
do
  read -p "How many files are in the current directory? " guess
  if [[ $guess -lt $actual ]]; then
    echo "Too low!"
  elif [[ $guess -gt $actual ]]; then
    echo "Too high!"
  else
    echo "Congratulations! You guessed right!"
  fi
done
 



