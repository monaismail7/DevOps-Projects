#!/bin/bash

# Exit immediately if any command fails
set -euo pipefail


# Check input
if [ -z "$1" ]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

LOG_DIR=$1

if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory does not exist."
    exit 1
fi

# Timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Archive name
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"

# Archive directory
ARCHIVE_DIR="$HOME/log_archives"
mkdir -p $ARCHIVE_DIR

# Compress logs
tar -czf $ARCHIVE_DIR/$ARCHIVE_NAME $LOG_DIR

# Logging
LOG_FILE="$ARCHIVE_DIR/archive_log.txt"
LOG_FILE="$ARCHIVE_DIR/archive_log.txt"
echo "$(date '+%Y-%m-%d %H:%M:%S') | ARCHIVE | $LOG_DIR -> $ARCHIVE_NAME" >> "$LOG_FILE"


# Output
echo "============================"
echo "Archive created successfully"
echo "Location: $ARCHIVE_DIR/$ARCHIVE_NAME"
echo "Time: $(date)"
echo "============================"

# Root warning
if [ "$EUID" -ne 0 ]; then
    echo "Warning: You are not root. Some files may be skipped."
fi
