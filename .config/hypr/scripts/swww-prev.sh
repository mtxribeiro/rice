#!/bin/bash

INDEXFILE="$HOME/.config/hypr/.wallpaper-index"
WALLPAPER_DIR="$HOME/Imagens/Wallpapers"

mapfile -t IMAGES < <(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | sort)

TOTAL=${#IMAGES[@]}
[ "$TOTAL" -eq 0 ] && exit 1

INDEX=0
[ -f "$INDEXFILE" ] && read -r INDEX <"$INDEXFILE"
INDEX=$(((INDEX - 1 + TOTAL) % TOTAL))

swww img "${IMAGES[$INDEX]}" --transition-type any --transition-duration 1 --transition-fps 60
echo "$INDEX" >"$INDEXFILE"
