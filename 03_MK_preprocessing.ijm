// Preprocessing of MK channel to increase signal to noise ratio
// Two smotthing operations are performed: 1. Median filter with 1 px radius
// 2. Unsharp masking with a radius of 5 px and a weight of 0.5
// Input: tif-file of shaft ROI from MK channel (bakckground subtracted fluorescence)
// Output: processed tif-file

// File 1
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/09_MKs/Ilastik/Data/VK-AA758_shaft_MK.tif");
run("Median...", "radius=1 stack");
run("Unsharp Mask...", "radius=5 mask=0.50 stack");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/09_MKs/Ilastik/Data/VK-AA758_shaft_Median_UM.tif");
close();

// File 2
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/09_MKs/Ilastik/Data/VK-AA759_shaft_MK.tif");
run("Median...", "radius=1 stack");
run("Unsharp Mask...", "radius=5 mask=0.50 stack");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/09_MKs/Ilastik/Data/VK-AA759_shaft_Median_UM.tif");
close();

// File 3
open("W:/AG Stegner/Femur-Gefaessbaum/09_MKs/Ilastik/Data/VK-AA760_shaft_MK.tif");
run("Median...", "radius=1 stack");
run("Unsharp Mask...", "radius=5 mask=0.50 stack");
saveAs("Tiff", "W:/AG Stegner/Femur-Gefaessbaum/09_MKs/Ilastik/Data/VK-AA760_shaft_Median_UM.tif");
close();

// File 4
open("W:/AG Stegner/Femur-Gefaessbaum/09_MKs/Ilastik/Data/VK-AA761_shaft_MK.tif");
run("Median...", "radius=1 stack");
run("Unsharp Mask...", "radius=5 mask=0.50 stack");
saveAs("Tiff", "W:/AG Stegner/Femur-Gefaessbaum/09_MKs/Ilastik/Data/VK-AA761_shaft_Median_UM.tif");
close();

// File 5
open("W:/AG Stegner/Femur-Gefaessbaum/09_MKs/Ilastik/Data/VK-AA762_shaft_MK.tif");
run("Median...", "radius=1 stack");
run("Unsharp Mask...", "radius=5 mask=0.50 stack");
saveAs("Tiff", "W:/AG Stegner/Femur-Gefaessbaum/09_MKs/Ilastik/Data/VK-AA762_shaft_Median_UM.tif");
close();

