#!/bin/bash
yt-dlp -o - "$1" -f "bv*[height=${2:-1080}]+ba" | vlc -