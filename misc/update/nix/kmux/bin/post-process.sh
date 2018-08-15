#!/bin/sh
#
# kmux post processing script
 
# ---------------------------------------------------------
#          User Defined Parameters - Alter as needed
# ---------------------------------------------------------
POSTPRO_THRES=4       # Threshold setting snooze/sleep decision point
POSTPRO_SLEEP=192     # Yawn Mode: How long to sleep
# ------------- End User Defined Paramters --------------
 
# ---------- Output Environment Variables -----------------
# $MORE_BACKFILL    # Set to Y if PPA runs through quickly
# $MORE_IMPORT      # Set to Y if PPA runs through quickly
 
echo "=== Post Processing Starts ==="
 
START_TIME=`date +%s`
 
# ------- Fast Renaming done here --------
 
echo "--------------- Decrypt Hashes ------------------------"
php ${UPDATE_PATH}/decrypt_hashes.php 4096
 
echo "--------------- match_prefiles ------------------------"
php ${UPDATE_PATH}/match_prefiles.php 4096 show &
 
# ----------- Do fast release deletion before PPA Processing -------------"
 
echo "--------------- RemoveCrapReleases: executable ------------------------"                                                                                                         
php ${TEST_PATH}/Release/removeCrapReleases.php true 4 executable                                                                                                                    
 
echo "--------------- RemoveCrapReleases: blacklist ------------------------"
php ${TEST_PATH}/Release/removeCrapReleases.php true 2 blacklist
 
echo "--------------- RemoveCrapReleases: passworded ------------------------"
php ${TEST_PATH}/Release/removeCrapReleases.php true 2 passworded
 
echo "--------------- RemoveCrapReleases: scr ------------------------"
php ${TEST_PATH}/Release/removeCrapReleases.php true 4 scr
 
echo "--------------- Purge Crap Releases inline ------------------------"
${KZ_PATH}/bin/purge-inline.sh # call delete_releases.php instead of slow blacklists
 
# echo "---------- Throttle SABNZBd to allow BW for PPA ---------------- "
# timeout 5 php ${TEST_PATH}/Various/sabnzbd_control.php userid speedlimit $SABMIN
 
echo "--------------- PP Additional ------------------------------"
php ${MULTI_PATH}/postprocess.php add
 
# timeout 5 php ${TEST_PATH}/Various/sabnzbd_control.php userid speedlimit $SABMAX
 
echo "--------------- PP NFO ------------------------"
php ${MULTI_PATH}/postprocess.php nfo
 
# ---------- How fast was that? -----------------
NOW=`date +%s`
DIFF=$(($NOW-$START_TIME))
PROCESS_TIME=$(($DIFF / 60))
echo "------------ Processing time = $PROCESS_TIME minutes --------------"
 
# ----- If that was a fast loop, allow more backfill and or imports -----
if [ "$PROCESS_TIME" -le "$POSTPRO_THRES" ]; then
    echo "--- Yawn Mode: Enabling extra backfill and imports ---"
    MORE_BACKFILL=Y
    MORE_IMPORT=Y
else
    MORE_BACKFILL=N
    MORE_IMPORT=N
fi
 
# ----- If that was a fast loop, take a break ----
if [ "$PROCESS_TIME" -le "$POSTPRO_THRES" ]; then

    echo "--------------- Purge releases not meeting minimum size for category ------------------------"
    ${KZ_PATH}/bin/purge-category.sh # done when load is lower
 
    echo " -------- Yawn Mode: Sleeping for $POSTPRO_SLEEP seconds -------------- "
    php ${UPDATE_PATH}/nix/tmux/bin/showsleep.php $POSTPRO_SLEEP
fi
 
echo "=== Post-Processing Finished ==="
