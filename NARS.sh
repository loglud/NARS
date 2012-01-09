#!/bin/bash
# Writen by Loglud
# Root code by Indirect
# Gapps by 

f_root(){

	if ( $adb shell id | grep root )  >> ./NARG.log	
		then
		echo "Devices already rooted";
		$adb shell 'mount -o remount,rw /dev/block/platform/mmci-omap-hs.1/by-name/system /system' >> ./NARG.log
		$adb push ./su /system/bin >> ./NARG.log
		$adb shell 'chmod 4755 /system/bin/su' >> ./NARG.log
	else
		$adb push ./zergRush /data/local/zergy >> ./NARG.log
		$adb shell 'chmod 755 /data/local/zergy' >> ./NARG.log
		if ( $adb shell 'ls /data/local/tmp/' | grep -i 'sh' ) >> ./NARG.log
			then
			$adb shell 'rm /data/local/tmp/sh' >> ./NARG.log
		fi
		if 
			($adb shell 'ls /data/local/tmp/' | grep -i boomsh) >> ./NARG.log 
			then
			$adb shell 'rm /data/local/tmp/boomsh' >> ./NARG.log
		fi
		$adb shell '/data/local/zergy' >> ./NARG.log
		$adb 'wait-for-device' install './Superuser.apk' >> ./NARG.log
		$adb remount >> ./NARG.log
		$adb shell 'mount -o remount,rw /dev/block/platform/mmci-omap-hs.1/by-name/system /system' >> ./NARG.log
		$adb push su /system/bin >> ./NARG.log
		$adb shell 'chmod 4755 /system/bin/su' >> ./NARG.log
		echo "Your device is now rooted" >> ./NARG.log
	fi
	read -p "Press any key to continue..."
}

f_instbb(){
if ($adb shell id | grep root) >> ./NARG.log
	then
	f_root
fi
if ( ($adb shell ls /system/xbin | grep busybox) ) >> ./NARG.log
	then
	echo "BusyBox already installed!"
	return
fi
echo "Installing BusyBox..."
$adb shell mount -rw -o remount /dev/block/platform/mmci-omap-hs.1/by-name/system /system >> ./NARG.log
$adb push ./busybox /system/xbin/ >> ./NARG.log
$adb shell chmod  755 /system/xbin/ >> ./NARG.log
$adb shell /system/xbin/busybox --install -s /system/xbin >> ./NARG.log
echo "Busybox Installed..."
read -p "Press any key to continue..."
}

restorefs(){
echo "Are you sure you want to restore your device"
echo "!!! WARNING THIS WILL ERASE EVERYTHING!!!"
echo "Type 1 for yes and 2 for no"
read menunr
case $menunr in
1)
	f_root
	$adb shell "echo -n '0000' > /bootdata/BootCnt"
	$adb reboot
	read -p "Press any key to exit..."
;;
2)
;;
esac
}

