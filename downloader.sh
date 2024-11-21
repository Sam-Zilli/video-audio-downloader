#!/bin/bash
# List of YouTube URLs
urls=(“https://www.youtube.com/watch?v=iJ7TpJPGiCE”,
    “https://www.youtube.com/watch?v=VRCB3Mwf-3w”,
    “https://www.youtube.com/watch?v=xgCvUYuQdvw”,
    “https://www.youtube.com/watch?v=8lUylRDnmrE”,
    “https://www.youtube.com/watch?v=Ul7m2qpzYBk”,
    “https://www.youtube.com/watch?v=RjBJGXhHOOo”)
# Loop through each URL and run yt-dlp command
for url in “${urls[@]}“; do
    echo “Downloading audio from: $url”
    yt-dlp -f bestaudio --extract-audio --audio-format mp3 --ffmpeg-location /usr/local/bin/ffmpeg “$url”
    echo “Finished downloading: $url”
    echo “---------------------------------”
done
