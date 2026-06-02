// Load LSFM raw files which were saved as 1 file per channel and slice
// Re-save files as 1 file per channel

run("Bio-Formats", "open=[//HC1008/Users/AG Stegner/Femur-Gefaessbaum/00_RAW/VK-AA501/8-2/8-2_w0000_z0000.tif] autoscale color_mode=Default group_files rois_import=[ROI manager] split_channels view=Hyperstack stack_order=XYCZT dimensions axis_1_number_of_images=4 axis_1_axis_first_image=0 axis_1_axis_increment=1 axis_2_axis_first_image=0 axis_2_axis_increment=1 contains=[] name=[\\\\HC1008\\Users\\AG Stegner\\Femur-Gefaessbaum\\00_RAW\\VK-AA501\\8-2\\8-2_w000<0-3>_z<>.tif]");

saveAs("Tiff", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/00_RAW/VK-AA501/8-2_w0003.tif");
close();
saveAs("Tiff", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/00_RAW/VK-AA501/8-2_w0002.tif");
close();
saveAs("Tiff", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/00_RAW/VK-AA501/8-2_w0001.tif");
close();
saveAs("Tiff", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/00_RAW/VK-AA501/8-2_w0000.tif");
close();
