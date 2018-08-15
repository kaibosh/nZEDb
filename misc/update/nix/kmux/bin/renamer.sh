#!/bin/sh
#
# kmux - Standard renaming script
# ---------------------------------------------------------
#          User Defined Parameters - Alter as needed
# ---------------------------------------------------------
RENAMER_THRES=4       # Threshold setting snooze/sleep decision point
RENAMER_SLEEP=320     # Yawn Mode: How long to sleep
# ------------- End User Defined Paramters --------------
 
# ----------- Input Environment Variables -----------------
# $NZEDB_ROOT etc
 
# ------------ Local variables --------------
HOURLY_TIMER=`date +%s`
DAILY_TIMER=`date +%s`
 
echo "=== Release Renaming Starts ==="
 
while :
do
 
START_TIME=`date +%s`
 
echo "======================= Inner LOOP Starts ======================="
 
echo "--- fixrelnames.php standard start ---"
php ${MULTI_PATH}/fixrelnames.php standard          #Attempt to fix release name using the standard methods
 
echo "--- fixRelNames 1 true all no show ---"
php ${TEST_PATH}/Release/fixReleaseNames.php 1 true all no show
#    php ${TEST_PATH}/Release/fixReleaseNames.php 3 true other no
#    php ${TEST_PATH}/Release/fixReleaseNames.php 7 true other no
echo "--- fixRelNames 1 true preid no show ---"
php ${TEST_PATH}/Release/fixReleaseNames.php 1 true preid no show
#    php ${TEST_PATH}/Release/fixReleaseNames.php 3 true preid no
#    php ${TEST_PATH}/Release/fixReleaseNames.php 7 true preid no # done in PPA
##   php ${TEST_PATH}/Release/removeCrapReleases.php true full
echo "======================= Inner LOOP Ends ======================="
echo
 
# -------------------------------- Runs every two hours -------------------------------------
DIFF=$(($START_TIME-$HOURLY_TIMER))
if [ "$DIFF" -gt 7200 ] || [ "$DIFF" -lt 1 ]
then
    echo "================== 2 Hourly Processing Starts ============================"
    HOURLY_TIMER=`date +%s`
    echo
    echo "--- fixRelNames 5 true other no show ---"
    php ${TEST_PATH}/Release/fixReleaseNames.php 5 true other no show
    echo "--- fixRelNames 5 true preid no show ---"
    php ${TEST_PATH}/Release/fixReleaseNames.php 5 true preid no show
    echo "--- fixRelNames 9 true other no show ---"
    php ${TEST_PATH}/Release/fixReleaseNames.php 9 true other no show
    echo "--- fixRelNames 9 true preid no show ---"
    php ${TEST_PATH}/Release/fixReleaseNames.php 9 true preid no show
    echo
 
    # --- CUT ---
    echo "--- renamer TWIN ---"
    php ${PP_PATH}/rename-RAR-twin.php
 
    echo "--- renamer Video ---"
    php ${PP_PATH}/rename-RAR-video.php
    php ${TEST_PATH}/Release/recategorize-10-20.php misc
 
    echo "--- renamer fixMoviesCovers  ---"
    php ${PP_PATH}/fixMovieCovers.php true
 
    echo "================== 2 Hourly Processing Ends ============================"
    echo
fi
 
# -------------------------------- Daily processing here -------------------------------------
DIFF=$(($START_TIME-$DAILY_TIMER))
if [ "$DIFF" -gt 86400 ] || [ "$DIFF" -lt 1 ]
then
    echo "================== DAILY PROCESSING STARTS ============================"
    DAILY_TIMER=`date +%s`
    echo
    #php ${CLI_PATH}/predb_import_daily_batch.php progress local true
    echo "--- fixRelNames 2 true other yes show ---"
    php ${TEST_PATH}/Release/fixReleaseNames.php 2 true other yes show
    echo "--- fixRelNames 4 true other yes show ---"
    php ${TEST_PATH}/Release/fixReleaseNames.php 4 true other yes show
    echo "--- fixRelNames 6 true other yes show ---"
    php ${TEST_PATH}/Release/fixReleaseNames.php 6 true other yes show
    echo "--- fixRelNames 2 true preid yes show ---"
    php ${TEST_PATH}/Release/fixReleaseNames.php 2 true preid yes show
    echo "--- fixRelNames 6 true preid yes show ---"
    php ${TEST_PATH}/Release/fixReleaseNames.php 6 true preid yes show
    #php ${TEST_PATH}/Release/fixReleaseNames.php 6 true preid yes
    #php ${TEST_PATH}/Release/fixReleaseNames.php 8 true other yes # Done in PPA
    echo "--- fixRelNames 10 true other yes show ---"
    php ${TEST_PATH}/Release/fixReleaseNames.php 10 true other yes show
    ## fixReleaseNames.php 10 true preid no can be renaming a lot of good stuff falsely so its commented out
    #php ${TEST_PATH}/Release/fixReleaseNames.php 10 true preid no
    php ${UPDATE_PATH}/decrypt_hashes.php full show
 
    # echo "--- rename_u4e start ---"
    # php ${TEST_PATH}/Various/rename_u4e.php
 
    echo "================== DAILY PROCESSING ENDS ============================"
    echo
fi
 
# ---------- How fast was that? -----------------
NOW=`date +%s`
DIFF=$(($NOW-$START_TIME))
PROCESS_TIME=$(($DIFF / 60))
echo "------------ Processing time = $PROCESS_TIME minutes --------------"
 
# ----- If that was a fast loop, take a break ----
if [ "$PROCESS_TIME" -le "$RENAMER_THRES" ]; then
    echo " -------- Yawn Mode: Sleeping for $RENAMER_SLEEP seconds -------------- "
    php ${UPDATE_PATH}/nix/tmux/bin/showsleep.php $RENAMER_SLEEP
fi
 
echo "=== Release Renaming Finished ==="
 
done
