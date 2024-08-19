#!/bin/bash

# Name: 


# Note:
# Nifti_files

### for now we create the basic commads
## we will later do this to make it work for every script


## output directory

subject_id='sub-01'
basedir=$PWD
output_basedir='derivatives'
output_dir=${output_basedir}/preproc.fsl/anat/${subject_id}
T1w='sub-01/ses-baseline/anat/sub-01_ses-baseline_T1w.nii'
T1w_basename=$(basename $T1w | cut -d '.' -f 1 )
fithr='0.33'

echo "++ Starting..."

sleep 1

# create a directory for the subject

if [[  ! -d "${output_dir}" ]] ; then
    echo 
    echo "++ Creating ${subject_id} directory"
    mkdir -p $output_dir

    else
    sleep 1
    echo "++ Directory Exists!!!" 
fi

fslmaths $T1w $output_dir/${T1w_basename}
cd $output_dir
# step 1: Reorientation of images.
sleep 1
echo ++ Reorienting file...

fslreorient2std  $T1w_basename ${T1w_basename}

echo " +++ Done!!"
echo

# Brain extraction tool 
sleep 1
echo "++ Starting Brain skull stripping..."
echo
bet ${T1w_basename}.nii.gz ${T1w_basename}_brain -v -R  -m  -B  -f $fithr
echo " +++ Done!!"

exit
