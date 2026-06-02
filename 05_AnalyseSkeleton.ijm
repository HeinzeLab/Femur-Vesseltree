// Export the properoties of the skeletonized CD105 channels
// Input: skeleton tof file of the individual tiles of the CD105 channel
// Output: csv-files with (1) overall properties of the skeleton and (2) detailed properties of each branch found

open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/Skeleton/Tagged_VK-AA500_2864-3580_skeleton.tif");
run("Properties...", "channels=1 slices=599 frames=1 pixel_width=2.6 pixel_height=2.6 voxel_depth=5.0");
run("Analyze Skeleton (2D/3D)", "prune=none show");
selectWindow("Tagged skeleton");
saveAs("Tiff", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/Skeleton/Tagged_VK-AA500_2864-3580_skeleton.tif");
close();
selectWindow("VK-AA500_2864-3580_skeleton.tif");
close();

//Attention: Two windows wtih results are opened, which need to be saved manually!
// 1st result: overall summary
//saveAs("Results", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/Skeleton/Branch Information_VK-AA500_2864-3580.csv");
// 2nd result: Detailed list for each branch
//saveAs("Results", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/Skeleton/VK-AA500_2864-3580.csv");

