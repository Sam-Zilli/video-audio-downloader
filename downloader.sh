# List of YouTube URLs
urls=("https://www.youtube.com/watch?v=aqppZxzDAd0&list=PLkSTRZEW8Aec6mOKrhMXjMqKlSNlJDtAq")

# Find FFmpeg location
FFMPEG_PATH=$(which ffmpeg 2>/dev/null || echo "")

# Ask the user where to save the file (append to the default directory if needed)
echo "Enter the directory where you want to save the downloaded files:"
read -r custom_dir

# Default download directory
download_dir="/Users/sam/Desktop/video_audio_downloads/"

# If the user provides a custom directory, append it to the default directory
if [ -n "$custom_dir" ]; then
    download_dir="$download_dir/$custom_dir"
fi

# Create the download directory if it doesn't exist
mkdir -p "$download_dir"

# Ask if the user wants audio-only or audio + video
echo "Do you want to download audio only (1) or audio + video (2)? Enter 1 or 2:"
read -r choice

# Loop through each URL and run yt-dlp command based on the user's choice
for url in "${urls[@]}"; do
    if [ "$choice" -eq 1 ]; then
        echo "Downloading audio from: $url"
        yt-dlp -f bestaudio --extract-audio --audio-format mp3 ${FFMPEG_PATH:+--ffmpeg-location "$FFMPEG_PATH"} -o "$download_dir/%(title)s.%(ext)s" "$url"
        echo "Finished downloading audio: $url"
    elif [ "$choice" -eq 2 ]; then
        echo "Downloading audio + video from: $url"
        yt-dlp -f bestvideo+bestaudio --merge-output-format mp4 -o "$download_dir/%(title)s.%(ext)s" "$url"
        echo "Finished downloading audio + video: $url"
    else
        echo "Invalid choice. Please run the script again and select 1 or 2."
        exit 1
    fi
    echo "---------------------------------"
done
