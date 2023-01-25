#!/bin/bash

# Check if parameter is passed
if [[ -z $1 ]]; then
echo "Error: Please provide a directory path as a parameter."
exit 1
fi

# Check if parameter is a valid directory
if [[ ! -d $1 ]]; then
echo "Error: The provided parameter is not a valid directory."
exit 1
fi

# Add trailing '/' if not present
dir_path="$1"
if [[ ${dir_path: -1} != '/' ]]; then
dir_path="$dir_path/"
fi

# Start timer
start_time=$(date +%s)

# Total number of folders
total_folders=$(find "$dir_path" -type d | wc | awk '{print $1}')
echo "Total number of folders (including all nested ones) = $total_folders"

# Top 5 folders with largest size
echo "TOP 5 Folders of maximum size arranged in descending order (path and size):"
top_folders=($(du -h --max-depth=1 "$dir_path" | sort -rh))
for i in {0..4}; do
echo "$((i+1)) - ${top_folders[$i]}"
done

# Total number of files
total_files=$(find "$dir_path" -type f | wc | awk '{print $1}')
echo "Total number of files = $total_files"

# Number of different types of files
conf_files=$(find "$dir_path" -type f -name ".conf" | wc | awk '{print $1}')
text_files=$(find "$dir_path" -type f -name ".txt" | wc | awk '{print $1}')
exe_files=$(find "$dir_path" -type f -executable | wc | awk '{print $1}')
log_files=$(find "$dir_path" -type f -name ".log" | wc | awk '{print $1}')
archive_files=$(find "$dir_path" -type f -name ".zip" -o -name ".tar" -o -name ".gz" | wc | awk '{print $1}')
sym_links=$(find "$dir_path" -type l | wc | awk '{print $1}')
echo "Number of:"
echo "Configuration files (with the .conf extension) = $conf_files"
echo "Text files = $text_files"
echo "Executable files = $exe_files"
echo "Log files (with the extension .log) = $log_files"
echo "Archive files = $archive_files"
echo "Symbolic links = $sym_links"

# Top 10 files with largest size in descending order (path, size and type)
top_files=$(find "$1" -type f -printf '%s %p\n' | sort -nr | head -n 10)
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
while read -r line; do
    size=$(echo "$line" | awk '{print $1}')
    path=$(echo "$line" | awk '{print $2}')
    ext=$(echo "$path" | awk -F . '{if (NF>1) {print $NF}}')
    echo "$path, $size, $ext"
done <<< "$top_files"


# Find all executable files in the specified directory
exec_files=$(find "$1" -type f -executable)

# For each file, get the path, size, and hash
top_10_exec_files=$(for file in $exec_files; do echo $(stat -c '%s %n' "$file") $(md5sum "$file" | awk '{print $1}'); done)

# Sort the files by size in descending order and get the top 10
top_10_exec_files=$(echo "$top_10_exec_files" | sort -nrk1 | head -10)

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"

# Output the path, size, and hash for each file
counter=1
while read -r line; do
  size=$(echo "$line" | awk '{print $1}')
  path=$(echo "$line" | awk '{print $2}')
  hash=$(echo "$line" | awk '{print $3}')
  echo "$counter - $path, $size, $hash"
  counter=$((counter+1))
done <<< "$top_10_exec_files"

end_time=$(date +%s.%N)
elapsed_time=$(echo "$end_time - $start_time" | bc)
echo "Script execution time (in seconds) = $elapsed_time"