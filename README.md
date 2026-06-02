# Femur-Vesseltree
## Brief description

These scripts were to analyse the vessel tree of 25 mice femurs.

The results are published at: https://ashpublications.org/bloodvth/article/3/2/100156/567077/

Here, the complete femur bones were extracted, stained, and imaged on light-sheet fluorescence microscope in small tiles as described in the accompanying publication.

The individual tiles were stitched in Fiji using the BigStitcher and build the foundation of all analysis results shown here.

Each femur was imaged on four different channels:
- ch0: Megakaryocytes (Anti-GPIX labeled with Alexa750)
- ch1: Blood vessels (CD31-high, Anti-CD31 labeled with Alexa647)
- ch2: Blood vessels (CD31-low, Anti-CD105 labeled with  Alexa546)
- ch3: (residual) Autofluorescence, captured at 488 nm

Five data sets are provided on zenodo:
1) Young naive mouse: VK-AA501 (10.5281/zenodo.14752863)
2) Aged mouse: VK-AA760 (10.5281/zenodo.14753479)
3) Blood-let mouse: VK-AA764 (10.5281/zenodo.14753578)
4) Young naive female mouse: DS-AA464 (10.5281/zenodo.17637147)
5) Aged female mouse: DS-AA470 (10.5281/zenodo.17637430)

## List of scripts

| Name | Input | Output	| Purpose | 
| --- | --- | --- | --- |
| 00_5slices.py	| Binary files of whole shaft from AF, MK and CD105 segmentations	| Sliced binary files (non-overlapping)	| To cut bone marrow region in 5 equally sized pieces |
| 00_4slices_inbetween.py	| Binary files of whole shaft from AF, MK and CD105 segmentations	| Sliced binary files, overlapping the other 5 tiles	| Added to get a finer grid of parameter long the bone |
| 01_ExtractVolumes.py	| Binary, sliced AF file	| Volume in px /µm³	| Determine bone marrow volume |
| 02_SurfaceVolumeObjects.ijm	| Binary, sliced MK and CD105 segmentation	| Csv file with list of surface and volume per object	| Get the surface and volume of each object |
| 02_SurfaceVolumeRatio.ipynb	| Csv file with list of surface and volume per object	| Summarized values	| To summarize |
| 03_MK_preprocessing.ijm	| Background-corrected MK fluorescence channel	| Preprocessed MK channel	| increase contrast of MK channel |
| 03_Convert_tif_to_h5.ijm	| Preprocessed MK channel in tif-format	| Preprocessed MK channel in ilastik .h5 format |	File format conversion |
| 03_Convert_h5_to_tif.ijm	| MK probabilities in ilastik -h5 format	| MK probabilities in tif format	| File format conversion |
| 04_CalculateRatioA647A546.py	| Original fluorescence intensities of CD31 and CD105 channel	| Ratio image	| To calculate the ratio image |
| 05_Skeletonize.ijm	| Binary, sliced CD105 channel	| Skeleton	| Skeletonizes the binary CD105 channel |
| 05_AnalyseSkeleton.ijm	| Skeleton	| Csv file with properties	| Analyses the skeleton |
| 05_VesselSkeleton.ipynb	| Csv file from “AnalyseSkeleton”	| Summarized values, total vessel length | To summarize |
| 05_BranchingDegree.ipynb	| Csv file from “AnalyseSkeleton” |	Summary branching degree	| Creates a distribution of branching degrees for a given skeletonized microvascular region |
| 05_BranchPointsSorting_sorting.ipynb	| Csv file from “AnalyseSkeleton”	| Counts branching points & end points	| To summarize |
| 05_CalculateEP_BP_distances.ijm	| Image of Branching & End points, filled autofluorescence mask |	Calculates distance between branch and end points to bone marrow border	| To visualize & to get the distance distribution |
| 06_CircularObjects.ipynb | Binary, sliced CD105 mask	| Csv file with objects	| Find circular objects |
| 06_CircularProperties.ipynb	| Csv file with objects	| Summarized values	| To summarize |
| 06_EllipticalObjects.ijm	| Binary, sliced CD105 mask	| Csv file with objects	| Find elliptical objects |
| 06_VesselEllipsoid_parperp.ipynb	| Csv file with objects	| Summarized values	| To summarize |
| 06_AngularDistribution_EllipsoidObjects.ipynb	| Csv file with objects	Histogram	| To summarize |
| 06_Radiality_EllipsoidObjects.ipynb	| Csv file with objects	| Histogram	| To summarize |
| 07_Distances_Vessel_border-border.ijm	| Binary sliced CD105 and AF mask	| Distance map (tif-image)	| Vessel-border-border distance |
| 07_Distances_MK-vessel.ijm	| Binary sliced CD105, MK and AF mask	| Distance map (tif-image)	| Vessel-MK-border distance |
| 08_OverlayHistogramsDiameter.ipynb	| Csv file with objects	| Histogram	| To summarize csv file |
| 08_OverlayHistogramsBranchLength.ipynb	| Csv file with properties of all bones	| Summarizing histogram overlays	| To summarize |
| 08_OverlayHistogramsVessel-Vessel.ipynb	| Distance map (tif-image) | Histogram	| To summarize |
| 08_OverlayHistogramsVessel-MK.ipynb	| Distance map (tif-image), MK outlines (tif-image)	| Histogram	| To summarize |
| 08_OverlayHistogramsTortuosity.ipynb	| Txt file with branch length, Euclidean distance and tortuosity | Histogram	| To summarize |
| 08_BranchingAngles.ipynb	| Skeleton, Csv file from “AnalyseSkeleton”	| Summary branching angle	| Creates a distribution of branching angles for a given skeletonized microvascular region |
| 08_OverlayHistogramsBP.ipynb	| Image with distance values for branch and end points	| Summarizing histogram overlays	| To summarize |



