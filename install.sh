#!/bin/bash

# This script downloads a zip archive from a specified URL,
# unzips it, moves all content from the extracted folder to the current directory,
# and finally cleans up the downloaded zip file and the empty extracted folder.

# Exit immediately if any command fails
set -e

# Define download URL and filenames
URL="https://github.com/CorrectRoadH/context-engineering-for-swift/releases/latest/download/context-engineering-for-swift.zip"
ZIP_FILE="main.zip"
# The directory name created after extraction, usually "repository-name-branch-name"
EXTRACTED_DIR="context-engineering-for-swift-main"

echo "Downloading from $URL..."
# -L: Follow redirects
# -o: Write output to a file instead of stdout
curl -L -o "$ZIP_FILE" "$URL"

echo "Unzipping $ZIP_FILE..."
# -o: Overwrite existing files without prompting
unzip -o "$ZIP_FILE"

# Check if the extracted directory exists
if [ ! -d "$EXTRACTED_DIR" ]; then
    echo "Error: Directory '$EXTRACTED_DIR' not found after extraction."
    echo "Please check the contents of the zip package."
    rm "$ZIP_FILE"
    exit 1
fi

echo "Moving files from '$EXTRACTED_DIR' to the current directory..."
# Use rsync to move all content, including hidden files (those starting with a dot).
# The trailing slash / after the source directory is important. It tells rsync to copy the contents of the directory, not the directory itself.
# -a: Archive mode, copies recursively and preserves file attributes.
rsync -a "$EXTRACTED_DIR/" .

echo "Cleaning up temporary files..."
# Remove the now-empty directory and the downloaded zip file
rm -r "$EXTRACTED_DIR"
rm "$ZIP_FILE"

echo "Installation complete!"
