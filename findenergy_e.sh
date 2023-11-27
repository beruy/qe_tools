#!/bin/bash

# Output file
output_file="total_energies.txt"

# Clear the output file
echo -n "" > $output_file

# Loop over numbers for folder names
#for i in $(seq 4 4 100); do
for i in $(seq 10 10 100); do
  # Construct the folder name
  folder="${i}"

  # Check if the folder exists
  if [[ -d $folder ]]; then
    # Find Quantum Espresso output files in the folder
    files=$(find $folder -name "*.out")

    # Loop over files
    for file in $files; do
      # Extract total energy using awk and append to the output file
      awk -v folder="$folder" '/!    total energy/ {print folder,"",$5}' $file >> $output_file
    done
  fi
done
