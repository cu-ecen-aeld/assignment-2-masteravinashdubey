if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required."
    echo "Usage: $0 <full_file_path> <string_to_write>"
    exit 1
fi

# Assign arguments to descriptive variable names
writefile=$1
writestr=$2

# Get the directory path from the full file path
writedir=$(dirname "$writefile")

# Create the directory path. The '-p' option is crucial as it creates parent
# directories as needed and does not return an error if the path already exists.
mkdir -p "$writedir"

# Check if the directory creation failed (e.g., due to permissions)
if [ $? -ne 0 ]; then
    echo "Error: Could not create directory path for '${writefile}'."
    exit 1
fi

# Write the string to the file, overwriting the file if it already exists.
# The '>' operator handles file creation and overwriting.
echo "$writestr" > "$writefile"

# Check if the file write operation failed.
if [ $? -ne 0 ]; then
    echo "Error: Could not write to the file '${writefile}'."
    exit 1
fi

# If the script reaches this point, all operations were successful.
exit 0