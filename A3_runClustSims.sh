#!/bin/bash

#Runs GLMfit for Freesurfer data

## Study name
study=${1}

## Output Directory
out_dir=${2}

for meas in volume thickness ; do
   for hemi in lh rh ; do
      for smoothness in 10 ; do
              for dir in ${hemi}.${meas}.${smoothness}.${study}.glmdir ; do
		echo $dir
                  mri_glmfit-sim --glmdir ${out_dir}/${dir} --cache 3 pos --cwp 0.05 --2spaces 
              done
      	  done
     done
done
