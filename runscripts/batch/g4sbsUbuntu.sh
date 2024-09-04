#!/bin/bash
export homedir=$HOME

export nevents=$1
export tempdir=$homedir/g4sbs/runscripts

export MACRO_PATH=$homedir/g4sbs/scripts/
export MCMACRO=$tempdir/g4sbs_$RUN_NUMBER.mac

echo "/g4sbs/filename $tempdir/g4sbs_$RUN_NUMBER.root" > $MCMACRO
cat $tempdir/gep_12GeV2_2023_base.mac >> $MCMACRO
echo "/g4sbs/run $nevents" >> $MCMACRO

cd $tempdir

export LD_LIBRARY_PATH=$ROOTSYS/lib:$LD_LIBRARY_PATH
export PATH=$ROOTSYS/bin:$PATH
g4sbs $MCMACRO #>& /dev/null
echo "****************** g4sbs Finished"

cp    ${tempdir}/"g4sbs_$RUN_NUMBER.root"   ${OUTPUT_DIR}/
rm -f ${tempdir}/"g4sbs_$RUN_NUMBER.root"
rm -f $MCMACRO
