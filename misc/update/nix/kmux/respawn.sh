#!/bin/sh
#
# kmux respawning script
#
# ---------------------------------------------------------
#          User Defined Parameters - Alter as needed
# ---------------------------------------------------------
RESPAWN_SLEEP=30
STATS_TIMEOUT=20     # How long respawner waits for monitor status to be produced
SOFT_START_SLEEP=3   # Reduces DB load spike when script starts with high thread counts
# ------------- End User Defined Paramters --------------
#
 
while :
do
 
tmux select-pane -t $KZSESSION:Main.0
# clear
echo "Checking kmux processes activity"
 
# ------------ Respawn IRCScraper? ---- Done first as its lightweight and high priority -----
if [ $(tmux list-panes -t $KZSESSION:IRCScraper | grep -c dead) == 1 ]
then
    echo "Respawning IRCScraper"
    tmux respawn-pane -t $KZSESSION:IRCScraper 'cd ${NZEDB_ROOT} && php misc/IRCScraper/scrape.php true'
fi
 
# ------------ Respawn Header pull and release creation? ---------
if [ $(tmux list-panes -t $KZSESSION:Main | grep "1:" | grep -c dead) == 1 ]
then
    echo "Respawning iHeader Pull & Releases Creation"
    tmux respawn-pane -t $KZSESSION:Main.1 'cd ${KZ_PATH}/bin && ./hdr-pull-make-rels.sh'
    sleep $SOFT_START_SLEEP # Sleep after starting "heavy" script
fi
 
# ------------ Respawn post-processing? ---------
if [ $(tmux list-panes -t $KZSESSION:Main | grep "2:" | grep -c dead) == 1 ]
then
    echo "Respawning Post-Processing"
    tmux respawn-pane -t $KZSESSION:Main.2 'cd ${KZ_PATH}/bin && ./post-process.sh'
    sleep $SOFT_START_SLEEP # Sleep after starting "heavy" script
fi
 
# ------------ Respawn Misc post-processing? ---------
if [ $(tmux list-panes -t $KZSESSION:Main | grep "3:" | grep -c dead) == 1 ]
then
    echo "Respawning Misc Post-Processing"
    tmux respawn-pane -t $KZSESSION:Main.3 'cd ${KZ_PATH}/bin && ./misc-pp.sh'
    sleep $SOFT_START_SLEEP # Sleep after starting "heavy" script
fi
 
# ------------ Respawn Renamer? ---------
if [ $(tmux list-panes -t $KZSESSION:Renamer | grep "0:" | grep -c dead) == 1 ]
then
    echo "Respawning Standard Renamer"
    tmux respawn-pane -t $KZSESSION:Renamer.0 'cd ${KZ_PATH}/bin && ./renamer.sh'
fi
 
# ------------ Respawn PreDB-FT Renamer? ---------
if [ $(tmux list-panes -t $KZSESSION:Renamer | grep "1:" | grep -c dead) == 1 ]
then
    echo "Respawning PreDB-FT Renamer"
    tmux respawn-pane -t $KZSESSION:Renamer.1 'cd ${KZ_PATH}/bin && ./renamer-predbft.sh'
fi
 
SOFT_START_SLEEP=1 # Reduce after inital loop as "heavy" scripts unlikely to simultaneously start
tmux select-pane -t $KZSESSION:Main.0
echo "Respawing complete"
sleep 1 # DEBUG to read messages
 
# ----------- Produce some pretty stats for user ------------
cd ${KZ_PATH}
timeout $STATS_TIMEOUT php stats.php   $ timeout prevents lengthy stats production blocking respawns

echo "Extra backfill?="$MORE_BACKFILL
# echo "Importing?="$MORE_IMPORT
echo
 
# ---- Loop done -- show sleeptime -----
php ${UPDATE_PATH}/nix/tmux/bin/showsleep.php $RESPAWN_SLEEP
 
done
