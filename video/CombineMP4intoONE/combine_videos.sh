#!/bin/bash

# Define the main directory and input directory
main_dir="${PWD}"
input_dir="${main_dir}/input_files"

# Print usage/help message
print_usage() {
  echo "Usage: $0 [-i input_directory] [-r downsize_ratio] [-h]"
  echo "  -i: Specify the path of the directory containing video files to be combined. If not provided, use ${input_dir}."
  echo "  -r: Specify the downsize ratio. If not provided, no downsizing is done."
  echo "  -h: Show this help message."
  echo "The output file will be saved in ${main_dir} if no input directory is specified, or the directory specified with -i."
}

# Create an empty file to hold the list of files
input_list="${main_dir}/input.txt"
echo "" > ${input_list}

# Get input directory and downsize ratio from the arguments
while getopts ":i:r:h" opt; do
  case ${opt} in
    i ) 
      input_dir=$OPTARG
      ;;
    r )
      downsize_ratio=$OPTARG
      ;;
    h )
      print_usage
      exit 0
      ;;
    \? )
      echo "Invalid option: -$OPTARG" 1>&2
      print_usage
      exit 1
      ;;
    : )
      echo "Invalid option: -$OPTARG requires an argument" 1>&2
      print_usage
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

# Go through files that start with a number and underscore in the input directory
for f in $(ls ${input_dir} | grep '^[0-9]*_.*'); do
  # Add each file to the list (with path relative to the current directory)
  echo "file '${input_dir}/${f}'" >> ${input_list}
done

# Sort the file list by the number prefix
sort -o ${input_list} ${input_list}

# Determine the output file
output_file="${input_dir}/output.mp4"

# If downsize ratio is not provided, default it to 1
if [ -z "${downsize_ratio}" ]; then
  downsize_ratio=1
fi

# Combine the sorted files and, if needed, downsize them
if [ "$downsize_ratio" != "1" ]; then
  ffmpeg -f concat -safe 0 -i ${input_list} -vf "scale=iw/${downsize_ratio}:ih/${downsize_ratio}" ${output_file}
else
  ffmpeg -f concat -safe 0 -i ${input_list} -c copy ${output_file}
fi

echo "Output file has been saved as ${output_file}."
