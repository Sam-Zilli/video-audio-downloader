# YouTube Audio Downloader

## Tips:
Give it the url to a youtube playlist to download them all!


## Description

This is a simple Bash script that uses `yt-dlp` to download from YouTube URLs. You can choose to download:

- Audio only: FLAC (lossless) or MP3 (smaller files, up to 320 kbps)
- Audio + video: MP4

## Requirements

Before running the script, you need to install the following tools:

- **yt-dlp**: A command-line program to download videos from YouTube and other sites.
- **ffmpeg**: A tool for converting multimedia files to various formats.

### Installation

To install the required tools, you can use Homebrew (macOS/Linux package manager). If you don't have Homebrew installed, you can follow the instructions at [https://brew.sh](https://brew.sh).

1. **Install `yt-dlp`:**

   ```bash
   brew install yt-dlp


2. **Install ffmpeg**

   ```bash
   brew install ffmpeg


### Execution

1. **Making it Executable:**
   
   ```bash
   chmod +x downloader.sh

2. **Run the Script**

   ```bash
   ./downloader.sh
   ```

3. **Follow the prompts**

   - Choose whether you want audio only or audio + video.
   - If audio only, select `FLAC` for lossless or `MP3` for smaller files.