# Log Archive Tool

A tool for archiving logs from the command line with date and time.

[A roadmap.sh project](https://roadmap.sh/projects/log-archive-tool)

# Log Archive Tool

A command-line tool to archive logs with date and time stamps. This script compresses log files from a specified directory into a `tar.gz` archive and stores them in a new directory for easy management and future reference.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Example](#example)
- [Script Code](#script-code)
- [Automate with Cron](#automate-with-cron)
- [Contributing](#contributing)

## Prerequisites

- Unix-based operating system (Linux, macOS)
- Bash shell
- Basic knowledge of command-line interface
- Git installed (optional, for contributing)

## Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/your_username/log-archive-tool.git

2.  Navigate to the Project Directory
cd log-archive-tool

3.  Make the Script Executable
chmod +x log-archive

Usage
The script accepts the log directory as an argument, compresses the logs into a tar.gz file, and stores them in an archives directory. It also logs the date and time of each archive operation.

Syntax:
./log-archive <path_to_log_directory>

<path_to_log_directory>: The directory containing the logs you want to archive (e.g., /var/log).

Example
To archive logs from /var/log: 
./log-archive /var/log

Expected Output:
Logs have been archived to archives/logs_archive_YYYYMMDD_HHMMSS.tar.gz

An archives directory will be created (if it doesn't exist), containing:

The compressed archive (e.g., logs_archive_20241018_120000.tar.gz)
A log file (archive_log.txt) recording the date and time of each archive

Script Code
Here is the content of the log-archive script:
#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]
then
  echo "Usage: log-archive <path_to_log_directory>"
  exit 1
fi

LOG_DIR="$1"

# Check if the log directory exists
if [ ! -d "$LOG_DIR" ]
then
  echo "Directory $LOG_DIR not found."
  exit 1
fi

# Generate a timestamp for the archive name
DATE_TIME=$(date +%Y%m%d_%H%M%S)
ARCHIVE_NAME="logs_archive_${DATE_TIME}.tar.gz"

# Create the archives directory if it doesn't exist
ARCHIVE_DIR="archives"
mkdir -p "$ARCHIVE_DIR"

# Compress the logs
tar -czf "${ARCHIVE_DIR}/${ARCHIVE_NAME}" -C "$LOG_DIR" .

# Log the date and time of the archiving
echo "Archive created: ${DATE_TIME}" >> "${ARCHIVE_DIR}/archive_log.txt"

echo "Logs have been archived to ${ARCHIVE_DIR}/${ARCHIVE_NAME}"

Key Components:

Argument Checking: Ensures the user provides a log directory.
Directory Verification: Checks if the specified log directory exists.
Timestamp Generation: Creates a unique archive name based on the current date and time.
Archiving Process: Compresses the log files into a tar.gz archive.
Logging: Records the date and time of each archiving operation.
User Feedback: Outputs a message indicating the location of the archived logs.

Automate with Cron
To run the script automatically on a schedule, you can use cron.

Edit the Crontab:
crontab -e

Add a Cron Job:
For daily archiving at midnight, add:
0 0 * * * /path/to/log-archive /var/log

Replace /path/to/log-archive with the actual path to the log-archive script.

Save and Exit:

Save the changes to apply the new cron job.

Contributing
Contributions are welcome! Follow these steps to contribute:

Fork the Repository

Click on the 'Fork' button on the repository page to create a copy under your GitHub account.

Clone Your Fork
git clone https://github.com/your_username/log-archive-tool.git

Create a Feature Branch
git checkout -b feature/your-feature-name

Make Changes and Commit
git add .
git commit -m "Add your message here"

Push to Your Fork
git push origin feature/your-feature-name

Create a Pull Request

Go to the original repository and click on 'New Pull Request'.
# ssh_remote_server_setup_solutions
