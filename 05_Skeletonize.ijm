// Generate the skeleton of the CD105 channel
// Input: Binary/segmented tif-files of the CD105 surface segmentation exported from Imaris
// Output: Skeletonized tif-files
// Note: The exported Imais segmentation has already been split into the individual tiles

// Tile 1
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA761_shaft_0-767.tif");
run("8-bit");
run("Skeletonize (2D/3D)");
saveAs("Tiff", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA761_shaft_0-767_skeleton.tif");
close("*");

// Tile 2
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA761_shaft_767-1534.tif");
run("8-bit");
run("Skeletonize (2D/3D)");
saveAs("Tiff", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA761_shaft_767-1534_skeleton.tif");
close("*");

// Tile 3
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA761_shaft_1534-2301.tif");
run("8-bit");
run("Skeletonize (2D/3D)");
saveAs("Tiff", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA761_shaft_1534-2301_skeleton.tif");
close("*");

// Tile 4
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA761_shaft_2301-3068.tif");
run("8-bit");
run("Skeletonize (2D/3D)");
saveAs("Tiff", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA761_shaft_2301-3068_skeleton.tif");
close("*");

// Tile 5
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA761_shaft_3068-3835.tif");
run("8-bit");
run("Skeletonize (2D/3D)");
saveAs("Tiff", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA761_shaft_3068-3835_skeleton.tif");
close("*");

// Tile 6
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA761_shaft_383-1150.tif");
run("8-bit");
run("Skeletonize (2D/3D)");
saveAs("Tiff", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA761_shaft_383-1150_skeleton.tif");
close("*");

// Tile 7
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA761_shaft_1150-1917.tif");
run("8-bit");
run("Skeletonize (2D/3D)");
saveAs("Tiff", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA761_shaft_1150-1917_skeleton.tif");
close("*");

// Tile 8
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA761_shaft_1917-2684.tif");
run("8-bit");
run("Skeletonize (2D/3D)");
saveAs("Tiff", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA761_shaft_1917-2684_skeleton.tif");
close("*");

// Tile 9
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA761_shaft_2684-3451.tif");
run("8-bit");
run("Skeletonize (2D/3D)");
saveAs("Tiff", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA761_shaft_2684-3451_skeleton.tif");
close("*");