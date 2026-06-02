// This script determines the distance between MK border to the CD105 border.
// It requires files which are generated in 07_Distances_Vessel_border-border.ijm
// Please run the other script first!

// Input: segmented tif-files from MK, AF and CD105 channel
// Output: Tif-file in which the intensity in the voxel encodes the distance between the MK and CD105 border in pixel

//Please enter path and file name without .tif
//Define path of the files to be processed
Path1="//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/";//CD105 channel
Path2="//HC1008/users/AG Stegner/Femur-Gefaessbaum/11_Autofluorescence_filled/Shaft_binaries/";//autofluorescence channel / _AF.tif
Path3="//HC1008/users/AG Stegner/Femur-Gefaessbaum/09_MKs/Binary_MKs/";//Megakaryocytes / _MK.tif
//Define path/folder for saving
SPath1="//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/";
SPath2="//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-MK/";
//Filename without .tif
File1="VK-AA767_shaft_0-619"; //VK-AA767_shaft_Chunk1;
File2="VK-AA767_shaft_619-1238";//VK-AA767_shaft_Chunk2;
File3="VK-AA767_shaft_1238-1857";//VK-AA767_shaft_Chunk3;
File4="VK-AA767_shaft_1857-2476";//VK-AA767_shaft_Chunk4;
File5="VK-AA767_shaft_2476-3095";//VK-AA767_shaft_Chunk5;

//Chunk1
// Load MK binary
open(Path3+File1+"_MK.tif");
setOption("ScaleConversions", true);
run("8-bit");
// Multiply with autofluorescence ROI
open(SPath1+File1+"_AF_0-1.tif");
imageCalculator("Multiply create stack", File1+"_MK.tif",File1+"_AF_0-1.tif");
selectImage("Result of "+File1+"_MK.tif");
saveAs("Tiff", SPath2+File1+"_MK_ROI.tif");

// Scale identical to distance map from small vessel channel
run("Scale...", "x=1.0 y=1.0 z=1.92 width=1024 height=1024 depth=1632 interpolation=Bilinear average process create");
setAutoThreshold("Default dark");
run("Convert to Mask", "background=Dark black");
saveAs("Tiff", SPath2+File1+"_MK_ROI_resampled.tif");

// Generate outlines of MKs (for MK-border to vessel border distance)
selectImage(File1+"_MK_ROI_resampled.tif");
run("Outline", "stack");
run("Divide...", "value=255 stack");
saveAs("Tiff", SPath2+File1+"_MK_outlines_ROI_resampled.tif");

// Multiply outlines with distance transform from inverted-resampled ROI of small vessel
open(SPath1+File1+"_invert_ROI_resampled-dist.tif");
imageCalculator("Multiply create stack", File1+"_MK_outlines_ROI_resampled.tif",File1+"_invert_ROI_resampled-dist.tif");
selectImage("Result of "+File1+"_MK_outlines_ROI_resampled.tif");
saveAs("Tiff", SPath2+File1+"_MK_outlines_ROI_resampled_dist.tif");

//Chunk2
// Load MK binary
open(Path3+File2+"_MK.tif");
setOption("ScaleConversions", true);
run("8-bit");

// Multiply with autofluorescence ROI
open(SPath1+File2+"_AF_0-1.tif");
imageCalculator("Multiply create stack", File2+"_MK.tif",File2+"_AF_0-1.tif");
selectImage("Result of "+File2+"_MK.tif");
saveAs("Tiff", SPath2+File2+"_MK_ROI.tif");

// Scale identical to distance map from small vessel channel
run("Scale...", "x=1.0 y=1.0 z=1.92 width=1024 height=1024 depth=1632 interpolation=Bilinear average process create");
setAutoThreshold("Default dark");
run("Convert to Mask", "background=Dark black");
saveAs("Tiff", SPath2+File2+"_MK_ROI_resampled.tif");

// Generate outlines of MKs (for MK-border to vessel border distance)
selectImage(File2+"_MK_ROI_resampled.tif");
run("Outline", "stack");
run("Divide...", "value=255 stack");
saveAs("Tiff", SPath2+File2+"_MK_outlines_ROI_resampled.tif");

// Multiply outlines with distance transform from inverted-resampled ROI of small vessel
open(SPath1+File2+"_invert_ROI_resampled-dist.tif");
imageCalculator("Multiply create stack", File2+"_MK_outlines_ROI_resampled.tif",File2+"_invert_ROI_resampled-dist.tif");
selectImage("Result of "+File2+"_MK_outlines_ROI_resampled.tif");
saveAs("Tiff", SPath2+File2+"_MK_outlines_ROI_resampled_dist.tif");

//Chunk3
// Load MK binary
open(Path3+File3+"_MK.tif");
setOption("ScaleConversions", true);
run("8-bit");

