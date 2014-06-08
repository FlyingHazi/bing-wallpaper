Bing Wallpaper for Mac 
=================================

Information
-----------
A script which downloads the latest picture of the day from Bing.com and saves
it to a directory.

The script was tested on:
    Mac OS X 10.8.5

How to use?
-----------
* Just run the **HazisBingDesktop.sh** script from the terminal. The script will
download the bing image.
* If desired, change the default **PICTURE_DIR** in **HazisBingDesktop.sh** to the
wallpaper directory. If left unchanged the default value is
**~/Pictures/bing-wallpapers/**.

Configuration on Mac
--------------------
* To have the script run everyday automatically you will need to setup launchd
. I have provided a sample plist file the Tools directory, which can be copied 
to **$HOME/Library/LaunchAgents** and loaded with the command
  `launchctl load $HOME/Library/LaunchAgents/com.gmtsui.hazi.bing-wallpaper.plist`
Modify the plist as needed to point to **HazisBingDesktop.sh**. For more
information on configuring launchd [see here](
http://blog.ideasftw.com/2013/02/run-script-from-launchd-instead-of-cron.html).

Acknowledgement
---------------
Original script by ktmud can be found at
[https://github.com/ktmud/bing-wallpaper](
https://github.com/ktmud/bing-wallpaper).

