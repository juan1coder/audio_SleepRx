#!/bin/bash
#CTRL+SHIFT+F12

# Save the current directory
current_dir=$(pwd)

# Change directory to the external drive
cd /media/yonn/rootMX17/home/yonnlopez/audio

# Get current date and time
current_date=$(date +"%d-%b-%Y_%H.%M.%S%p")

# Define output file name
output_file="recording_$current_date.mp3"

# Record audio/video using ffmpeg in the background
xfce4-terminal -x sh -c "ffmpeg -f pulse -i default -c:a libmp3lame -b:a 128k \"$output_file\""

# Wait for a moment to ensure ffmpeg has started
sleep 1

# Display a GUI dialog for renaming the file
new_name=$(yad --entry --title "Rename File" --text "Type new file name or press Enter to keep, (without extension):")

# Check if a new name was provided
if [[ -n "$new_name" ]]; then
    # Rename the file
    mv "$output_file" "${new_name}_${current_date}.mp3"
    echo "File renamed to ${new_name}_${current_date}.mp3"
else
    echo "File name not changed."
fi

# Change back to the original directory
cd "$current_dir"
