###################################
# Katherina Hemmen ~ Core Unit Fluorescence Imaging ~ RVZ
# katherina.hemmen@uni-wuerzburg.de
#################################

# This script is used to determine the volume of surface
# based on the exported binary files of CD105, MK and AF
# Input: binary (segmented) tif-files of CD105, MK or AF exported from Imaris
# Output: TXT-file with a list of file name, volume in px and volume in um^3

# 1. Import all required libraries
from skimage import io
import numpy as np
import glob
import os

# 2. Read input data (e.g. binary autofluorescence)
path = '//HC1008/users/AG Stegner/Femur-Gefaessbaum/11_Autofluorescence_filled/Shaft_binaries/*.tif'

# Generate empty lists of parameter to save
list_volumes = []
list_volumes_px = []
list_filenames = []

# Define voxel volume 2.6 * 2.6 * 5.0 um
voxel_volume = 33.8  # um^3

# Loop over the folder of images to process them
for file in glob.glob(path):
    filename = os.path.abspath(file).split(".")[0]
    img = io.imread(file)
    
    # Count non-zero voxel by setting them to 1
    # and calculating the sum of the image
    volume = np.where(img > 0, 1, 0)
    total_volume_px = np.sum(volume)
    # Convert number of pixel to volume in um^3
    total_volume = total_volume_px * voxel_volume

    list_volumes_px.append(total_volume_px)
    list_volumes.append(total_volume)
    list_filenames.append(filename)

volumes_px = np.array(list_volumes_px)
volumes = np.array(list_volumes)
filenames = np.array(list_filenames)

# Save result to txt file
np.savetxt('//HC1008/Users/AG Stegner/Femur-Gefaessbaum/11_Autofluorescence_filled/AF_volume.txt',
           np.vstack([filenames, volumes_px, volumes]).T, fmt="%s")

