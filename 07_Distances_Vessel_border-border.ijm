// This script determines the distance between the CD105 vessel-vessel border.

// Input: segmented tif-files from AF and CD105 channel
// Output: Tif-file in which the intensity in the voxel encodes the distance between the CD105 vessel vessel border in pixel
// Note to obtain the final distance between two vessels multiply the distance in pixel by 2 and the pixel size  of 2.6 µm
// NOte 2: MorLibJ plugin required (https://imagej.net/plugins/morpholibj)

// File 1
// Fill holes in small vessel mask 
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA767_shaft_0-619.tif");
selectImage("VK-AA767_shaft_0-619.tif");
setOption("ScaleConversions", true);
run("8-bit");
run("Fill Holes", "stack");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_0-619_filled.tif");

// Invert small vessel mask
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_0-619_filled.tif");
selectImage("VK-AA767_shaft_0-619_filled.tif");
run("8-bit");
run("Invert", "stack");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_0-619_invert.tif");

//Load autofluorescence ROI & generate 0-1 containing file
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/11_Autofluorescence_filled/Shaft_binaries/VK-AA767_shaft_0-619_AF.tif");
selectImage("VK-AA767_shaft_0-619_AF.tif");
run("8-bit");
run("Divide...", "value=255 stack");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_0-619_AF_0-1.tif");

// Multiply inverted small vessel mask with autofluorescence ROI
imageCalculator("Multiply create stack", "VK-AA767_shaft_0-619_invert.tif","VK-AA767_shaft_0-619_AF_0-1.tif");
selectImage("Result of VK-AA767_shaft_0-619_invert.tif");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_0-619_invert_ROI.tif");

// Scale image to obtain x=y=z equal voxel sizes: Important as result will be reported in units of pixel
run("Scale...", "x=1.0 y=1.0 z=1.92 width=1024 height=1024 depth=1632 interpolation=Bilinear average process create");
setAutoThreshold("Default dark");
run("Convert to Mask", "background=Dark black");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_0-619_invert_ROI_resampled.tif");

// Generate skeleton from inverted, resampled mask in ROI
selectImage("VK-AA767_shaft_0-619_invert_ROI_resampled.tif");
run("Skeletonize (2D/3D)");
run("Divide...", "value=255 stack");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_0-619_invert_skeleton_ROI_resampled.tif");

// Run Distance transform using MorphoLibJ
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_0-619_invert_ROI_resampled.tif");
run("Chamfer Distance Map 3D", "distances=[Svensson <3,4,5,7>] output=[32 bits] normalize");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_0-619_invert_ROI_resampled-dist.tif");

// Multiply distance transform with skeleton from inverted-resampled ROI
imageCalculator("Multiply create stack", "VK-AA767_shaft_0-619_invert_skeleton_ROI_resampled.tif","VK-AA767_shaft_0-619_invert_ROI_resampled-dist.tif");
selectImage("Result of VK-AA767_shaft_0-619_invert_skeleton_ROI_resampled.tif");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_0-619_invert_skeleton_ROI_resampled_dist.tif");

//File 2
// Fill holes in small vessel mask
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA767_shaft_619-1238.tif");
selectImage("VK-AA767_shaft_619-1238.tif");
setOption("ScaleConversions", true);
run("8-bit");
run("Fill Holes", "stack");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_619-1238_filled.tif");

// Invert small vessel mask
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_619-1238_filled.tif");
selectImage("VK-AA767_shaft_619-1238_filled.tif");
run("8-bit");
run("Invert", "stack");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_619-1238_invert.tif");

//Load autofluorescence ROI & generate 0-1 containing file
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/11_Autofluorescence_filled/Shaft_binaries/VK-AA767_shaft_619-1238_AF.tif");
selectImage("VK-AA767_shaft_619-1238_AF.tif");
run("8-bit");
run("Divide...", "value=255 stack");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_619-1238_AF_0-1.tif");

// Multiply inverted small vessel mask with autofluorescence ROI
imageCalculator("Multiply create stack", "VK-AA767_shaft_619-1238_invert.tif","VK-AA767_shaft_619-1238_AF_0-1.tif");
selectImage("Result of VK-AA767_shaft_619-1238_invert.tif");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_619-1238_invert_ROI.tif");

// Scale image to obtain x=y=z equal voxel sizes: Important as result will be reported in units of pixel
run("Scale...", "x=1.0 y=1.0 z=1.92 width=1024 height=1024 depth=1632 interpolation=Bilinear average process create");
setAutoThreshold("Default dark");
run("Convert to Mask", "background=Dark black");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_619-1238_invert_ROI_resampled.tif");

