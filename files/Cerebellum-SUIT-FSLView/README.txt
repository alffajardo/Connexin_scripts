Probablistic Cerebellar Atlas in SUIT space for use with FSLView. 
http://www.fmrib.ox.ac.uk/fsl/fslview/index.html

Use this probabistic Atlas only with imaging data aligned to SUIT space (Diedrichsen, 2006). 
http://www.bangor.ac.uk/~pss412/imaging/suit.htm 

While SUIT is spatially unbiased in relationship to MNI space, the alignment is better with SUIT. 
For data aligned with whole brain normalization methods, use the Cerebellar Atlas in MNI space after 
affine or non-linear alignment. 

Cerebellum-SUIT-maxprob.nii: 	Maximum probability map signifiying the most probable compartment (1-28) 
Cerebellum-SUIT-prob.nii: 	28 full probability maps for each of the compartments 

PLEASE CITE: Diedrichsen, Balster, Cummans, Ramnani (in preparation). 

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

