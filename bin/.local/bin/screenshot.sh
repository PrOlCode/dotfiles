#!/bin/bash

: '
Screenshot utility script using maim, xdotool, and xclip.

Description:
    This script captures screenshots in different modes and saves them
    to ~/Pictures with a timestamp-based filename. After capture,
    the image is automatically copied to the clipboard.

Usage:
    ./script.sh [mode]

Modes:
    full
        Capture the entire screen.

    select
        Interactively select a region of the screen to capture.

    window
        Capture the currently active window.

Behavior:
    - Ensures the target directory (~/Pictures) exists.
    - Generates unique filenames using the current date and time.
    - Uses:
        maim      — for taking screenshots
        xdotool   — to get the active window ID (window mode)
        xclip     — to copy the image to the clipboard
        notify-send — to show an error notification for invalid mode

Output:
    Saved file:
        ~/Pictures/screenshot_YYYY-MM-DD_HH-MM-SS.png

    Clipboard:
        The captured image is copied as image/png.

Errors:
    If an invalid mode is provided, a desktop notification is shown
    and the script exits with status code 1.

Dependencies:
    maim, xdotool, xclip, libnotify (notify-send)

Example:
    ./script.sh full
    ./script.sh select
    ./script.sh window
'

DIR="$HOME/Pictures"
TIMESTAMP="$(date +%Y-%m-%d_%H-%M-%S)"
MODE="$1"

mkdir -p "$DIR"

case "$MODE" in
  full)
    FILE="$DIR/screenshot_$TIMESTAMP.png"
    maim "$FILE"
    ;;
  select)
    FILE="$DIR/screenshot_$TIMESTAMP.png"
    maim -s "$FILE"
    ;;
  window)
    FILE="$DIR/screenshot_$TIMESTAMP.png"
    WIN_ID=$(xdotool getactivewindow)
    maim -i "$WIN_ID" "$FILE"
    ;;
  *)
    notify-send "Screenshot" "Неверный режим: full | select | window"
    exit 1
    ;;
esac

# Copy to Clipboard
xclip -selection clipboard -t image/png -i "$FILE"
