#!/bin/bash
# List of YouTube URLs
urls=("https://www.youtube.com/watch?v=Fj7SEIhPC6k&list=PLHO72XDWKOWHsW41NzyOCFQjzIVY3avEQ&index=5")

# Loop through each URL and run yt-dlp command
for url in "${urls[@]}"; do
    echo "Downloading audio from: $url"
    yt-dlp -f bestaudio --extract-audio --audio-format mp3 --ffmpeg-location /usr/local/bin/ffmpeg "$url"
    echo "Finished downloading: $url"
    echo "---------------------------------"
done