f_Gappin(){
$adb push system/app/CarHomeGoogle.apk /system/app/ >> ./NARG.log
$adb shell chmod 644 /system/app/CarHomeGoogle.apk >> ./NARG.log
$adb push system/app/FOTAKill.apk /system/app/ >> ./NARG.log
$adb shell chmod 644 /system/app/FOTAKill.apk >> ./NARG.log
$adb push system/app/GenieWidget.apk /system/app/ >> ./NARG.log
$adb shell chmod 644 /system/app/GenieWidget.apk >> ./NARG.log
$adb push system/app/GoogleBackupTransport.apk /system/app/ >> ./NARG.log
$adb shell chmod 644 /system/app/GoogleBackupTransport.apk >> ./NARG.log
$adb push system/app/GoogleCalendarSyncAdapter.apk /system/app/ >> ./NARG.log
$adb shell chmod 644 /system/app/GoogleCalendarSyncAdapter.apk >> ./NARG.log
$adb push system/app/GoogleContactsSyncAdapter.apk /system/app/ >> ./NARG.log
$adb shell chmod 644 /system/app/GoogleContactsSyncAdapter.apk >> ./NARG.log
$adb push system/app/GoogleFeedback.apk /system/app/ >> ./NARG.log
$adb shell chmod 644 /system/app/GoogleFeedback.apk >> ./NARG.log
$adb push system/app/GooglePartnerSetup.apk /system/app/ >> ./NARG.log
$adb shell chmod 644 /system/app/GooglePartnerSetup.apk >> ./NARG.log
$adb push system/app/GoogleQuickSearchBox.apk /system/app/ >> ./NARG.log
$adb shell chmod 644 /system/app/GoogleQuickSearchBox.apk >> ./NARG.log
$adb push system/app/GoogleServicesFramework.apk /system/app/ >> ./NARG.log
$adb shell chmod 644 /system/app/GoogleServicesFramework.apk >> ./NARG.log
$adb push system/app/LatinImeTutorial.apk /system/app/ >> ./NARG.log
$adb shell chmod 644 /system/app/LatinImeTutorial.apk >> ./NARG.log
$adb push system/app/MarketUpdater.apk /system/app/ >> ./NARG.log
$adb shell chmod 644 /system/app/MarketUpdater.apk >> ./NARG.log
$adb push system/app/MediaUploader.apk /system/app/ >> ./NARG.log
$adb shell chmod 644 /system/app/MediaUploader.apk >> ./NARG.log
$adb push system/app/NetworkLocation.apk /system/app/ >> ./NARG.log
$adb shell chmod 644 /system/app/NetworkLocation.apk >> ./NARG.log
$adb push system/app/OneTimeInitializer.apk /system/app/ >> ./NARG.log
$adb shell chmod 644 /system/app/OneTimeInitializer.apk >> ./NARG.log
$adb push system/app/Talk.apk /system/app/ >> ./NARG.log
$adb shell chmod 644 /system/app/Talk.apk >> ./NARG.log
$adb push system/app/Vending.apk /system/app/ >> ./NARG.log
$adb shell chmod 644 /system/app/CarHomeGoogle.apk >> ./NARG.log
$adb push system/etc/permissions/com.google.android.maps.xml /system/etc/permissions/ >> ./NARG.log
$adb push system/etc/permissions/features.xml /system/etc/permissions/ >> ./NARG.log
$adb push system/framework/com.google.android.maps.jar /system/framework/ >> ./NARG.log
$adb push system/lib/libvoicesearch.so /system/lib/ >> ./NARG.log
}

lunrut(){
echo "Now going to unroot your nook tablet!"
$adb push zergRush /data/local/zergy >> ./NARG.log
echo "We have to root to unroot"
$adb shell chmod 777 /data/local/zergy >> ./NARG.log
$adb shell rm -r /data/local/tmp >> ./NARG.log
$adb shell mkdir /data/local/tmp >> ./NARG.log
if ( $adb shell id | grep root ) >> ./NARG.log
then
	echo Devices already rooted
else
	$adb shell /data/local/zergy >> ./NARG.log
fi
$adb 'wait-for-device' install Superuser.apk >> ./NARG.log
$adb push su /data/local/tmp/ >> ./NARG.log
$adb shell cd /data/local/tmp >> ./NARG.log
$adb shell chmod 777 su >> ./NARG.log
$adb shell cd / >> ./NARG.log
$adb shell mount -o remount,rw -t rootfs rootfs / >> ./NARG.log
$adb shell rm /system/bin/su >> ./NARG.log
$adb shell rm /data/app/com.noshufou.android.su* >> ./NARG.log
echo "Uninstalling Gapps"
$adb shell rm /system/app/CarHomeGoogle.apk >> ./NARG.log
$adb shell rm /system/app/FOTAKill.apk >> ./NARG.log
$adb shell rm /system/app/GenieWidget.apk >> ./NARG.log
$adb shell rm /system/app/GoogleBackupTransport.apk >> ./NARG.log
$adb shell rm /system/app/GoogleCalendarSyncAdapter.apk >> ./NARG.log
$adb shell rm /system/app/GoogleContactsSyncAdapter.apk >> ./NARG.log
$adb shell rm /system/app/GoogleFeedback.apk >> ./NARG.log
$adb shell rm /system/app/GooglePartnerSetup.apk >> ./NARG.log
$adb shell rm /system/app/GoogleQuickSearchBox.apk >> ./NARG.log
$adb shell rm /system/app/GoogleServicesFramework.apk >> ./NARG.log
$adb shell rm /system/app/LatinImeTutorial.apk >> ./NARG.log
$adb shell rm /system/app/MarketUpdater.apk >> ./NARG.log
$adb shell rm /system/app/MediaUploader.apk >> ./NARG.log
$adb shell rm /system/app/NetworkLocation.apk >> ./NARG.log
$adb shell rm /system/app/OneTimeInitializer.apk >> ./NARG.log
$adb shell rm /system/app/Talk.apk >> ./NARG.log
$adb shell rm /system/app/Vending.apk >> ./NARG.log
$adb shell rm /system/etc/permissions/com.google.android.maps.xml >> ./NARG.log
$adb shell rm /system/etc/permissions/features.xml >> ./NARG.log
$adb shell rm /system/framework/com.google.android.maps.jar >> ./NARG.log
$adb shell rm /system/lib/libvoicesearch.so >> ./NARG.log
$adb shell rm /system/bin/busybox >> ./NARG.log
$adb shell rm -r /data/busybox >> ./NARG.log
echo "You are now unrooted. You need to reboot to finalize it. Would you like to reboot now?"
echo -n "1: Yes   2: No      :"
read choice
case $choice in 
"1") 
	$adb reboot
	read -p "Press any key to exit..."
	exit
