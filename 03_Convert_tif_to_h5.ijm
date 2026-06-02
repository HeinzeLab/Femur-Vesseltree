// Convert tif files to ilastik .h5 format
// Input: Preprocessed tif-files of the MK channel
// Output: ilastik .h5 formatted preprocessed MK channel

// File 1
open("W:/AG Stegner/Femur-Gefaessbaum/09_MKs/Median_UM_tif/VK-AA498_shaft_Median_UM.tif");
selectImage("VK-AA498_shaft_Median_UM.tif");
run("Export HDF5", "input=VK-AA498_shaft_Median_UM.tif exportpath=[W:\\AG Stegner\\Femur-Gefaessbaum\\09_MKs\\Ilastik\\VK-AA498_shaft_Median_UM.h5] datasetname=/data compressionlevel=0");

// File 2
open("W:/AG Stegner/Femur-Gefaessbaum/09_MKs/Median_UM_tif/VK-AA499_shaft_Median_UM.tif");
selectImage("VK-AA499_shaft_Median_UM.tif");
run("Export HDF5", "input=VK-AA499_shaft_Median_UM.tif exportpath=[W:\\AG Stegner\\Femur-Gefaessbaum\\09_MKs\\Ilastik\\VK-AA499_shaft_Median_UM.h5] datasetname=/data compressionlevel=0");

// File 3
open("W:/AG Stegner/Femur-Gefaessbaum/09_MKs/Median_UM_tif/VK-AA500_shaft_Median_UM.tif");
selectImage("VK-AA500_shaft_Median_UM.tif");
run("Export HDF5", "input=VK-AA500_shaft_Median_UM.tif exportpath=[W:\\AG Stegner\\Femur-Gefaessbaum\\09_MKs\\Ilastik\\VK-AA500_shaft_Median_UM.h5] datasetname=/data compressionlevel=0");

// File 4
open("W:/AG Stegner/Femur-Gefaessbaum/09_MKs/Median_UM_tif/VK-AA501_shaft_Median_UM.tif");
selectImage("VK-AA501_shaft_Median_UM.tif");
run("Export HDF5", "input=VK-AA501_shaft_Median_UM.tif exportpath=[W:\\AG Stegner\\Femur-Gefaessbaum\\09_MKs\\Ilastik\\VK-AA501_shaft_Median_UM.h5] datasetname=/data compressionlevel=0");

// File 5
open("W:/AG Stegner/Femur-Gefaessbaum/09_MKs/Median_UM_tif/VK-AA502_shaft_Median_UM.tif");
selectImage("VK-AA502_shaft_Median_UM.tif");
run("Export HDF5", "input=VK-AA502_shaft_Median_UM.tif exportpath=[W:\\AG Stegner\\Femur-Gefaessbaum\\09_MKs\\Ilastik\\VK-AA502_shaft_Median_UM.h5] datasetname=/data compressionlevel=0");
