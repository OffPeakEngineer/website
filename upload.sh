#!/bin/bash
set -e

# Define variables
BUCKET_NAME="gs://off-peak.engineer"

# Exclude list
EXCLUDES=(
  ".git"
  "upload.sh"
  "LICENSE"
  "README.md"
  ".gitignore"
)

# Construct exclude pattern for gcloud storage rsync
EXCLUDE_PATTERN=$(IFS='|'; echo "${EXCLUDES[*]}")

# Sync all files and folders in the current directory to the Google Cloud bucket using gcloud storage rsync
gcloud storage rsync ./ "$BUCKET_NAME" -r --delete-unmatched-destination-objects --exclude "$EXCLUDE_PATTERN"

# Print a completion message
echo "Upload to $BUCKET_NAME completed successfully."
