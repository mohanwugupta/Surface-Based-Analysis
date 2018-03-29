#!/bin/sh

#Change the SUBJ LIST!!!

# load the job environment:
. /u/local/Modules/default/init/modules.sh
module use /u/project/CCN/apps/modulefiles
module load freesurfer
export SUBJECTS_DIR=/u/project/CCN/kkarlsgo/data/MEND/ANALYSES/SBA_wise_MG_2018

for hemi in lh rh ; do
      asegstats2table --subjectsfile=/u/project/CCN/kkarlsgo/data/MEND/ANALYSES/SBA_wise_MG_2018/scripts/FS_SBM_183_30_05_age_sex_3group_SUBJ_list.txt --meas volume --common-segs --stats=aseg.stats --tablefile segstats_${study}.txt

          for meas in volume thickness; do
              aparcstats2table --subjectsfile=/u/project/CCN/kkarlsgo/data/MEND/ANALYSES/SBA_wise_MG_2018/scripts/FS_SBM_183_30_05_age_sex_3group_SUBJ_list.txt --hemi ${hemi} --meas ${meas} --parc=aparc --table=aparc_${hemi}_${meas}.txt

          done
done
