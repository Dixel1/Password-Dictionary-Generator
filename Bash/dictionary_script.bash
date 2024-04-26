#!/bin/bash
# v0.5
# Autor: Dixel - https://github.com/Dixel1

# Define the maximum and minimum length of the passwords
min_length=2
max_length=4

# Create the output file
output_file="dictionary.txt"

# Define all possible characters - Actually, there's a generation issue when "*" character is used
chars=({a..z} {A..Z} {0..9} '~' '!' '@' '#' '$' '%' '^' '&' "*" '(' ')' '_' '+' '-' '=' '{' '}' '[' ']' '\\' '|' ';' "'" ':' '"' '<' '>' ',' '.' '?' '/')

# Print a message to the user
echo "Starting password dictionary generation..."

# Function to generate combinations
generate_combinations() {
  local current=$1
  local len=$2
  if [ $len -eq 0 ]
  then
    echo $current | tee -a $output_file
  else
    for char in "${chars[@]}"
    do
      generate_combinations "$current$char" $((len-1))
    done
  fi
}

# Loop through the possible lengths
for ((i=min_length; i <= max_length; i++))
do
  generate_combinations "" $i
done

# Close the output file
echo "Password dictionary generation complete."
exit 0
