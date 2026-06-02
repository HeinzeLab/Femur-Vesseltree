###################################
# Katherina Hemmen ~ Core Unit Fluorescence Imaging ~ RVZ
# katherina.hemmen@uni-wuerzburg.de
#################################

# This script is used to divide the channels of the two vessel markers:
# Alexa647 = anti-CD31 (stains both large & small vessels)
# Alexa546 = anti-CD105 (stains small vessels only)
# Input: CD31 and CD105 fluorescence images
# Output: ratio image

# 1. Import all required libraries
from skimage import io
import numpy as np

# 2. Read input data C0 = A647, C1 = A546
c0 = io.imread('//HC1008/Users/AG Stegner/Femur-Gefaessbaum/01_Tiff_fused/VK-AA498_C1.tif')
c1 = io.imread('//HC1008/Users/AG Stegner/Femur-Gefaessbaum/01_Tiff_fused/VK-AA498_C2.tif')

# 3. Divide slice by slice
# Note:Images are very large (after division 32-bit float is obtained)
# For smaller file size, the ratio image is multiplied with 10'000
# and all pixel with intensity larger 65'535 are clipped at 65'535
# such that the images can be further processed in 16-bit format
ratio_img = []
for slice in range(c0.shape[0]):
    input_C0 = c0[slice,:,:]
    input_C1 = c1[slice,:,:]
    ratio = input_C0 / input_C1
    ratio = ratio * 10000
    clean_ratio = np.where(ratio > 65535, 65535, ratio)
    ratio_img.append(clean_ratio)

processed_img = (np.array(ratio_img, dtype=np.uint16))  # Note for overlay in Imaris 16-bit uint tiff required

# 4. Save results
io.imsave('//HC1008/Users/AG Stegner/Femur-Gefaessbaum/01_Tiff_fused/VK-AA498_ratio.tif', processed_img)
