#!/bin/bash

# Parameters
file_to_edit="README.md"
git_remote_url="https://github.com/vishal2115001124/loginfo.git"

# Set the start date
START_DATE="2023-12-10"

# Set the end date to 2024-07-09
END_DATE="2024-09-07"

# Set the fixed time for all commits
COMMIT_TIME="16:21:23"

# Set the commit message
COMMIT_MESSAGE="Random edit on"

# Create or update the file to commit
touch "$file_to_edit"

# Loop through the date range and commit every 3 days
while [ "$START_DATE" != "$END_DATE" ]; do
  # Create or update README.md file with the commit date
  echo "# Commit Date: $START_DATE" > "$file_to_edit"
  
  # Make a random edit to the file (e.g., add a comment)
  echo "# Random edit on $(date)" >> "$file_to_edit"
  
  # Add changes to git
  git add "$file_to_edit"
  
  # Commit changes with the current date
  GIT_AUTHOR_DATE="$START_DATE $COMMIT_TIME" GIT_COMMITTER_DATE="$START_DATE $COMMIT_TIME" git commit -m "$COMMIT_MESSAGE $START_DATE"
  
  # Push the commit to the remote repository
  git push "$git_remote_url" main
  
  echo "Changes committed and pushed for date: $START_DATE"
  
  # Increment the date by 3 days
  START_DATE=$(date -d "$START_DATE + 3 days" +"%Y-%m-%d")
done
