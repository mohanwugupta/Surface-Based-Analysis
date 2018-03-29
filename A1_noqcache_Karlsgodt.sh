#!/bin/bash

## Study name
study=${1}

## FSGD file name
FSGD=${2}

## Output Directory
out_dir=${3}

for hemi in lh rh ; do
	for meas in volume thickness; do
     		mris_preproc --fsgd $FSGD.fsgd \
		--target fsaverage \
		--hemi $hemi \
		--meas $meas \
		--out ${out_dir}/${hemi}.${meas}.00.${study}.mgh
          done
done

