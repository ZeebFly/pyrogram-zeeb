#!/bin/bash

echo "Starting rename process..."

# Rename folders
find . -depth -type d -name "*pyrogram_navy*" | while read dir; do
    new_dir="${dir//pyrogram_navy/pyrogram_zeeb}"
    mv "$dir" "$new_dir"
    echo "Renamed folder: $dir -> $new_dir"
done

# Rename files
find . -depth -type f -name "*pyrogram_navy*" | while read file; do
    new_file="${file//pyrogram_navy/pyrogram_zeeb}"
    mv "$file" "$new_file"
    echo "Renamed file: $file -> $new_file"
done

find . -depth -type f -name "*pyrogram-navy*" | while read file; do
    new_file="${file//pyrogram-navy/pyrogram-zeeb}"
    mv "$file" "$new_file"
    echo "Renamed file: $file -> $new_file"
done

# Replace content in files
echo "Replacing content in files..."
find . -type f \( -name "*.py" -o -name "*.txt" -o -name "*.md" -o -name "*.cfg" -o -name "*.ini" -o -name "*.toml" -o -name "*.json" -o -name "setup.py" -o -name "README*" \) -exec sed -i 's/pyrogram_navy/pyrogram_zeeb/g' {} +
find . -type f \( -name "*.py" -o -name "*.txt" -o -name "*.md" -o -name "*.cfg" -o -name "*.ini" -o -name "*.toml" -o -name "*.json" -o -name "setup.py" -o -name "README*" \) -exec sed -i 's/pyrogram-navy/pyrogram-zeeb/g' {} +

echo "Rename complete!"
