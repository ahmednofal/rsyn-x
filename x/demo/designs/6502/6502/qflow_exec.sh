#!/bin/tcsh -f
#-------------------------------------------
# qflow exec script for project /home/auc/work/samples/6502
#-------------------------------------------

/usr/local/share/qflow/scripts/synthesize.sh /home/auc/work/samples/6502 cpu /home/auc/work/samples/6502/source/cpu.v || exit 1
/usr/local/share/qflow/scripts/placement.sh -d /home/auc/work/samples/6502 cpu || exit 1
/usr/local/share/qflow/scripts/vesta.sh /home/auc/work/samples/6502 cpu || exit 1
/usr/local/share/qflow/scripts/router.sh /home/auc/work/samples/6502 cpu || exit 1
/usr/local/share/qflow/scripts/vesta.sh -d /home/auc/work/samples/6502 cpu || exit 1
/usr/local/share/qflow/scripts/cleanup.sh /home/auc/work/samples/6502 cpu || exit 1
/usr/local/share/qflow/scripts/display.sh /home/auc/work/samples/6502 cpu || exit 1
