# v0.3
# Autor: Dixel - https://github.com/Dixel1

# Define the minimum and maximum length of the passwords
$min_length = 2
$max_length = 4

# Define all possible characters
$chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789~!@#$%^&*()_+-={}|[]\;''":",.<>/?'

# Create the output file
$output_file = New-Item -ItemType File -Force -Path "dictionary.txt"

# Print a message to the user
Write-Host "Starting password dictionary generation..."

# Function to generate combinations
function Generate-Combinations {
    param (
        [string]$current,
        [int]$len
    )
    if ($len -eq 0) {
        Add-Content -Path $output_file -Value $current
        Write-Host $current  # Print the password in real time
    } else {
        foreach ($char in $chars.ToCharArray()) {
            Generate-Combinations -current ($current + $char) -len ($len - 1)
        }
    }
}

# Loop through the possible lengths
for ($i = $min_length; $i -le $max_length; $i++) {
    Generate-Combinations -current "" -len $i
}

# Print completion message
Write-Host "Password dictionary generation complete."