// Multiply with autofluorescence ROI
open(SPath1+File3+"_AF_0-1.tif");
imageCalculator("Multiply create stack", File3+"_MK.tif",File3+"_AF_0-1.tif");
selectImage("Result of "+File3+"_MK.tif");
saveAs("Tiff", SPath2+File3+"_MK_ROI.tif");

// Scale identical to distance map from small vessel channel
run("Scale...", "x=1.0 y=1.0 z=1.92 width=1024 height=1024 depth=1632 interpolation=Bilinear average process create");
setAutoThreshold("Default dark");
run("Convert to Mask", "background=Dark black");
saveAs("Tiff", SPath2+File3+"_MK_ROI_resampled.tif");

// Generate outlines of MKs (for MK-border to vessel border distance)
selectImage(File3+"_MK_ROI_resampled.tif");
run("Outline", "stack");
run("Divide...", "value=255 stack");
saveAs("Tiff", SPath2+File3+"_MK_outlines_ROI_resampled.tif");

// Multiply outlines with distance transform from inverted-resampled ROI of small vessel
open(SPath1+File3+"_invert_ROI_resampled-dist.tif");
imageCalculator("Multiply create stack", File3+"_MK_outlines_ROI_resampled.tif",File3+"_invert_ROI_resampled-dist.tif");
selectImage("Result of "+File3+"_MK_outlines_ROI_resampled.tif");
saveAs("Tiff", SPath2+File3+"_MK_outlines_ROI_resampled_dist.tif");

//Chunk4
// Load MK binary
open(Path3+File4+"_MK.tif");
setOption("ScaleConversions", true);
run("8-bit");

// Multiply with autofluorescence ROI
open(SPath1+File4+"_AF_0-1.tif");
imageCalculator("Multiply create stack", File4+"_MK.tif",File4+"_AF_0-1.tif");
selectImage("Result of "+File4+"_MK.tif");
saveAs("Tiff", SPath2+File4+"_MK_ROI.tif");

// Scale identical to distance map from small vessel channel
run("Scale...", "x=1.0 y=1.0 z=1.92 width=1024 height=1024 depth=1632 interpolation=Bilinear average process create");
setAutoThreshold("Default dark");
run("Convert to Mask", "background=Dark black");
saveAs("Tiff", SPath2+File4+"_MK_ROI_resampled.tif");

// Generate outlines of MKs (for MK-border to vessel border distance)
selectImage(File4+"_MK_ROI_resampled.tif");
run("Outline", "stack");
run("Divide...", "value=255 stack");
saveAs("Tiff", SPath2+File4+"_MK_outlines_ROI_resampled.tif");

// Multiply outlines with distance transform from inverted-resampled ROI of small vessel
open(SPath1+File4+"_invert_ROI_resampled-dist.tif");
imageCalculator("Multiply create stack", File4+"_MK_outlines_ROI_resampled.tif",File4+"_invert_ROI_resampled-dist.tif");
selectImage("Result of "+File4+"_MK_outlines_ROI_resampled.tif");
saveAs("Tiff", SPath2+File4+"_MK_outlines_ROI_resampled_dist.tif");

//Chunk5
// Load MK binary
open(Path3+File5+"_MK.tif");
setOption("ScaleConversions", true);
run("8-bit");

// Multiply with autofluorescence ROI
open(SPath1+File5+"_AF_0-1.tif");
imageCalculator("Multiply create stack", File5+"_MK.tif",File5+"_AF_0-1.tif");
selectImage("Result of "+File5+"_MK.tif");
saveAs("Tiff", SPath2+File5+"_MK_ROI.tif");

// Scale identical to distance map from small vessel channel
run("Scale...", "x=1.0 y=1.0 z=1.92 width=1024 height=1024 depth=1632 interpolation=Bilinear average process create");
setAutoThreshold("Default dark");
run("Convert to Mask", "background=Dark black");
saveAs("Tiff", SPath2+File5+"_MK_ROI_resampled.tif");

// Generate outlines of MKs (for MK-border to vessel border distance)
selectImage(File5+"_MK_ROI_resampled.tif");
run("Outline", "stack");
run("Divide...", "value=255 stack");
saveAs("Tiff", SPath2+File5+"_MK_outlines_ROI_resampled.tif");

// Multiply outlines with distance transform from inverted-resampled ROI of small vessel
open(SPath1+File5+"_invert_ROI_resampled-dist.tif");
imageCalculator("Multiply create stack", File5+"_MK_outlines_ROI_resampled.tif",File5+"_invert_ROI_resampled-dist.tif");
selectImage("Result of "+File5+"_MK_outlines_ROI_resampled.tif");
saveAs("Tiff", SPath2+File5+"_MK_outlines_ROI_resampled_dist.tif");
