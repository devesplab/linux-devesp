#!/usr/bin/env bash
#---------------------------------------------------------------------------
# RSYNC my MAC to WD USB
#
# The MAC source is the local drive.
# THe destination is the USB drive attached to the laptop.
#
# Requirements:
#   usb drive attached to usb port on laptop
#
# Key features:
# Backs up multiple data directories from /Users/devuser/Documents/DATA1-6 to a Lexar external drive
# Uses sensible rsync options:
# 	--recursive for subdirectories
# 	--verbose for detailed output
# 	--links to handle symlinks
# 	--update to skip newer files
# 	--delete to remove deleted files
# 	--append to resume partial transfers
# Excludes .DS_Store files via external exclude file
# Functions for each data directory (data1-6)
# Currently only running data1-3 (data4-6 are commented out)
#
# Usage:
#  Use --dry-run to test the sync, don't actually do it
#   SOURCE5=$MyDOCUMENTS/DATA\[M5\]/
#   DESTINATION5=$VOLUME_NAME/WORK/DATA\[M5\]
#   rsync -rvv --update --delete-after --dry-run "$SOURCE5" $DESTINATION5
# Remove --dry-run to perform the actual sync
# Don't forget the ending slash on the SOURCE
#
# The excludes do not work when using related paths
# 	EXCLUDE_OPTS="--exclude='*/.DS_Store' --exclude='*.box' --delete-excluded"
# Create a TXT file containing the exclude patterns and add the full path 
# 	EXCLUDE_OPTS="--exclude-from=/Users/devuser/bin/rsync_exclude.txt --delete-excluded --delete"
# The contents of the exclude file should be something like this:
#
#    -> cat /Users/devuser/bin/rsync_exclude.txt
#    .DS_Store
#
# Set it in RSYNC_OPTS.
#
# REFERENCE
# (a) add excludes file
# https://stackoverflow.com/questions/1053853/unable-to-exclude-ds-store-in-rsync
# https://itectec.com/askdifferent/macos-rsync-exclude-from-not-working/
#
# This script is intended to be run from the command line.
# It is not intended to be run from a GUI or as a cron job.
# Use at your own risk.
#
# author: devesplab
# license: GPLv3
#
# Last Modified: 
# Sun 2025May25 11:40:18 PDT -- Updated rsync options and logging configuration, added main function 
#
#---------------------------------------------------------------------------

VOLUME_NAME="/Volumes/My-USB-Drive" # Change this to your actual USB drive name
MyDOCUMENTS="/Users/devuser/Documents" # Change this to your actual Documents path
RSYNC_OPTS="--verbose --recursive --links --update --append --delete-after --dry-run" # remove --dry-run to actual sync when ready
EXCLUDE_OPTS="--exclude-from=/Users/devuser/bin/rsync_exclude.txt --delete-excluded" # Path to your exclude file

# Add logging configuration
LOG_DIR="/Users/devuser/logs"
LOG_FILE="$LOG_DIR/backup_$(date '+%Y%m%d_%H%M%S').log"
mkdir -p "$LOG_DIR"

# Function to log messages to both console and file
log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

##############################
# Backup /Users/devuser/Documents/DATA1
#
function data1() {
#- My MAC entire Documents Folder to WD USB
SOURCE1=$MyDOCUMENTS/DATA1/
DESTINATION1=$VOLUME_NAME/BACKUP/DATA1
 echo;echo "Syncing $SOURCE1 to $DESTINATION1"
	rsync $RSYNC_OPTS $EXCLUDE_OPTS $SOURCE1 $DESTINATION1
}

##############################
# Backup /Users/devuser/Documents/DATA2
#
function data2() {
SOURCE2=$MyDOCUMENTS/DATA2/
DESTINATION2=$VOLUME_NAME/BACKUP/DATA2
echo;echo "Syncing $SOURCE2 to $DESTINATION2"
	rsync $RSYNC_OPTS $EXCLUDE_OPTS $SOURCE2 $DESTINATION2
}

##############################
# Run all backup functions
function run_backup() {
	data1
	data2
}

##############################
# MAIN
function main() {

	# Redirect all output to both console and log file
	exec 1> >(tee -a "$LOG_FILE")
	exec 2>&1

	# Start the backup process
	log_message "Starting backup to $VOLUME_NAME"

	# Check if the volume is mounted
	if [ ! -d "$VOLUME_NAME" ]; then
		echo
		echo -e "Error: Backup drive not mounted at $VOLUME_NAME"
		echo
		exit 1
	fi

	# Run the backup functions
	run_backup

    # Check the exit status of the last command

    echo -e "\nBackup status:"
    if [ $? -eq 0 ]; then
        echo "Backup completed successfully"
    else 
        echo "Backup failed with error code $?"
    fi
    echo -e "\n"
    
    # Add log file location message
    log_message "Log file saved to: $LOG_FILE"
}

main "$@"