#!/bin/sh
#
# kmux Misc PP script
 
# ---------------------------------------------------------
#          User Defined Parameters - Alter as needed
# ---------------------------------------------------------
MISC_PP_THRES=4       # Threshold setting snooze/sleep decision point
MISC_PP_SLEEP=320     # Yawn Mode: How long to sleep
# ------------- End User Defined Paramters --------------
 
# ----------- Input Environment Variables -----------------
# $NZEDB_ROOT etc
 
# ------------ Local variables --------------
HOURLY_TIMER=`date +%s`
DAILY_TIMER=`date +%s`
 
echo "=== Misc PP Starts ==="
 
while :
do
 
START_TIME=`date +%s`
 
echo "======================= Inner LOOP Starts ======================="
 
echo "----------------- Movies ------------------------"
php ${MULTI_PATH}/postprocess.php mov false
 
echo "----------------- TV ------------------------"
php ${MULTI_PATH}/postprocess.php tv false
 
echo "---------------- Amazon and XXX ---------------------"
php ${MULTI_PATH}/postprocess.php ama     # Do amazon processing, this is single threaded, because of amazon API restrictions.
 
echo "======================= Inner LOOP Ends ======================="
echo
 
# -------------------------------- Runs every two hours -------------------------------------
DIFF=$(($START_TIME-$HOURLY_TIMER))
if [ "$DIFF" -gt 7200 ] || [ "$DIFF" -lt 1 ]
then
    echo "================== 2 Hourly Processing Starts ============================"
    HOURLY_TIMER=`date +%s`
 
    echo "---------------- Shared comments PP ---------------------"
    php ${MULTI_PATH}/postprocess.php sha   # Do sharing processing, this is single threaded
 
    echo "------------- Running Foreign Movie Sorter ------------------"
    php ${TEST_PATH}/Release/foreignMovieSorter.php true
 
    # echo "------------- Re-categorising TV ------------------"
    # mysql $db_name < ${KZ_PATH}/bin/recat-tv.sql
 
    echo
    echo "------------- Re-categorising BluRay ------------------"
    mysql $DB_NAME < ${KZ_PATH}/bin/recat-bluray.sql
 
    echo
    echo "------------- Deleting bad PREs ------------------"
    mysql $DB_NAME < ${KZ_PATH}/bin/del-bad-pres.sql
 
    echo
    echo "================== 2 Hourly Processing Ends ============================"
fi
 
## # -------------------------------- Daily processing here -------------------------------------
## DIFF=$(($START_TIME-$DAILY_TIMER))
## if [ "$DIFF" -gt 86400 ] || [ "$DIFF" -lt 1 ]
## then
##     echo "================== DAILY PROCESSING STARTS ============================"
##     DAILY_TIMER=`date +%s`
##     echo "Nothing to do at the moment!"
##     echo "================== DAILY PROCESSING ENDS ============================"
##     echo
## fi
 
# ---------- How fast was that? -----------------
NOW=`date +%s`
DIFF=$(($NOW-$START_TIME))
PROCESS_TIME=$(($DIFF / 60))
echo "------------ Processing time = $PROCESS_TIME minutes --------------"
 
# ----- If that was a fast loop, take a break ----
if [ "$PROCESS_TIME" -le "$MISC_PP_THRES" ]; then
    echo " -------- Yawn Mode: Sleeping for $MISC_PP_SLEEP seconds -------------- "
    php ${UPDATE_PATH}/nix/tmux/bin/showsleep.php $MISC_PP_SLEEP
fi
 
echo "=== Misc PP Finished ==="
 
done
