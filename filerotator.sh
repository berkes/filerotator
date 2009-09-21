#
# File:        filerotator.sh
# Date:        2009-09-21  10:41
# Author:      Bèr Kessels <ber@webschuur.com>
#
# Description:
#   Filerotator runs over files in a directory and moves files older then X days
#   into a target directory. 
#   It then runs over the target directory and removes all files older then Y days
#   permanently
#
# License:
#   
#   Copyright (C) 2009  Bèr Kessels <ber@webschuur.com>
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.pro See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program. If not, see <http://www.gnu.org/licenses/>.



# Define variables for naming the target files
DATE=`date +%F-%H%M%s` # Datestamp e.g 20080109-220023
DOW=`date +%A` # Day of the week e.g. Monday
DNOW=`date +%u` # Day number of the week 1 to 7 where 1 represents Monday
DOM=`date +%d` # Date of the Month e.g. 27
M=`date +%B` # Month e.g January
W=`date +%V` # Week Number e.g 37
VER=0.1 # Version Number

SOURCE=/var/www/html # source directory being backed up
TARGET=/var/backup # target where backups will live
AGEMOVE=15 # number before files are moved to target
AGERM=15 # number days before backup files are removed

# Search SOURCE for all files last modified AGE or more days ago
# executes a recursive forced (-rf) remove (rm) on those files
# The "{}" (curly braces) is placeholder for exec to use where it will put filenames
# The "\;" tells exec that's the end of the statement.
# Replace "rm -rf" with "ls -la" to get a list of all the files that would be removed
# If you want to remove files with specific names or extensions use the "-name" argument.

# USE THIS TO REMOVE FILES
find "$TARGET" -mtime +"$AGE" -type f -exec rm -rf {} \;

# USE TO TEST THE FIND LOGIC
# find "$TARGET" -mtime +"$AGE" -type f -exec ls -alh {} \;

# Search SOURCE for all files last modified AGE or more days ago
# executes a recursive forced (-rf) remove (rm) on those files
# The "{}" (curly braces) is placeholder for exec to use where it will put filenames
# The "\;" tells exec that's the end of the statement.
# Replace "rm -rf" with "ls -la" to get a list of all the files that would be removed
# If you want to remove files with specific names or extensions use the "-name" argument.

# USE THIS TO MOVE FILES
find "$SOURCE" -mtime +"$AGE" -type f -exec mv {} $SOURCE/{} \;"

# USE TO TEST THE MOVE LOGIC
# find "$SOURCE" -mtime +"$AGE" -type f -exec ls -alh {} \;"
