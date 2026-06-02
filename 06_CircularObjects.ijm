// Finding vessels which are cut perpendicular, i.e. show a circularity between 0.9 - 1.0
// Input: tif-files of segmented CD105 channel exported from Imaris
// Output: csv-file with all circular objects found and their properties
// Note: (1) CD105 data has been cut in 9 overlapping slices and (2) this script opens each tile 3x
// to classify the circular objects whether they are cut perpendicular in the x-y, x-z or y-z plane.
// Attention: Adjust the number of slices accordingly!


//x-y plane
// File 1
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA762_shaft_0-830.tif");
run("Properties...", "channels=1 slices=497 frames=1 pixel_width=2.6 pixel_height=2.6 voxel_depth=5.0");

setThreshold(128, 255, "raw");
run("Set Measurements...", "area centroid center shape area_fraction stack redirect=None decimal=3");
run("Analyze Particles...", "size=15 pixel circularity=0.90-1.00 display include stack");
saveAs("Results", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/circular_objects/VK-AA762_shaft_0-830_x-y.csv");
run("Close");
close("*");

// File 2
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA762_shaft_830-1660.tif");
run("Properties...", "channels=1 slices=497 frames=1 pixel_width=2.6 pixel_height=2.6 voxel_depth=5.0");

setThreshold(128, 255, "raw");
run("Set Measurements...", "area centroid center shape area_fraction stack redirect=None decimal=3");
run("Analyze Particles...", "size=15 pixel circularity=0.90-1.00 display include stack");
saveAs("Results", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/circular_objects/VK-AA762_shaft_830-1660_x-y.csv");
run("Close");
close("*");

// File 3
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA762_shaft_1660-2490.tif");
run("Properties...", "channels=1 slices=497 frames=1 pixel_width=2.6 pixel_height=2.6 voxel_depth=5.0");

setThreshold(128, 255, "raw");
run("Set Measurements...", "area centroid center shape area_fraction stack redirect=None decimal=3");
run("Analyze Particles...", "size=15 pixel circularity=0.90-1.00 display include stack");
saveAs("Results", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/circular_objects/VK-AA762_shaft_1660-2490_x-y.csv");
run("Close");
close("*");

// File 4
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA762_shaft_2490-3320.tif");
run("Properties...", "channels=1 slices=497 frames=1 pixel_width=2.6 pixel_height=2.6 voxel_depth=5.0");

setThreshold(128, 255, "raw");
run("Set Measurements...", "area centroid center shape area_fraction stack redirect=None decimal=3");
run("Analyze Particles...", "size=15 pixel circularity=0.90-1.00 display include stack");
saveAs("Results", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/circular_objects/VK-AA762_shaft_2490-3320_x-y.csv");
run("Close");
close("*");

// File 5
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA762_shaft_3320-4150.tif");
run("Properties...", "channels=1 slices=497 frames=1 pixel_width=2.6 pixel_height=2.6 voxel_depth=5.0");

setThreshold(128, 255, "raw");
run("Set Measurements...", "area centroid center shape area_fraction stack redirect=None decimal=3");
run("Analyze Particles...", "size=15 pixel circularity=0.90-1.00 display include stack");
saveAs("Results", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/circular_objects/VK-AA762_shaft_3320-4150_x-y.csv");
run("Close");
close("*");

//x-z plane
// File 1
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA762_shaft_0-830.tif");
run("Properties...", "channels=1 slices=497 frames=1 pixel_width=2.6 pixel_height=2.6 voxel_depth=5.0");
run("TransformJ Turn", "z-angle=0 y-angle=0 x-angle=90");

setThreshold(128, 255, "raw");
run("Set Measurements...", "area centroid center shape area_fraction stack redirect=None decimal=3");
run("Analyze Particles...", "size=15 pixel circularity=0.90-1.00 display include stack");
saveAs("Results", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/circular_objects/VK-AA762_shaft_0-830_x-z.csv");
run("Close");
close("*");

// File 2
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA762_shaft_830-1660.tif");
run("Properties...", "channels=1 slices=497 frames=1 pixel_width=2.6 pixel_height=2.6 voxel_depth=5.0");
run("TransformJ Turn", "z-angle=0 y-angle=0 x-angle=90");

setThreshold(128, 255, "raw");
run("Set Measurements...", "area centroid center shape area_fraction stack redirect=None decimal=3");
run("Analyze Particles...", "size=15 pixel circularity=0.90-1.00 display include stack");
saveAs("Results", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/circular_objects/VK-AA762_shaft_830-1660_x-z.csv");
run("Close");
close("*");

// File 3
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA762_shaft_1660-2490.tif");
run("Properties...", "channels=1 slices=497 frames=1 pixel_width=2.6 pixel_height=2.6 voxel_depth=5.0");
run("TransformJ Turn", "z-angle=0 y-angle=0 x-angle=90");

setThreshold(128, 255, "raw");
run("Set Measurements...", "area centroid center shape area_fraction stack redirect=None decimal=3");
run("Analyze Particles...", "size=15 pixel circularity=0.90-1.00 display include stack");
saveAs("Results", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/circular_objects/VK-AA762_shaft_1660-2490_x-z.csv");
run("Close");
close("*");

// File 4
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA762_shaft_2490-3320.tif");
run("Properties...", "channels=1 slices=497 frames=1 pixel_width=2.6 pixel_height=2.6 voxel_depth=5.0");
run("TransformJ Turn", "z-angle=0 y-angle=0 x-angle=90");

setThreshold(128, 255, "raw");
run("Set Measurements...", "area centroid center shape area_fraction stack redirect=None decimal=3");
run("Analyze Particles...", "size=15 pixel circularity=0.90-1.00 display include stack");
saveAs("Results", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/circular_objects/VK-AA762_shaft_2490-3320_x-z.csv");
run("Close");
close("*");

// File 5
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA762_shaft_3320-4150.tif");
run("Properties...", "channels=1 slices=497 frames=1 pixel_width=2.6 pixel_height=2.6 voxel_depth=5.0");
run("TransformJ Turn", "z-angle=0 y-angle=0 x-angle=90");

setThreshold(128, 255, "raw");
run("Set Measurements...", "area centroid center shape area_fraction stack redirect=None decimal=3");
run("Analyze Particles...", "size=15 pixel circularity=0.90-1.00 display include stack");
saveAs("Results", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/circular_objects/VK-AA762_shaft_3320-4150_x-z.csv");
run("Close");
close("*");

//z-y
// File 1
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA762_shaft_0-830.tif");
run("Properties...", "channels=1 slices=497 frames=1 pixel_width=2.6 pixel_height=2.6 voxel_depth=5.0");
run("TransformJ Turn", "z-angle=0 y-angle=90 x-angle=0");

setThreshold(128, 255, "raw");
run("Set Measurements...", "area centroid center shape area_fraction stack redirect=None decimal=3");
run("Analyze Particles...", "size=15 pixel circularity=0.90-1.00 display include stack");
saveAs("Results", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/circular_objects/VK-AA762_shaft_0-830_z-y.csv");
run("Close");
close("*");

// File 2
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA762_shaft_830-1660.tif");
run("Properties...", "channels=1 slices=497 frames=1 pixel_width=2.6 pixel_height=2.6 voxel_depth=5.0");
run("TransformJ Turn", "z-angle=0 y-angle=90 x-angle=0");

setThreshold(128, 255, "raw");
run("Set Measurements...", "area centroid center shape area_fraction stack redirect=None decimal=3");
run("Analyze Particles...", "size=15 pixel circularity=0.90-1.00 display include stack");
saveAs("Results", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/circular_objects/VK-AA762_shaft_830-1660_z-y.csv");
run("Close");
close("*");

// File 3
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA762_shaft_1660-2490.tif");
run("Properties...", "channels=1 slices=497 frames=1 pixel_width=2.6 pixel_height=2.6 voxel_depth=5.0");
run("TransformJ Turn", "z-angle=0 y-angle=90 x-angle=0");

setThreshold(128, 255, "raw");
run("Set Measurements...", "area centroid center shape area_fraction stack redirect=None decimal=3");
run("Analyze Particles...", "size=15 pixel circularity=0.90-1.00 display include stack");
saveAs("Results", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/circular_objects/VK-AA762_shaft_1660-2490_z-y.csv");
run("Close");
close("*");

// File 4
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA762_shaft_2490-3320.tif");
run("Properties...", "channels=1 slices=497 frames=1 pixel_width=2.6 pixel_height=2.6 voxel_depth=5.0");
run("TransformJ Turn", "z-angle=0 y-angle=90 x-angle=0");

setThreshold(128, 255, "raw");
run("Set Measurements...", "area centroid center shape area_fraction stack redirect=None decimal=3");
run("Analyze Particles...", "size=15 pixel circularity=0.90-1.00 display include stack");
saveAs("Results", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/circular_objects/VK-AA762_shaft_2490-3320_z-y.csv");
run("Close");
close("*");

// File 5
open("//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/VK-AA762_shaft_3320-4150.tif");
run("Properties...", "channels=1 slices=497 frames=1 pixel_width=2.6 pixel_height=2.6 voxel_depth=5.0");
run("TransformJ Turn", "z-angle=0 y-angle=90 x-angle=0");

setThreshold(128, 255, "raw");
run("Set Measurements...", "area centroid center shape area_fraction stack redirect=None decimal=3");
run("Analyze Particles...", "size=15 pixel circularity=0.90-1.00 display include stack");
saveAs("Results", "//HC1008/Users/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/circular_objects/VK-AA762_shaft_3320-4150_z-y.csv");
run("Close");
close("*");