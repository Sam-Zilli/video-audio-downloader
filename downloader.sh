# List of YouTube URLs
urls=("https://www.youtube.com/watch?v=ic8j13piAhQ")

# Find FFmpeg location
FFMPEG_PATH=$(which ffmpeg 2>/dev/null || echo "")

# Ask the user where to save the file (append to the default directory if needed)
echo "Enter the directory where you want to save the downloaded files:"
read -r custom_dir

# Default download directory
download_dir="/Users/sam/Desktop/"

# If the user provides a custom directory, append it to the default directory
if [ -n "$custom_dir" ]; then
    download_dir="$download_dir/$custom_dir"
fi

# Create the download directory if it doesn't exist
mkdir -p "$download_dir"

# Ask if the user wants audio-only or audio + video
echo "Do you want to download:"
echo "1. Audio only"
echo "2. Audio + video (MP4)"
echo "Warning - video downloads are slow... Enter 1 or 2:"
read -r choice

# If audio-only, ask which audio format (FLAC lossless or MP3)
AUDIO_FORMAT=""
if [ "$choice" = "1" ]; then
    echo "Choose audio format:"
    echo "1. Lossless (FLAC)"
    echo "2. MP3 (smaller files)"
    echo "Enter 1 or 2 (or type 'flac'/'mp3'):"
    read -r audio_choice
    case "${audio_choice}" in
        1|flac|FLAC)
            AUDIO_FORMAT="flac"
            ;;
        2|mp3|MP3)
            AUDIO_FORMAT="mp3"
            ;;
        *)
            echo "Invalid audio format choice. Please select 1 (FLAC) or 2 (MP3)."
            exit 1
            ;;
    esac
    echo "Selected audio format: ${AUDIO_FORMAT}"
fi

# Loop through each URL and run yt-dlp command based on the user's choice
for url in "${urls[@]}"; do
    if [ "$choice" = "1" ]; then
        if [ "$AUDIO_FORMAT" = "mp3" ]; then
            echo "Downloading audio (MP3) from: $url"
            yt-dlp -f bestaudio --extract-audio --audio-format mp3 --audio-quality 320k ${FFMPEG_PATH:+--ffmpeg-location "$FFMPEG_PATH"} -o "$download_dir/%(title)s.%(ext)s" "$url"
            echo "Finished downloading audio (MP3): $url"
        else
            echo "Downloading audio (FLAC lossless) from: $url"
            yt-dlp -f bestaudio --extract-audio --audio-format flac ${FFMPEG_PATH:+--ffmpeg-location "$FFMPEG_PATH"} -o "$download_dir/%(title)s.%(ext)s" "$url"
            echo "Finished downloading audio (FLAC): $url"
        fi
    elif [ "$choice" = "2" ]; then
        echo "Downloading audio + video from: $url"
        yt-dlp -f bestvideo+bestaudio --merge-output-format mp4 -o "$download_dir/%(title)s.%(ext)s" "$url"
        echo "Finished downloading audio + video: $url"
    else
        echo "Invalid choice. Please run the script again and select 1 or 2."
        exit 1
    fi
    echo "---------------------------------"
done