#!/bin/bash
for i in *.${1:-wav}; do ffmpeg -i "$i" "${i%.*}.${2;-flac}"; done