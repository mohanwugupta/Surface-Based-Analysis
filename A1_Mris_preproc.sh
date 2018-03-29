#!/bin/bash

## Study name
study=${1}

## FSGD file name
FSGD=${2}

## Output Directory
out_dir=${3}

for hemi in lh rh ; do
      for smoothing in 10 ; do
          for meas in volume thickness ; do
              mris_preproc --fsgd $FSGD.fsgd \
                  --cache-in ${meas}.fwhm${smoothing}.fsaverage \
                  --target fsaverage \
                  --hemi ${hemi} \
                  --out ${out_dir}/${hemi}.${meas}.${smoothing}.${study}.mgh
           done
      done
done
