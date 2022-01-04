#!/bin/bash
# A simple shell script to pack up all the tasker XML files into a ZIP archive
# for easy downloading, unpacking, and importing into an Android phone.
#
#   Connor Shugg

# globals
C_NONE="\033[0m"
C_BAD="\033[31m"
C_GOOD="\033[32m"

# make sure we can run zip
zbin=$(which zip)
if [ -z "${zbin}" ]; then
    echo -e "${C_BAD}Error:${C_NONE} cannot find 'zip' executable."
    exit 1
fi

# get the repo directory path and make sure XML files are actually present
rdpath=$(dirname $(realpath $0))
if [ -z "$(ls ${rdpath} | grep 'xml')" ]; then
    echo -e "${C_BAD}Error:${C_NONE} cannot find any XML files in ${rdpath}."
    exit 2
fi

# look for the command-line argument (zip file path). If not found, we'll go
# with a default
zfpath=${rdpath}/taskery.zip
if [ $# -ge 1 ]; then
    zfpath=$1
fi

# iterate through all XML files present in the directory
echo "Writing zip archive: ${zfpath}"
for xmlf in ${rdpath}/*.xml; do
    #echo -n "  - Adding $(basename ${xmlf})... "
    ${zbin} -u ${zfpath} ${zf} ${xmlf}
done

