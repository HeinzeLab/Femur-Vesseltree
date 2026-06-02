// Determine the surface and volume  for all found objects in CD105 and MK channels
// Input: Binary (segmented) CD105 or MK image exported from Imaris
// Output: List of objects with their respective surface and volume
// Attention Make sure these two parameter are selected in 3D ROI Manager settings as output!

// Load file
open("//HC1008/users/AG Stegner/Femur-Gefaessbaum/09_MKs/Binary_MKs/DS-AA473_shaft_9_MK.tif");
run("Properties...", "channels=1 slices=397 frames=1 pixel_width=2.6 pixel_height=2.6 voxel_depth=5");
run("3D Manager");
//"selectImage("VK-AA500_shaft_2148-2864.tif-3Dseg");
Ext.Manager3D_Segment(128, 255);
Ext.Manager3D_AddImage;
Ext.Manager3D_Measure;
// Manually save result of 3D manager
// Clean results in 3D ROI manager