###################################
# Katherina Hemmen ~ Core Unit Fluorescence Imaging ~ RVZ
# katherina.hemmen@uni-wuerzburg.de
#################################

# Slices shaft ROI into 4 equally sized pieces, which are overlapping with the 
# 5 sclies created from "00_5slices.py"
# Input: tif-file of shaft ROI from CD105, MK or AF channel
# Output: sliced tif-files
# Attention: Adjust chunk size according the size determined from the 5 non-overlapping slices

# 1. Import all required libraries
from skimage import io
import numpy as np
import glob
import os

# 2. Define path 
filename = 'W:/AG Stegner/Femur-Gefaessbaum/09_MKs/Binary_MKs/VK-AA767_shaft_MK.tif'
img = io.imread(filename)

# 3. Loop through image
chunk_size = 619 # 4 chunks should be made
slice_start = int(chunk_size/2)
    
for i in range(slice_start, chunk_size*4, chunk_size): # ignore left over slices
    j = i + chunk_size
    selected_slices = img[:, i:j, :]
    io.imsave(filename + '_' + str(i) + '-' + str(j) + '.tif', selected_slices, check_contrast=False)
    i = i + chunk_size

