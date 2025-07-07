#!/bin/bash
WALLPAPER_DIR="$HOME/Imagens/Wallpapers"
FILE=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)
swww img "$FILE" --transition-type any --transition-fps 60 --transition-duration 1
