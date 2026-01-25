#!/bin/bash

if ! command -v ffmpeg &> /dev/null; then
    echo "no ffmpeg found!"
    exit 1
fi

if [ -z "$1" ]; then
    echo "usage: ./video_compress.sh /path/to/input/video/file"
    exit 1
fi

INPUT="$1"
FILENAME="${INPUT%.*}"
OUTPUT="${FILENAME}_compressed.mp4"

echo "compressing: $INPUT -> $OUTPUT"

echo "----------------------------------------"

ffmpeg -hwaccel vaapi -hwaccel_device /dev/dri/renderD128 -hwaccel_output_format vaapi \
    -i "$INPUT" \
    -vf "format=nv12|vaapi,hwupload,scale_vaapi=854:480:format=nv12" \
    -c:v h264_vaapi \
    -rc_mode VBR \
    -b:v 400k \
    -compression_level 7 \
    -global_quality 24 \
    -maxrate 1000k \
    -bufsize 2000k \
    -c:a aac -b:a 96k -ar 44100 \
    -movflags +faststart \
    -y "$OUTPUT"

echo "----------------------------------------"
echo "compress finished."
echo "original file size:   $(du -h "$INPUT" | cut -f1)"
echo "compressed file size: $(du -h "$OUTPUT" | cut -f1)"
