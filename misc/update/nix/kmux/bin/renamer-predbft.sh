#!/bin/sh
#
# kmux Renamer using predbdt matching
#
# This renaming method is very CPU intensive, thus deserves it's own thread
# Do not set fixreleasename thread count too much higher than available CPU threads
 
# ---------------------------------------------------------
#          User Defined Parameters - Alter as needed
# ---------------------------------------------------------
RENAMER2_THRES=4       # Threshold setting snooze/sleep decision point
RENAMER2_SLEEP=320     # Yawn Mode: How long to sleep
# ------------- End User Defined Paramters --------------
 
# ----------- Input Environment Variables -----------------
# $NZEDB_ROOT etc
 
# ------------ Local variables --------------
HOURLY_TIMER=`date +%s`
DAILY_TIMER=`date +%s`
 
echo "=== PreDB-FT Renaming Starts ==="
 
START_TIME=`date +%s`

echo "----------------- fixrelnames.php predbft start ------------------------"
php ${MULTI_PATH}/fixrelnames.php predbft      #Attempt to fix release name using Predb full text matching.
 
# ---------- How fast was that? -----------------
NOW=`date +%s`
DIFF=$(($NOW-$START_TIME))
PROCESS_TIME=$(($DIFF / 60))
echo "------------ Processing time = $PROCESS_TIME minutes --------------"
 
# ----- If that was a fast loop, take a break ----
if [ "$PROCESS_TIME" -le "$RENAMER2_THRES" ]; then
    echo " -------- Yawn Mode: Sleeping for $RENAMER2_SLEEP seconds -------------- "
    php ${UPDATE_PATH}/nix/tmux/bin/showsleep.php $RENAMER2_SLEEP
fi
 
echo "=== PreDB-FT Renaming Finished ==="