// Generate skeleton from inverted, resampled mask in ROI
selectImage("VK-AA767_shaft_619-1238_invert_ROI_resampled.tif");
run("Skeletonize (2D/3D)");
run("Divide...", "value=255 stack");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_619-1238_invert_skeleton_ROI_resampled.tif");

// Run Distance transform using MorphoLibJ
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_619-1238_invert_ROI_resampled.tif");
run("Chamfer Distance Map 3D", "distances=[Svensson <3,4,5,7>] output=[32 bits] normalize");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_619-1238_invert_ROI_resampled-dist.tif");

// Multiply distance transform with skeleton from inverted-resampled ROI
imageCalculator("Multiply create stack", "VK-AA767_shaft_619-1238_invert_skeleton_ROI_resampled.tif","VK-AA767_shaft_619-1238_invert_ROI_resampled-dist.tif");
selectImage("Result of VK-AA767_shaft_619-1238_invert_skeleton_ROI_resampled.tif");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_619-1238_invert_skeleton_ROI_resampled_dist.tif");

// File 3
// Fill holes in small vessel mask
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA767_shaft_1238-1857.tif");
selectImage("VK-AA767_shaft_1238-1857.tif");
setOption("ScaleConversions", true);
run("8-bit");
run("Fill Holes", "stack");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_1238-1857_filled.tif");

// Invert small vessel mask
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_1238-1857_filled.tif");
selectImage("VK-AA767_shaft_1238-1857_filled.tif");
run("8-bit");
run("Invert", "stack");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_1238-1857_invert.tif");

//Load autofluorescence ROI & generate 0-1 containing file
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/11_Autofluorescence_filled/Shaft_binaries/VK-AA767_shaft_1238-1857_AF.tif");
selectImage("VK-AA767_shaft_1238-1857_AF.tif");
run("8-bit");
run("Divide...", "value=255 stack");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_1238-1857_AF_0-1.tif");

// Multiply inverted small vessel mask with autofluorescence ROI
imageCalculator("Multiply create stack", "VK-AA767_shaft_1238-1857_invert.tif","VK-AA767_shaft_1238-1857_AF_0-1.tif");
selectImage("Result of VK-AA767_shaft_1238-1857_invert.tif");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_1238-1857_invert_ROI.tif");

// Scale image to obtain x=y=z equal voxel sizes: Important as result will be reported in units of pixel
run("Scale...", "x=1.0 y=1.0 z=1.92 width=1024 height=1024 depth=1632 interpolation=Bilinear average process create");
setAutoThreshold("Default dark");
run("Convert to Mask", "background=Dark black");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_1238-1857_invert_ROI_resampled.tif");

// Generate skeleton from inverted, resampled mask in ROI
selectImage("VK-AA767_shaft_1238-1857_invert_ROI_resampled.tif");
run("Skeletonize (2D/3D)");
run("Divide...", "value=255 stack");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_1238-1857_invert_skeleton_ROI_resampled.tif");

// Run Distance transform using MorphoLibJ
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_1238-1857_invert_ROI_resampled.tif");
run("Chamfer Distance Map 3D", "distances=[Svensson <3,4,5,7>] output=[32 bits] normalize");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_1238-1857_invert_ROI_resampled-dist.tif");

// Multiply distance transform with skeleton from inverted-resampled ROI
imageCalculator("Multiply create stack", "VK-AA767_shaft_1238-1857_invert_skeleton_ROI_resampled.tif","VK-AA767_shaft_1238-1857_invert_ROI_resampled-dist.tif");
selectImage("Result of VK-AA767_shaft_1238-1857_invert_skeleton_ROI_resampled.tif");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_1238-1857_invert_skeleton_ROI_resampled_dist.tif");

// File 4
// Fill holes in small vessel mask
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA767_shaft_1857-2476.tif");
selectImage("VK-AA767_shaft_1857-2476.tif");
setOption("ScaleConversions", true);
run("8-bit");
run("Fill Holes", "stack");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_1857-2476_filled.tif");

// Invert small vessel mask
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_1857-2476_filled.tif");
selectImage("VK-AA767_shaft_1857-2476_filled.tif");
run("8-bit");
run("Invert", "stack");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_1857-2476_invert.tif");

//Load autofluorescence ROI & generate 0-1 containing file
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/11_Autofluorescence_filled/Shaft_binaries/VK-AA767_shaft_1857-2476_AF.tif");
selectImage("VK-AA767_shaft_1857-2476_AF.tif");
run("8-bit");
run("Divide...", "value=255 stack");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_1857-2476_AF_0-1.tif");

