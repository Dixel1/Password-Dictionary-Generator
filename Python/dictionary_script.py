# v0.2
# Autor: Dixel - https://github.com/Dixel1

import itertools
import string

# Define the maximum length of the passwords
max_length = 4

# Define all possible characters
chars = string.ascii_letters + string.digits + string.punctuation

# Create the output file
with open("dictionary.txt", "w") as output_file:
    # Loop through the possible lengths
    for i in range(max_length + 1):
        # Generate all combinations of characters of length i
        for combination in itertools.product(chars, repeat=i):
            # Write the combination to the file
            password = ''.join(combination)
            output_file.write(password + '\n')
            # Print the password
            print(password)

print("Password dictionary generation complete.")
