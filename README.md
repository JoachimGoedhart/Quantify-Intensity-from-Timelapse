# Quantify Intensity from Timelapse

Step-by-step instruction to quantify fluorescence intensities from timelapse imaging experiments using open source software (ImageJ and PlotTwist)


## Preparations

#### Install the ImageJ macro file "Subtract_Measured_Background.ijm"

* Download the ImageJ macro file "Subtract_Measured_Background.ijm" (available in this repository)
* Install it as a plugin: _Plugins > Install Plugin..._
* The Plugin is installed in the drop-down menu Plugins as _Subtract Measured Background_.

#### Set Measurements

* Set the measurements to only measure mean gray values: _Analyze > Set Measurements..._ select _Mean gray value_

#### Set the right options for export
* Set the options for input/ouput: _Edit > Options > Input/Output..._
* Set the "File extension for tables" to .csv
* In the "Results Table Options" make sure that "Save column headers" and "Save row numbers" are selected

## Analysis

#### Open the image sequence
* If the images are individually saved (as in the example data) use: _File > Import > Image Sequence..._
* If the images are saved as a single file, use the right file import option

### Define and subtract background
* Use an ROI to define an area with background fluorescence in the image
* Use _Subtract Measured Background_ to remove the average value of the ROI from the image (this action will be performed on each image in the stack)

### Select and analyze cells

* Set the measurements to only measure mean gray values: _Analyze > Set Measurements..._ select _Mean gray value_
* Activate the ROI manager: _Analyze > Tools > ROI Manager..._
* Draw an ROI in the image sequence to select a cell, add to ROI manager ("Add [t]")
* Repeat the selection of cells with ROIs until all cells are marked
* Save the set of ROIs (_More... > Save..._)
* Select all ROIs in the ROI manager
* Measure in all ROIs the mean gray value: _More > Multi Measure_ (select "Measure all slices"" and "One row per slice")
* Save the table with results (csv format).

### Plot the result

* Open the csv file with results from the quantification in [PlotTwist](https://huygens.science.uva.nl/PlotTwist/) by using the "Upload" option
* PlotTwist has the option to apply normalization of the data
* PlotTwist has the option to exclude data from user selected cells

### Sample data and expected results
* Raw sample data is available in this repository
* Background corrected data is available together with the ROIs and the results of the measurements
* The graph of the example data generated with PlotTwist may look like this:


![alt text](https://github.com/JoachimGoedhart/Quantify-Intensity-from-Timelapse/blob/master/Example-data_processed/PlotTwist-results.png "Output")








