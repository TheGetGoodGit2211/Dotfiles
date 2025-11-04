#!/usr/bin/env bash
# THIS LINE IS CRITICAL: Redirects all future STDOUT/STDERR for this shell
# and its children to /dev/null
exec &>/dev/null

WALLPAPER_DIR="$HOME/Documents/wallpapers"

WALLPAPER_LIST=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) -print0 2>/dev/null | tr '\0' '\n')

WALLPAPER_PATH=$(echo "$WALLPAPER_LIST" | tofi --prompt "Select Wallpaper:")

if [ -n "$WALLPAPER_PATH" ]; then
    # Even though the script is silenced, swww img will inherit this silence
    swww img "$WALLPAPER_PATH" --transition-type outer --transition-duration 0.75
    wal -i "$WALLPAPER_PATH"
fi