;;
"2")
	read -p "Press any key to exit..."
	exit
;;
esac
}

installapks(){
clear
while :
do

if ( ($adb shell ls /data/app | grep -i "com.appdroid.anycut" ) && ($adb shell ls /data/app | grep -i "org.pocketworkstation.pckeyboard" ))
	then 
	altkey="*"
else
	altkey="-"
fi
echo "Welcome to the STD Package installer:
"
echo "Install alternatve keyboards ($altkey)"
echo -n "What is your choice:"
read choice

done
}

OTAmenu(){
if ( $adb shell id | grep root ) >> /dev/null;
	then
	f_root
fi
$adb push ./sqlite3 /system/xbin/
while :
do
if ( $adb shell sqlite3 /data/data/com.bn.devicemanager/databases/devicemanager.db "SELECT * from registry WHERE _id = 8" | grep -i 1.4) >> /dev/null;
	then
	OTA="STATUS:     OTA is enabled"
	else
	OTA="STATUS:     OTA is disabled"
fi
clear
echo ' 
         _             _                   _          _       
        /\ \     _    / /\                /\ \       / /\     
       /  \ \   /\_\ / /  \              /  \ \     / /  \    
      / /\ \ \_/ / // / /\ \            / /\ \ \   / / /\ \__ 
     / / /\ \___/ // / /\ \ \          / / /\ \_\ / / /\ \___\
    / / /  \/____// / /  \ \ \        / / /_/ / / \ \ \ \/___/
   / / /    / / // / /___/ /\ \      / / /__\/ /   \ \ \      
  / / /    / / // / /_____/ /\ \    / / /_____/_    \ \ \     
 / / /    / / // /_________/\ \ \  / / /\ \ \ /_/\__/ / /     
/ / /    / / // / /_       __\ \_\/ / /  \ \ \\ \/___/ /      
\/_/     \/_/ \_\___\     /____/_/\/_/    \_\/ \_____\/       
||||||||||||||NOOK AUTOMATED ROOTING SERVICE||||||||||||||||||
|||||||||||||||||||||||OTA MENU|||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
'
echo $OTA
echo "1: Disable OTA"
echo "2: Enable OTA"
echo "3: Back"
echo -n "What is your choice:"
read choice

case $choice in 

1)
echo "Disabling OTA updates..."
f_root
$adb shell sqlite3 /data/data/com.bn.devicemanager/databases/devicemanager.db "UPDATE registry SET value = '9.9.9' WHERE _id = 8"
$adb shell rm /system/xbin/sqlite3
echo "OTA updates disabled."
;;

2)
echo "Enabling OTA updates..."
f_root
$adb shell sqlite3 /data/data/com.bn.devicemanager/databases/devicemanager.db "UPDATE registry SET value = '1.4.0' WHERE _id = 8"
$adb shell rm /system/xbin/sqlite3
echo "OTA updates enabled."
;;

3)
return
$adb shell rm /system/xbin/sqlite3
;;
esac

done
}
clear

echo '

         _             _                   _          _       
        /\ \     _    / /\                /\ \       / /\     
       /  \ \   /\_\ / /  \              /  \ \     / /  \    
      / /\ \ \_/ / // / /\ \            / /\ \ \   / / /\ \__ 
     / / /\ \___/ // / /\ \ \          / / /\ \_\ / / /\ \___\
    / / /  \/____// / /  \ \ \        / / /_/ / / \ \ \ \/___/
   / / /    / / // / /___/ /\ \      / / /__\/ /   \ \ \      
  / / /    / / // / /_____/ /\ \    / / /_____/_    \ \ \     
 / / /    / / // /_________/\ \ \  / / /\ \ \ /_/\__/ / /     
/ / /    / / // / /_       __\ \_\/ / /  \ \ \\ \/___/ /      
\/_/     \/_/ \_\___\     /____/_/\/_/    \_\/ \_____\/       
||||||||||||||NOOK AUTOMATED ROOTING SERVICE||||||||||||||||||

______________WELCOME TO LOGLUD NARS PROGRAM__________________
|||||||||||||||||||||||||Credits:|||||||||||||||||||||||||||||
|||||||||||||||||||||||||Indirect|||||||||||||||||||||||||||||
||||||||||||||||||||||||||analog||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
'

