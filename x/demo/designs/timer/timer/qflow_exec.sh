#!/bin/tcsh -f
#-------------------------------------------
# qflow exec script for project /home/naufal/Documents/auc/ravacancy/rsyn-x/x/demo/designs/timer/timer
#-------------------------------------------

/usr/local/share/qflow/scripts/synthesize.sh /home/naufal/Documents/auc/ravacancy/rsyn-x/x/demo/designs/timer/timer timer /home/naufal/Documents/auc/ravacancy/rsyn-x/x/demo/designs/timer/timer/source/timer.v || exit 1
/usr/local/share/qflow/scripts/placement.sh -d /home/naufal/Documents/auc/ravacancy/rsyn-x/x/demo/designs/timer/timer timer || exit 1
# /usr/local/share/qflow/scripts/vesta.sh /home/naufal/Documents/auc/ravacancy/rsyn-x/x/demo/designs/timer/timer timer || exit 1
/usr/local/share/qflow/scripts/router.sh /home/naufal/Documents/auc/ravacancy/rsyn-x/x/demo/designs/timer/timer timer || exit 1
/usr/local/share/qflow/scripts/vesta.sh -d /home/naufal/Documents/auc/ravacancy/rsyn-x/x/demo/designs/timer/timer timer || exit 1
# /usr/local/share/qflow/scripts/cleanup.sh /home/naufal/Documents/auc/ravacancy/rsyn-x/x/demo/designs/timer/timer timer || exit 1
# /usr/local/share/qflow/scripts/display.sh /home/naufal/Documents/auc/ravacancy/rsyn-x/x/demo/designs/timer/timer timer || exit 1
