#!/bin/bash

## Study name
study=${1}

## Output Directory
out_dir=${2}

for hemi in lh rh ; do
      for smoothing in 10; do
          for meas in volume thickness ; do
              mri_surf2surf --hemi $hemi --s fsaverage \
		  --sval ${hemi}.${meas}.00.${study}.mgh \
		  --fwhm $smoothing --cortex \
		  --tval ${out_dir}/${hemi}.${meas}.${smoothing}.${study}.mgh
           done
      done
done
