# BillioTools
<<<<<<< HEAD
This is a tool kit that contains various scripts I use quite often in Mac OS, such as processing video and pdf files.
=======

BillioTools is a free and open-source project, providing a collection of handy scripts designed to streamline various tasks on MacOS. The aim of this repository is to offer an extensive tool kit that covers diverse areas such as video and PDF file processing. 

As an ongoing project, we are continuously adding more scripts to make your MacOS experience even smoother.

## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
- [Scripts](#scripts)
  - [convert_to_mp4](#convert_to_mp4)
  - [combine_videos](#combine_videos)
- [Contributing](#contributing)
- [License](#license)

## Installation

1. Clone this repository to your local machine.
```
git clone https://github.com/youyoubilly/BillioTools.git
```
2. Add the cloned directory to your system's PATH so you can run the scripts from any location.

## Usage

The scripts are designed to be run on MacOS and are organized by their functionality. For example, video-related scripts are in the 'video' directory. Navigate to the directory that contains the script you want to run, and execute it with the appropriate options.

## Scripts

### convert_to_mp4

This script takes a video file of any format supported by ffmpeg, converts it to .mp4, and optionally downsizes it based on the ratio provided. Use the `-i` flag to specify the input file, and the `-r` flag to specify the downsize ratio. If no downsize ratio is provided, the script will not change the size of the video.

```bash
./convert_to_mp4.sh -i input_file -r downsize_ratio
```

### combine_videos

This script combines multiple videos into one. It looks for videos in a directory that start with a number followed by an underscore (like "1_filename.mp4", "2_filename.mp4", etc.) and combines them in ascending order of the number. Use the `-i` flag to specify the input directory, and the `-r` flag to specify the downsize ratio for the output video. If no downsize ratio is provided, the script will not change the size of the videos.

```bash
./combine_videos.sh -i input_directory -r downsize_ratio
```

## Contributing

Contributions are always welcome!

## License

This project is free to use and is licensed under the [MIT License](LICENSE).
>>>>>>> 0166bd8 (first commit)
