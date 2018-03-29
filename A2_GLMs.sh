#!/bin/bash

#Runs GLMfit for Freesurfer data
#YOU MUST CHANGE HOW MANY MTX FILES YOU HAVE BASED ON YOUR CONSTRASTS

## Study name
study=${1}

## FSGD file name
FSGD=${2}

# MTX file location and name 1
mtx1=${3}

# MTX file location and name 2
mtx2=${4}

mtx3=${5}
mtx4=${6}
mtx5=${7}
mtx6=${8}

## Output Directory
out_dir=${9}

for hemi in lh rh ; do
      for smoothness in 10 ; do
          for meas in volume thickness ; do
              mri_glmfit --y ${hemi}.${meas}.${smoothness}.${study}.mgh \
                  --fsgd  ${FSGD}.fsgd\
                  --C /u/project/CCN/kkarlsgo/data/MEND/ANALYSES/SBA_wise_MG_2018/Contrasts/${mtx1}.mtx \
                  --C /u/project/CCN/kkarlsgo/data/MEND/ANALYSES/SBA_wise_MG_2018/Contrasts/${mtx2}.mtx \
		  --C /u/project/CCN/kkarlsgo/data/MEND/ANALYSES/SBA_wise_MG_2018/Contrasts/${mtx3}.mtx \
		  --C /u/project/CCN/kkarlsgo/data/MEND/ANALYSES/SBA_wise_MG_2018/Contrasts/${mtx4}.mtx \
		  --C /u/project/CCN/kkarlsgo/data/MEND/ANALYSES/SBA_wise_MG_2018/Contrasts/${mtx5}.mtx \
		  --C /u/project/CCN/kkarlsgo/data/MEND/ANALYSES/SBA_wise_MG_2018/Contrasts/${mtx6}.mtx \
                  --surf fsaverage ${hemi} \
                  --cortex \
                  --glmdir ${out_dir}/${hemi}.${meas}.${smoothness}.${study}.glmdir
           done
      done
done
