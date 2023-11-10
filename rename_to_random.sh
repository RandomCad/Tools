#! /usr/bin/bash

dir="/dev/null"
file="file"

# Parse command-line options
while [[ $# -gt 0 ]]; do
  case "$1" in
    -d|--dir)
      dir="$2"
      shift 2
      ;;
    -n|--name)
      file="$2"
      shift 2
      ;;
    -h|--help)
      echo "Renames ol files in -d [Directory] linearly to the given in -n [name] plus a number."
      echo "If no name is given the files will be renamed to 'file' followed by the number."
      ;;
  esac
done


j=1
for i in $(ls $dir) ; do
  echo "from: " $dir$i
  echo "to:   " $dir$file$j$(echo $i | grep -q "\." && echo $i | grep -o "\..*")

  mv $dir$i $dir$file$j$(echo $i | grep -q "\." && echo $i | grep -o "\..*")

  j=$(($j + 1))
done
