#!/bin/bash

# # Parameters
# file_to_edit="README.md"
# git_remote_url="https://github.com/vishal2115001124/loginfo.git"

#!/bin/bash

# Set the start date
START_DATE="2023-12-10"

# Set the end date to the current date
END_DATE="2024-07-09"

# Set the commit message
COMMIT_MESSAGE="Random edit on"

# Loop through the date range
while [ "$START_DATE" != "$END_DATE" ]; do
  # Commit changes with the current date
  git add .
  git commit -m "$COMMIT_MESSAGE $START_DATE" --date="$START_DATE 16:21:23"
  
  # Increment the date by 3 days
  START_DATE=$(date -d "$START_DATE + 3 days" +"%Y-%m-%d")
done

# Commit changes with the current date
git add .
git commit -m "$COMMIT_MESSAGE $END_DATE" --date="$END_DATE 16:21:23"