Probablistic Cerebellar Atlas in SUIT space for use with FSLView. 
http://www.fmrib.ox.ac.uk/fsl/fslview/index.html

The atlas is generate by normalizing brains to the MNI152_T1_2mm_brain.nii.gz template using FNIRT (with default parameters in  
using the FSL package  
http://www.fmrib.ox.ac.uk/fsl/

For data aligned with SUIT (Diedrichsen,  2006) or other normalization methods, check for more accurate atlasess
http://www.bangor.ac.uk/~pss412/imaging/propatlas.htm 

Cerebellum-MNIflirt-maxprob.nii: 	Maximum probability map signifiying the most probable compartment (1-28) 
Cerebellum-MNIflirt-prob.nii: 	28 full probability maps for each of the compartments 

PLEASE CITE: Diedrichsen, Balster, Flavell, Cummans, Ramnani (in preparation). 

Download the package 
Open a Terminal 
Navigate into the folder (i.e. cd ~/Desktop/Cerebellum-SUIT-FSLView)
run ./install.scp
The script installs the maps into the appropriate location in $FSLDIR 
You will be prompted for your password 
Next time you start FSLView, go to 
Toolbars -> Atlas Widget 
You should find the cerebellar atlas as one of the choices 

For more information: 
http://www.bangor.ac.uk/~pss412/imaging/propatlas.htm 

