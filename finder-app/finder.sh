if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required."
    echo "Usage: $0 <directory_path> <search_string>"
    exit 1
fi

# Assign arguments to descriptive variable names
filesdir=$1
searchstr=$2

# Check if the first argument (filesdir) is a valid directory
if [ ! -d "$filesdir" ]; then
    echo "Error: '${filesdir}' is not a valid directory."
    exit 1
fi

# Find the total number of files in the directory and its subdirectories.
# 'find ... -type f' lists all files. 'wc -l' counts the lines of output.
num_files=$(find "$filesdir" -type f | wc -l)

# Find the number of lines containing the search string in all files.
# 'grep -r' searches recursively. 'wc -l' counts the matching lines.
num_matching_lines=$(grep -r "$searchstr" "$filesdir" | wc -l)

# Print the final result
echo "The number of files are ${num_files} and the number of matching lines are ${num_matching_lines}"

exit 0
