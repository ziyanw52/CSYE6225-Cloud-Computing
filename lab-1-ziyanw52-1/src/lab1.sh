#!/bin/bash

TMP_DIR="tmp" # You may need to change this for your local testing.

# 1. Create Directory Structure
# Create the main 'project' directory and its subdirectories: 'data', 'scripts', 'logs', and 'backup'.
echo "Creating directory structure..."
# YOUR CODE HERE
mkdir -p /${TMP_DIR}/project/{data,scripts,logs,backup}

# 2. File Operations
# In the 'data' directory, create five text files and add some sample content to each.
echo "Creating files in the 'data' directory..."
# YOUR CODE HERE
touch /${TMP_DIR}/project/data/file1.txt /${TMP_DIR}/project/data/file2.txt /${TMP_DIR}/project/data/file3.txt /${TMP_DIR}/project/data/file4.txt /${TMP_DIR}/project/data/file5.txt
# add sample content
echo "Sample content for file 1" > /${TMP_DIR}/project/data/file1.txt
echo "Sample content for file 2" > /${TMP_DIR}/project/data/file2.txt
echo "Sample content for file 3" > /${TMP_DIR}/project/data/file3.txt
echo "Sample content for file 4" > /${TMP_DIR}/project/data/file4.txt
echo "Sample content for file 5" > /${TMP_DIR}/project/data/file5.txt

# Copy 'file1.txt' to the 'backup' directory.
echo "Copying 'file1.txt' to 'backup' directory..."
# YOUR CODE HERE
cp /${TMP_DIR}/project/data/file1.txt /${TMP_DIR}/project/backup/

# Rename 'file3.txt' to 'file3_renamed.txt'.
echo "Renaming 'file3.txt' to 'file3_renamed.txt'..."
# YOUR CODE HERE
mv /${TMP_DIR}/project/data/file3.txt /${TMP_DIR}/project/data/file3_renamed.txt

# Move 'file4.txt' and 'file5.txt' to the 'logs' directory. Force the move to avoid prompts.
echo "Moving 'file4.txt' and 'file5.txt' to 'logs' directory..."
# YOUR CODE HERE
mv -f /${TMP_DIR}/project/data/file4.txt /${TMP_DIR}/project/data/file5.txt /${TMP_DIR}/project/logs/


# Delete 'file2.txt' from the 'data' directory.
echo "Deleting 'file2.txt' from 'data' directory..."
# YOUR CODE HERE
rm -f /${TMP_DIR}/project/data/file2.txt

# 3. Directory Management
# List all files and directories within the 'project' directory with detailed information.
echo "Listing all files and directories with detailed information..."
# YOUR CODE HERE
ls -l /${TMP_DIR}/project/

# Display the total size of the 'data' and 'logs' directories.
echo "Displaying total size of 'data' and 'logs' directories..."
# YOUR CODE HERE
du -sh /${TMP_DIR}/project/data /${TMP_DIR}/project/logs

# Identify and display the 10 largest files and directories within the 'project' directory.
echo "Displaying the 10 largest files and directories in 'project'..."
# YOUR CODE HERE
du -ah /${TMP_DIR}/project | sort -rh | head -n 10

# 4. File Permissions and Ownership
# Set specific file permissions 644 for 'file1.txt' in the 'backup' directory.
echo "Setting file permissions 644 for 'file1.txt'..."
# YOUR CODE HERE
chmod 644 /${TMP_DIR}/project/backup/file1.txt

# Set specific file permissions 644 for 'file3_renamed.txt' in the 'data' directory.
echo "Setting file permissions 644 for 'file3_renamed.txt'..."
# YOUR CODE HERE
chmod 644 /${TMP_DIR}/project/data/file3_renamed.txt

# Change the ownership of 'file4.txt' in the 'logs' directory to another user and group (nobody:nogroup).
echo "Changing ownership of 'file4.txt'..."
# YOUR CODE HERE
sudo chown nobody:nogroup /${TMP_DIR}/project/logs/file4.txt

# 5. Symbolic Links
# Create a symbolic link in the 'scripts' directory pointing to 'backup/file1.txt' in the 'backup' directory.
echo "Creating symbolic link 'file1_link.txt' in 'scripts' directory..."
# YOUR CODE HERE
ln -s ../backup/file1.txt /${TMP_DIR}/project/scripts/file1_link.txt



# Manually verify that (use ls) the symbolic link has been created and points to the correct target.
echo "Verifying the symbolic link of file1.txt..."
# YOUR CODE HERE
ls -l /${TMP_DIR}/project/scripts/file1_link.txt

# 6. System Monitoring and Process Management
# Display the disk usage of the entire filesystem.
echo "Displaying disk usage of the filesystem..."
# YOUR CODE HERE
df -h

# List all running processes and specifically identify the process IDs related to Bash.
echo "Listing all running processes and finding PID of 'bash'..."
# YOUR CODE HERE
echo "Listing all running processes..."
ps aux

echo "Finding PIDs related to 'bash'..."
ps aux | grep '[b]ash'

echo "Process listing and bash PID search completed."

# 7. Automated Backup
# Create a compressed archive of the 'backup' directory and store it within the same directory.
# Use the current date to name the archive file.
echo "Creating a compressed archive of the 'backup' directory..."
# YOUR CODE HERE
tar -czf /${TMP_DIR}/backup_archive.tar.gz -C /${TMP_DIR}/project backup

# 9. Log Completion
# Create a log message indicating the completion of the assignment tasks and store it in a 'README.md' file inside the 'project' directory.
echo "Logging completion message..."
# YOUR CODE HERE
echo "All assignment tasks have been successfully completed on $(date)." >> /${TMP_DIR}/project/README.md


# 10. Directory Existence Verification
# Add a verification step at the end of the script to check if the 'data' directory exists. If it doesn’t, the script should log an error message and exit.
# YOUR CODE HERE
echo "Verifying if 'data' directory exists..."
if [ -d "/${TMP_DIR}/project/data" ]; then
    echo "'data' directory exists."
else
    echo "Error: 'data' directory does not exist." >> /${TMP_DIR}/project/README.md
    exit 1
fi
