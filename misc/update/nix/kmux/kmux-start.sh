#!/bin/sh
#
# kmux start script
#
# Performs start-up checks, initiation, then opens tmux panes/windows before passing off to respawner/stats routines.
#
if [ -e "nZEDbBase.php" ]
then
          export NZEDB_ROOT="$(pwd)"
else
          export NZEDB_ROOT="$(php ../../../../nZEDbBase.php)"
fi
#
# ---------------------------------------------------------
#         User Defined Parameters - Alter as needed
# ---------------------------------------------------------
export KZSESSION="nZEDb"
export DB_NAME="nzedb"
export MORE_BACKFILL="N"    # Flag set=Y if PPA capacity free
export MORE_IMPORT="N"      # Flag set=Y if PPA capacity free
#
# ------------- End User Defined Paramters --------------
 
# ------------ Constants ---------------------
export UPDATE_PATH="${NZEDB_ROOT}/misc/update"
export TEST_PATH="${NZEDB_ROOT}/misc/testing"
export DB_PATH="${TEST_PATH}/DB"
export DEV_PATH="${TEST_PATH}/Developers"
export MULTI_PATH="${UPDATE_PATH}/nix/multiprocessing"
export PP_PATH="${TEST_PATH}/PostProcess"
export KZ_PATH="${UPDATE_PATH}/nix/kmux"

#
# ----- Check if tmux session already active ------
tmux has-session -t $KZSESSION &> /dev/null
if [ $? != 0 ]
then
    # ----- Reset collection age -----
    echo "Resetting expired collections dateadded to now. This could take a minute or two. Really."
    php ${UPDATE_PATH}/nix/tmux/bin/resetdelaytime.php
 
    # ----- Open blank tmux windows & panes ready for respawner -----
    tmux -f ${KZ_PATH}/tmux.conf new-session -d -s $KZSESSION -n Main 'echo "Respawner and stats go here"'
 
    tmux select-pane -t $KZSESSION:Main.0
    tmux split-window -t $KZSESSION:Main -h -p 60 'echo "Post Processing goes here"'

    tmux select-pane -t $KZSESSION:Main.0
    tmux split-window -t $KZSESSION:Main -v -p 60 'echo "Header pulls and release creation goes here"'
 
    tmux select-pane -t $KZSESSION:Main.2
    tmux split-window -t $KZSESSION:Main -v -p 50 'echo "Misc Post-Processing goes here"'
 
    tmux new-window -t $KZSESSION -n IRCScraper 'echo "IRCScraper goes here"'
 
    tmux new-window -t $KZSESSION -n Renamer 'echo "Renamer goes here"'
    tmux split-window -t $KZSESSION:Renamer -h -p 50 'echo "PreDB-FT renamer goes here"'
 
#     tmux new-window -t $KZSESSION -n Misc 'echo "Misc Post-Processing goes here"'
 
    tmux new-window -t $KZSESSION -n SQL 'bash -c mysql '${DB_NAME}

    tmux new-window -t $KZSESSION -n Shell 'bash -i'
 
    # ------- Start the repawner and attach to main window ----------
    #tmux respawn-pane -t $KZSESSION:Main.0 'cd ${KZ_PATH} && ./respawn.sh'
    tmux respawn-pane -t $KZSESSION:Main.0 './respawn.sh'
 
    tmux select-window -t $KZSESSION:Main
    tmux attach-session -d -t $KZSESSION:Main # Control transfers to tmux session from here on
    echo "Start-up complete, you can attach to the tmux session now"
    exit 0
else
    echo "tmux session already active. Terminating"
    exit 1
fi
