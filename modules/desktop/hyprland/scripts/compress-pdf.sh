#!/usr/bin/env bash

# Exit immediately on unhandled errors
set -o pipefail

# Usage check
if [ "$#" -ne 2 ]; then
    echo "ERROR: Invalid number of arguments."
    echo "Usage: $0 <filename> <compression_level(1-4)>"
    exit 1
fi

input="$1"
level="$2"

# Capture paths (important for aliases)
exec_dir="$(pwd)"

# If input is relative, resolve it from execution directory
input="$exec_dir/$input"

# Check if input file exists
if [ ! -f "$input" ]; then
    echo "ERROR: Input file does not exist: $input"
    exit 2
fi

# Check if Ghostscript is installed
if ! command -v gs >/dev/null 2>&1; then
    echo "ERROR: Ghostscript (gs) is not installed or not in PATH."
    exit 3
fi

# Choose Ghostscript PDFSETTINGS based on compression level
case "$level" in
    4)
        setting="/screen"    # max compression, low quality
        att="max"
        ;;
    3)
        setting="/ebook"     # medium compression
        att="medium"
        ;;
    2)
        setting="/printer"   # good quality, larger file
        att="low"
        ;;
    1)
        setting="/prepress"  # best quality, minimal compression
        att="minimal"
        ;;
    *)
        echo "ERROR: Invalid compression level: $level"
        echo "Valid values are:"
        echo "  4 = max compression (low quality)"
        echo "  3 = medium compression"
        echo "  2 = low compression"
        echo "  1 = minimal compression (best quality)"
        exit 4
        ;;
esac

input_no_extension="${input%.pdf}"
output="${input_no_extension}_compressed_${att}.pdf"


echo "Starting PDF compression..."
echo "Input file:  $input"
echo "Output file: $output"
echo "Compression: $att ($setting)"

# Run Ghostscript
if ! gs -sDEVICE=pdfwrite \
        -dCompatibilityLevel=1.4 \
        -dPDFSETTINGS="$setting" \
        -dNOPAUSE -dQUIET -dBATCH \
        -sOutputFile="$output" "$input"; then
    echo "ERROR: Ghostscript failed during PDF compression."
    echo "Possible reasons:"
    echo " - Corrupt or unsupported PDF"
    echo " - Insufficient permissions"
    echo " - Not enough disk space"
    exit 5
fi

# Verify output file was created
if [ ! -f "$output" ]; then
    echo "ERROR: Compression finished but output file was not created."
    exit 6
fi

echo "Success! Compressed PDF created:"
echo "  $output"
