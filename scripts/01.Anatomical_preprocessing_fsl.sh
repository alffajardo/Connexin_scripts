#!/bin/bash

# Name: 


# Note:
# Nifti_files

### for now we create the basic commads
## we will later do this to make it work for every script


## output directory

subject_id='sub-01'
output_basedir='derivatives'
output_dir=${output_basedir}/preproc.fsl/anat/${subject_id}

# create a directory for the subject

if [[  ! -d "${output_dir}" ]] ; then

    echo sleep 0.5s 
    echo 
    echo "++ Creating ${subject_id} directory"

    else
    sleep 0.5s 
    echo "++ Directory Exists!!!" 
fi



