###################################
# Katherina Hemmen ~ Core Unit Fluorescence Imaging ~ RVZ
# katherina.hemmen@uni-wuerzburg.de
#################################

# Slices shaft ROI into 5 equally sized pieces
# Input: tif-file of shaft ROI from CD105, MK or AF channel
# Output: sliced tif-files

# 1. Import all required libraries
from skimage import io
import numpy as np
import glob
import os

# 2. Define path 
path = '//HC1008/Users/AG Stegner/Femur-Gefaessbaum/11_Autofluorescence_filled/Shaft_binaries/VK-AA762_shaft_AF.tif'

# 3. Loop over folder
for file in glob.glob(path):
    filename = os.path.abspath(file).split(".tif")[0]
    img = io.imread(file)
    
    zslices, yheight, xwidth = img.shape  # Get image dimensions
    chunk_size = int(yheight/5) # 5 chunks should be made
    
    for i in range(0,chunk_size*5,chunk_size): # ignore left over slices
        j = i + chunk_size
        selected_slices = img[:, i:j, :]
        io.imsave(filename + '_' + str(i) + '-' + str(j) + '.tif', selected_slices, check_contrast=False)
        i = i + chunk_size

