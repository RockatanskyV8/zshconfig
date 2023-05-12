#!/bin/bash

# Check if input directory was specified
if [ $# -ne 1 ]; then
    echo "Usage: $0 <input_directory>"
    exit 1
fi

INPUT_DIR="$1"

# Convert all PDF files in input directory to HTML
for pdf_file in "$INPUT_DIR"/*.pdf; do
    echo "Converting $pdf_file to HTML..."
    pdftohtml "$pdf_file"
done

# Dump the content of all s.html files to text files with the same name as the original PDF file
for html_file in "$INPUT_DIR"/*s.html; do
    echo "Dumping content of $html_file to text file..."
    w3m -dump -o display_charset=UTF-8 "$html_file" > "${html_file%.html}.txt"
done

# Remove all HTML files
echo "Removing all HTML files..."
rm "$INPUT_DIR"/*.html
