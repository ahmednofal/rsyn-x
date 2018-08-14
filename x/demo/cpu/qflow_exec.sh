#!/bin/tcsh -f
#-------------------------------------------
# qflow exec script for project /home/naufal/Documents/auc/ravacancy/rsyn-x/x/demo/cpu
#-------------------------------------------

# /usr/local/share/qflow/scripts/synthesize.sh /home/naufal/Documents/auc/ravacancy/rsyn-x/x/demo/cpu cpu /home/naufal/Documents/auc/ravacancy/rsyn-x/x/demo/cpu/cpu.rtlnopwr.v || exit 1
# /usr/local/share/qflow/scripts/placement.sh -d /home/naufal/Documents/auc/ravacancy/rsyn-x/x/demo/cpu cpu || exit 1
# /usr/local/share/qflow/scripts/vesta.sh /home/naufal/Documents/auc/ravacancy/rsyn-x/x/demo/cpu cpu || exit 1
/usr/local/share/qflow/scripts/router.sh /home/naufal/Documents/auc/ravacancy/rsyn-x/x/demo/cpu cpu || exit 1
# /usr/local/share/qflow/scripts/vesta.sh -d /home/naufal/Documents/auc/ravacancy/rsyn-x/x/demo/cpu cpu || exit 1
# /usr/local/share/qflow/scripts/cleanup.sh /home/naufal/Documents/auc/ravacancy/rsyn-x/x/demo/cpu cpu || exit 1
# /usr/local/share/qflow/scripts/display.sh /home/naufal/Documents/auc/ravacancy/rsyn-x/x/demo/cpu cpu || exit 1
