#!/bin/sh
#
# kmux header pull/update script
 
# ---------------------------------------------------------
#          User Defined Parameters - Alter as needed
# ---------------------------------------------------------
HDR_REL_THRES=4           # Threshold setting snooze/sleep decision point
HDR_REL_SLEEP=256         # Yawn Mode: How long to sleep
UPD_BIN_HDRS="500000"     # Number of update binaries headers to pull each loop
BACKFILL_HDRS="160000"    # Number of backfill headers to pull each time
IMPORT_ACTIVE=N           # Set to Y to activate importinf of NZBs
IMPORT_THIS_MANY=100      # Number of NZBs to import per loop
IMPORT_DIR="/import"      # Directory containing NZBs to import 
# ------------- End User Defined Paramters --------------

# ----------- Input Environment Variables -----------------
# $NZEDB_ROOT etc
# $MORE_IMPORT
# $MORE_BACKFILL
 
START_TIME=`date +%s`       # Script start time
 
# ----------- Normal Update Binaries ----------------
echo "=== Header Pull Start ==="
php ${MULTI_PATH}/binaries.php $UPD_BIN_HDRS
 
# ------------------- Now Backfill ------------------
echo "=== Backfill Header Pull Start ==="
php ${MULTI_PATH}/backfill.php $BACKFILL_HDRS
 

# ----------- Create Releases ----------------
echo "=== Create Releases Start ==="
php ${MULTI_PATH}/releases.php
# ---------- How fast was that? -----------------
NOW=`date +%s`
DIFF=$(($NOW-$START_TIME))
PROCESS_TIME=$(($DIFF / 60))
echo "------------ Processing time = $PROCESS_TIME minutes --------------"
 
# ----- If that was a fast loop and PPA is not overloaded, do some more backfill -----
if [ "$PROCESS_TIME" -le "$HDR_REL_THRES" ] && [ "$MORE_BACKFILL" == "Y" ]; then
    echo "--- Yawn Mode: Performing extra backfill ---"
    php ${MULTI_PATH}/backfill.php $BACKFILL_HDRS
    php ${MULTI_PATH}/backfill.php $BACKFILL_HDRS
    php ${MULTI_PATH}/backfill.php $BACKFILL_HDRS
fi
 
# ----- If that was a fast loop and PPA is not overloaded, do some importing -----
if [ "$IMPORT_ACTIVE" == "Y" ] && [ "$PROCESS_TIME" -le "$HDR_REL_THRES" ] && [ "$MORE_IMPORT" == "Y" ]; then
    echo "--- Yawn Mode: Importing NZBs ---"
    php ${TEST_PATH}/nzb-import.php ${IMPORT_DIR} false $IMPORT_THIS_MANY
fi

# ----- If that was a fast loop, take a break ----
if [ "$PROCESS_TIME" -le "$HDR_REL_THRES" ]; then
    echo " -------- Yawn Mode: Sleeping for $HDR_REL_SLEEP seconds -------------- "
    php ${UPDATE_PATH}/nix/tmux/bin/showsleep.php $HDR_REL_SLEEP
fi
 
echo "=== Header Pull and Create Releases Finished ==="