#Checking  to make sure that the user has superuser access.
if !(id | grep -i root) >> ./NARG.log
	then
	echo "

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!Please run this script as root by typeing sudo ./NARG!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
"

	exit
fi
read -p "Press any key to continue..."
touch ./NARG.log
echo $(date) > NARG.log
#Fixing issues with the adb not recognizing the nook.
if [ -e ~/.android/adb_usb.ini ]
	then
	if !(cat ~/.android/adb_usb.ini | grep -i "0x2080") >> ./NARG.log
		then
		echo "0x2080" >> ~/.android/adb_usb.ini
	fi
elif [ -e ~/.android ]
	then
	cp ./adb_usb.ini ~/.android/
else
	mkdir ~/.android
	cp ./adb_usb.ini ~/.android/
fi
clear

#Are we in linux or mac
if (uname -a | grep -i Linux) >> ./NARG.log
	then
	echo "
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
**************************************************************
**************Linux operating system detected*****************
**************************************************************
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
"
	adb='./adblinux'
elif (uname -a | grep -i Darwin) >> ./NARG.log
	then
	echo "
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
**************************************************************
*************Mac OSX operating system detected****************
**************************************************************
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
"
	adb='./adbmac'
fi


#Lets see what devices are attached
$adb devices


#Is it attach menu:
echo "

??????????????????????????????????????????????????????????????
?????????????????Did your nook Tablet show up?????????????????
??????????????????????????????????????????????????????????????
"
echo -n "Type 1 for yes and 2 for no: "
read menunr
case $menunr in
1) 
clear
echo "
..............................................................
..............Verifying that your device is indeed............
..................a Barnes and Noble Nook tablet..............
..............................................................

"
if ($adb shell cat /system/build.prop |  grep -i "ro.product.device=blaze" ) >> ./NARG.log
	then
		echo "
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||You have the Nook Tablet|||||||||||||||||||
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
"
read -p "Press any key to continue..."
	else
		echo "
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!Tablet unrecognized!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
"
read -p "Press any key to continue..."
clear
		exit
fi

clear
#Main Menu look up what isnt and what is installed?
while :
do
if ( $adb shell id | grep root ) >> /dev/null;
	then
	rooted="1: Root device (*)"
	else
	rooted="1: Root device"
fi
if  (($adb shell ls /system/xbin | grep busybox) ) >> ./NARG.log;
	then
	bb="2: Install busybox (*)"
	else
	bb="2: Install busybox"
fi
if  ($adb shell ls /system/app/ | grep CarHomeGoogle) >> ./NARG.log;
	then
	Gapp="3: Install GApps (*)"
	else
	Gapp="3: Install GApps"
fi

#Print menu
echo ' 
         _             _                   _          _       
        /\ \     _    / /\                /\ \       / /\     
       /  \ \   /\_\ / /  \              /  \ \     / /  \    
      / /\ \ \_/ / // / /\ \            / /\ \ \   / / /\ \__ 
     / / /\ \___/ // / /\ \ \          / / /\ \_\ / / /\ \___\
    / / /  \/____// / /  \ \ \        / / /_/ / / \ \ \ \/___/
   / / /    / / // / /___/ /\ \      / / /__\/ /   \ \ \      
  / / /    / / // / /_____/ /\ \    / / /_____/_    \ \ \     
 / / /    / / // /_________/\ \ \  / / /\ \ \ /_/\__/ / /     
/ / /    / / // / /_       __\ \_\/ / /  \ \ \\ \/___/ /      
\/_/     \/_/ \_\___\     /____/_/\/_/    \_\/ \_____\/       
||||||||||||||NOOK AUTOMATED ROOTING SERVICE||||||||||||||||||
'
echo "MAIN MENU:"
echo "$rooted"
echo "$bb"
echo "$Gapp"
echo "4: Do All"
echo "5: Unroot"
echo "6: Restore to factory"
echo "7: OTA Options"
echo "8: Quit"
echo -n "What is your choice:"
read choice
case $choice in

#The case to root
1)
f_root
;;

#Install busy box if root
2)
f_root
f_instbb
;;

#Install Gapps
3)
f_root
f_Gappin
;;

#Install everything
4)
f_root
f_instbb
f_Gappin
;;

#Unroot
5)
lunrut
;;

#Restor filesystem
6)
restorefs
;;

7)
OTAmenu
;;

8)
echo "
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||Goodbye|||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
read -p "Press any key to continue..."
clear
exit
;;
esac
clear
done	
;;
2)
echo "
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||Goodbye|||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
"
read -p "Press any key to continue..."
clear
;;
esac
exit


