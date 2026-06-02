// Define filepaths:
basename = "VK-AA499_shaft_590-1180"
af = "W:/AG Stegner/Femur-Gefaessbaum/11_Autofluorescence_filled/"
points = "W:/AG Stegner/Femur-Gefaessbaum/08_SmallVessels_Imaris_khm/Shaft_binaries/Skeleton/Skeleton_analyse/Branch_points_Visualization/"

// Load autofluorescence image and generate distance map
open (af + basename + "_AF.tif");
run("Scale...", "x=1.0 y=1.0 z=1.923 width=928 height=679 depth=1815 interpolation=Bilinear average process create");

setThreshold (129, 255);
setOption ("BlackBackground", true);
run ("Convert to Mask", "background=Dark black") ;
saveAs("Tiff", af+ basename + "_AF_scaled.tif");
selectImage(basename + "_AF_scaled.tif");
run("Chamfer Distance Map 3D", "distances=[Svensson <3,4,5,7>] output=[16 bits] normalize");

// Load branch points file
open(points + basename + "_BP.tif");
run("TransformJ Turn", "z-angle=0 y-angle=90 x-angle=0") ;
run("Reverse") ;
run("Scale...", "x=1.0 y=1.0 z=1.923 width=928 height=679 depth=1815 interpolation=Bilinear average process create");
setThreshold (129, 255) ;
setOption ("BlackBackground", true) ;
run ("Convert to Mask", "background=Dark black") ;
run("Skeletonize", "stack");
run("Divide...", "value=255 stack");
saveAs("Tiff", points + basename + "_BP_scaled.tif");

// Multiply distance map with branch points file
imageCalculator("Multiply create stack", basename + "_AF_scaled-dist",basename + "_BP_scaled.tif");
selectImage("Result of " + basename + "_AF_scaled-dist");
saveAs("Tiff", points+ "/Histograms/" + basename + "_BP_dist.tif");

// Load end points file
open(points + basename + "_DE.tif");
run("TransformJ Turn", "z-angle=0 y-angle=90 x-angle=0") ;
run("Reverse") ;
run("Scale...", "x=1.0 y=1.0 z=1.923 width=928 height=679 depth=1815 interpolation=Bilinear average process create");
setThreshold (129, 255) ;
setOption ("BlackBackground", true) ;
run ("Convert to Mask", "background=Dark black") ;
run("Skeletonize", "stack");
run("Divide...", "value=255 stack");
saveAs("Tiff", points + basename + "_DE_scaled.tif");

// Multiply distance map with branch points file
imageCalculator("Multiply create stack", basename + "_AF_scaled-dist",basename + "_DE_scaled.tif");
selectImage("Result of " + basename + "_AF_scaled-dist");
saveAs("Tiff", points+ "/Histograms/" + basename + "_DE_dist.tif");

close("*");