// Multiply inverted small vessel mask with autofluorescence ROI
imageCalculator("Multiply create stack", "VK-AA767_shaft_1857-2476_invert.tif","VK-AA767_shaft_1857-2476_AF_0-1.tif");
selectImage("Result of VK-AA767_shaft_1857-2476_invert.tif");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_1857-2476_invert_ROI.tif");

// Scale image to obtain x=y=z equal voxel sizes: Important as result will be reported in units of pixel
run("Scale...", "x=1.0 y=1.0 z=1.92 width=1024 height=1024 depth=1632 interpolation=Bilinear average process create");
setAutoThreshold("Default dark");
run("Convert to Mask", "background=Dark black");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_1857-2476_invert_ROI_resampled.tif");

// Generate skeleton from inverted, resampled mask in ROI
selectImage("VK-AA767_shaft_1857-2476_invert_ROI_resampled.tif");
run("Skeletonize (2D/3D)");
run("Divide...", "value=255 stack");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_1857-2476_invert_skeleton_ROI_resampled.tif");

// Run Distance transform using MorphoLibJ
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_1857-2476_invert_ROI_resampled.tif");
run("Chamfer Distance Map 3D", "distances=[Svensson <3,4,5,7>] output=[32 bits] normalize");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_1857-2476_invert_ROI_resampled-dist.tif");

// Multiply distance transform with skeleton from inverted-resampled ROI
imageCalculator("Multiply create stack", "VK-AA767_shaft_1857-2476_invert_skeleton_ROI_resampled.tif","VK-AA767_shaft_1857-2476_invert_ROI_resampled-dist.tif");
selectImage("Result of VK-AA767_shaft_1857-2476_invert_skeleton_ROI_resampled.tif");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_1857-2476_invert_skeleton_ROI_resampled_dist.tif");

// File 5
// Fill holes in small vessel mask
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA767_shaft_2476-3095.tif");
selectImage("VK-AA767_shaft_2476-3095.tif");
setOption("ScaleConversions", true);
run("8-bit");
run("Fill Holes", "stack");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_2476-3095_filled.tif");

// Invert small vessel mask
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_2476-3095_filled.tif");
selectImage("VK-AA767_shaft_2476-3095_filled.tif");
run("8-bit");
run("Invert", "stack");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_2476-3095_invert.tif");

//Load autofluorescence ROI & generate 0-1 containing file
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/11_Autofluorescence_filled/Shaft_binaries/VK-AA767_shaft_2476-3095_AF.tif");
selectImage("VK-AA767_shaft_2476-3095_AF.tif");
run("8-bit");
run("Divide...", "value=255 stack");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_2476-3095_AF_0-1.tif");

// Multiply inverted small vessel mask with autofluorescence ROI
imageCalculator("Multiply create stack", "VK-AA767_shaft_2476-3095_invert.tif","VK-AA767_shaft_2476-3095_AF_0-1.tif");
selectImage("Result of VK-AA767_shaft_2476-3095_invert.tif");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_2476-3095_invert_ROI.tif");

// Scale image to obtain x=y=z equal voxel sizes: Important as result will be reported in units of pixel
run("Scale...", "x=1.0 y=1.0 z=1.92 width=1024 height=1024 depth=1632 interpolation=Bilinear average process create");
setAutoThreshold("Default dark");
run("Convert to Mask", "background=Dark black");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_2476-3095_invert_ROI_resampled.tif");

// Generate skeleton from inverted, resampled mask in ROI
selectImage("VK-AA767_shaft_2476-3095_invert_ROI_resampled.tif");
run("Skeletonize (2D/3D)");
run("Divide...", "value=255 stack");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_2476-3095_invert_skeleton_ROI_resampled.tif");

// Run Distance transform using MorphoLibJ
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_2476-3095_invert_ROI_resampled.tif");
run("Chamfer Distance Map 3D", "distances=[Svensson <3,4,5,7>] output=[32 bits] normalize");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_2476-3095_invert_ROI_resampled-dist.tif");

// Multiply distance transform with skeleton from inverted-resampled ROI
imageCalculator("Multiply create stack", "VK-AA767_shaft_2476-3095_invert_skeleton_ROI_resampled.tif","VK-AA767_shaft_2476-3095_invert_ROI_resampled-dist.tif");
selectImage("Result of VK-AA767_shaft_2476-3095_invert_skeleton_ROI_resampled.tif");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/vessel-vessel/VK-AA767_shaft_2476-3095_invert_skeleton_ROI_resampled_dist.tif");
