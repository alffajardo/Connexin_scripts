#!/bin/bash

# Name: 01.Anatomical_preprocessing_fsl


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
fithr='0.3'

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

echo "+++ Done!!"
echo

# Next step is to conduct Bias Fild correction in FSL
sleep 1 
echo "++ Starting Bias Field Correction..."

fast  -B \
--verbose \
--nopve \
-o ${T1w_basename}_Bfc \
${T1w_basename}.nii.gz
echo "+++ Done!!"
mv  ${T1w_basename}_Bfc_restore.nii.gz ${T1w_basename}_Bfc.nii.gz
echo

# Brain extraction tool 
sleep 1
echo "++ Starting Brain skull stripping..."
echo
bet ${T1w_basename}_Bfc.nii.gz \
${T1w_basename}_brain  -m \
-v \
-R  \
-f $fithr 
echo "+++ Done!!"



## After we are done with the mask next step to do registration to the MNI template


# Linear registration with Flirt

sleep 1
echo
echo "++ Computing Linear Transformation"

flirt \
    -in  ${T1w_basename}_Bfc.nii.gz \
    -ref ${FSLDIR}/data/standard/MNI152_T1_1mm.nii.gz  \
    -out ${T1w_basename}_space-tpl_affine.nii.gz \
    -omat ${T1w_basename}_affine.mat \
    -bins 256 \
    -cost corratio \
    -searchrx -90 90 \
    -searchry -90 90 \
    -searchrz -90 90 \
    -dof 12 \
    -interp trilinear
echo "+++ Done!!"
echo

# Now that we have done linear registration. Lets try non-linear registration
sleep 1
echo "++ Computing Non-Linear Transformation"

fnirt \
 --verbose \
 --iout=${T1w_basename}_space-tpl_warped.nii.gz  \
 --in=${T1w_basename}_Bfc.nii.gz \
 --aff=${T1w_basename}_affine.mat \
 --cout=${T1w_basename}_space-tpl_warp \
 --jout=${T1w_basename}_jac \
 --logout=${T1w_basename}2MNI152_1mm_non-linear.log \
 --ref=${FSLDIR}/data/standard/MNI152_T1_1mm.nii.gz  \
 --warpres=10,10,10

# Now that apply the matrix transformation to obtain the skull stripped imaged in MNI
# space

applywarp \
 --in=${T1w_basename}_brain.nii.gz \
 --ref=${FSLDIR}/data/standard/MNI152_T1_1mm.nii.gz \
 --coef=${T1w_basename}_space-tpl_warp.nii.gz \
 --premat=${T1w_basename}_affine.mat \
 --out=${T1w_basename}_space-tpl_brain_warped.nii.gz

