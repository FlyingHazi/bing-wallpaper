Bing Wallpaper for XFCE
=================================

Information
-----------
A script which downloads the latest picture of the day from Bing.com and saves
it to a directory.

The script was tested on:
XFCE 4.10

How to use?
-----------
* Just run the **HazisBingDesktop.sh** script from the terminal. The script will
download the bing image.
* If desired, change the default **PICTURE_DIR** in **HazisBingDesktop.sh** to the
wallpaper directory. If left unchanged the default value is
**~/Pictures/bing-wallpapers/**.

Configuration on XFCE
--------------------
* To have the script run everyday automatically you will need to setup anacron
* Make sure you can run anacron as a non-root user. I have provided a sample anacrontab file
For more information on configuring anacron [see here]( http://www.it.uc3m.es/marcos/doc/miniHOWTOs/miniHOWTO-Use_anacron_as_non-root_user.html).

Acknowledgement
---------------
Original script by ktmud can be found at
[https://github.com/ktmud/bing-wallpaper](
https://github.com/ktmud/bing-wallpaper).

