// Load LSFM raw image files which were saved as 1 file per channel
// Re-save as tif to also remove all metadata as occurs when re-saing the 1 file per channel and slice tiles
// BigStitcher needs all image tiles to contain same metadata

run("Bio-Formats", "open=[//HC1008/Users/AG Stegner/Femur-Gefaessbaum/00_RAW/VK-AA501/8-1/8-1_w0000.tif] autoscale color_mode=Default group_files rois_import=[ROI manager] split_channels view=Hyperstack stack_order=XYCZT dimensions axis_1_number_of_images=4 axis_1_axis_first_image=0 axis_1_axis_increment=1 contains=[] name=[\\\\HC1008\\Users\\AG Stegner\\Femur-Gefaessbaum\\00_RAW\\VK-AA501\\8-1\\8-1_w000<0-3>.tif]");

saveAs("Tiff", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/00_RAW/VK-AA501/8-1_w0003.tif");
close();
saveAs("Tiff", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/00_RAW/VK-AA501/8-1_w0002.tif");
close();
saveAs("Tiff", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/00_RAW/VK-AA501/8-1_w0001.tif");
close();
saveAs("Tiff", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/00_RAW/VK-AA501/8-1_w0000.tif");
close();
