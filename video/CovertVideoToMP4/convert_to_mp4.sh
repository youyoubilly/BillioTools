#!/bin/bash

# Define where the output files will be saved
output_dir="${PWD}"

# Print usage/help message
print_usage() {
  echo "Usage: $0 -i input_file [-r downsize_ratio]"
  echo "  -i: Specify the path of the video file."
  echo "  -r: Specify the downsize ratio. If not provided, no downsizing is done."
  echo "  -h: Show this help message."
  echo "Output file will be saved to ${output_dir}"
}

# Get input file and downsize ratio from the arguments
while getopts ":i:r:h" opt; do
  case ${opt} in
    i ) 
      input_file=$OPTARG
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

# Check if input file is provided
if [ -z "${input_file}" ]; then
  echo "Input file must be provided with -i flag."
  print_usage
  exit 1
fi

# If downsize ratio is not provided, default it to 1
if [ -z "${downsize_ratio}" ]; then
  downsize_ratio=1
fi

# Convert the input file to mp4, and if needed, downsize it
output_file="${output_dir}/output.mp4"
if [ "$downsize_ratio" != "1" ]; then
  ffmpeg -i "${input_file}" -vf "scale=iw/${downsize_ratio}:ih/${downsize_ratio}" "${output_file}"
else
  ffmpeg -i "${input_file}" "${output_file}"
fi

# Print out the location of the output file
echo "Output file has been saved to ${output_file}"
