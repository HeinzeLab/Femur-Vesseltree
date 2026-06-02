// Convert Ilastik output files from h5 format to tif
// Input: .h5 ilastik MK probability files
// Output: MK probabilities in tif-format

// File 1
run("Import HDF5", "select=[//HC1008/users/AG Stegner/Femur-Gefaessbaum/09_MKs/Probabilities/VK-AA758_shaft_Median_UM_Probabilities.h5] datasetname=/exported_data axisorder=tzyxc");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/09_MKs/Probabilities/VK-AA758_shaft_Median_UM_Probabilities.tif");
close();

// File 2
run("Import HDF5", "select=[//HC1008/users/AG Stegner/Femur-Gefaessbaum/09_MKs/Probabilities/VK-AA759_shaft_Median_UM_Probabilities.h5] datasetname=/exported_data axisorder=tzyxc");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/09_MKs/Probabilities/VK-AA759_shaft_Median_UM_Probabilities.tif");
close();

// File 3
run("Import HDF5", "select=[//HC1008/users/AG Stegner/Femur-Gefaessbaum/09_MKs/Probabilities/VK-AA760_shaft_Median_UM_Probabilities.h5] datasetname=/exported_data axisorder=tzyxc");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/09_MKs/Probabilities/VK-AA760_shaft_Median_UM_Probabilities.tif");
close();

// File 4
run("Import HDF5", "select=[//HC1008/users/AG Stegner/Femur-Gefaessbaum/09_MKs/Probabilities/VK-AA762_shaft_Median_UM_Probabilities.h5] datasetname=/exported_data axisorder=tzyxc");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/09_MKs/Probabilities/VK-AA762_shaft_Median_UM_Probabilities.tif");
close();

// File 5
run("Import HDF5", "select=[//HC1008/users/AG Stegner/Femur-Gefaessbaum/09_MKs/Probabilities/VK-AA761_shaft_Median_UM_Probabilities.h5] datasetname=/exported_data axisorder=tzyxc");
saveAs("Tiff", "//HC1008/users/AG Stegner/Femur-Gefaessbaum/09_MKs/Probabilities/VK-AA761_shaft_Median_UM_Probabilities.tif");
close();