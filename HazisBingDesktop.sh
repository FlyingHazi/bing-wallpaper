#!/bin/bash
# $bing is needed to form the fully qualified URL for
# the Bing pic of the day
bing="www.bing.com"

# $xmlURL is needed to get the xml data from which
# the relative URL for the Bing pic of the day is extracted
#
# The mkt parameter determines which Bing market you would like to
# obtain your images from.
# Valid values are: en-US, zh-CN, ja-JP, en-AU, en-UK, de-DE, en-NZ, en-CA.
#
# The idx parameter determines where to start from. 0 is the current day,
# 1 the previous day, etc.
xmlURL="http://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=en-US"

# $saveDir is used to set the location where Bing pics of the day
# are stored.  $HOME holds the path of the current user's home directory
saveDir="$HOME/Pictures/bing-wallpapers/"
logFile=$saveDir"log.txt"

# Create saveDir if it does not already exist
mkdir -p $saveDir

# The desired Bing picture resolution to download
# Valid options: "_1024x768" "_1280x720" "_1366x768" "_1920x1200"
# It is a pity that the 1920x1200 picture has a watermark
desiredPicRes="_1920x1080"

# The file extension for the Bing pic
picExt=".jpg"

# wget PATH
wgetPath=/opt/local/bin

date >> $logFile
for i in 1 2 3 4 5
do
    # Wait for the network
    sleep 5
    # Form the URL for the desired pic resolution
    desiredPicURL=$bing$(echo $(curl -s $xmlURL) | grep -o "<urlBase>.*</urlBase>" | cut -d ">" -f 2 | cut -d "<" -f 1)$desiredPicRes$picExt

    # Form the URL for the default pic resolution
    defaultPicURL=$bing$(echo $(curl -s $xmlURL) | grep -o "<url>.*</url>" | cut -d ">" -f 2 | cut -d "<" -f 1)

    # Set picName to the desired picName
    picName=${desiredPicURL##*/}
    if [ $desiredPicURL == $bing$desiredPicRes$picExt ]
    then
        echo "reloading pic url..." >> $logFile
        continue
    fi
    # Download the Bing pic of the day at desired resolution
    $wgetPath/wget -t 0 -T 5 -c -O $saveDir$picName $desiredPicURL
    exitCode=$?
    echo $picName $exitCode >> $logFile
    if [ 0 == $exitCode ]
    then
        # Set as wallpaper
        osascript -e "set fp to \"$saveDir$picName\"" -e 'set fp to POSIX file fp as string' -e 'tell Application "Finder"' -e 'set the desktop picture to fp as alias' -e 'end tell'
        break
    fi
done


