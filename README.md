# Quantify Intensity from Timelapse

Step-by-step instruction to quantify fluorescence intensities from timelapse imaging experiments using open source software (ImageJ and PlotTwist)


## Preparations

#### Install the ImageJ macro file "Subtract_Measured_Background.ijm"

* Download the ImageJ macro file "Subtract_Measured_Background.ijm" (available in this repository)
* Install it as a plugin: _Plugins > Install Plugin..._
* The Plugin is installed in the drop-down menu Plugins as _Subtract Measured Background_.

#### Set Measurements

* Set the measurements to only measure mean gray values: _Analyze > Set Measurements..._ select _Mean gray value_

#### Set the correct options for export
* Set the options for input/ouput: _Edit > Options > Input/Output..._
* Set the "File extension for tables" to .csv
* In the "Results Table Options" make sure that "Save column headers" and "Save row numbers" are selected

## Analysis

#### Open the image sequence
* If the images are individually saved (as in the example data) use: _File > Import > Image Sequence..._
* If the images are saved as a single file, use the appropriate file import option

#### Define and subtract background
* Use an ROI to define an area with background fluorescence in the image
* Use _Subtract Measured Background_ to remove the average value of the ROI from the image (this action will be performed on each image in the stack)

#### Select and analyze cells

* Set the measurements to only measure mean gray values: _Analyze > Set Measurements..._ select _Mean gray value_
* Activate the ROI manager: _Analyze > Tools > ROI Manager..._
* Draw an ROI in the image sequence to select a cell (try to exclude background), add to ROI manager ("Add [t]")
* Repeat the selection of cells with ROIs until all cells are marked
* Save the set of ROIs (_More... > Save..._)
* Select all ROIs in the ROI manager
* Measure in all ROIs the mean gray value: _More > Multi Measure_ (select "Measure all slices"" and "One row per slice")
* Save the table with results (csv format).

#### Plot the result

* Open the csv file with results from the quantification in [PlotTwist](https://huygens.science.uva.nl/PlotTwist/) by using the "Upload" option
* PlotTwist has the option to apply normalization of the data
* PlotTwist has the option to exclude data from user selected cells

## Sample data and expected results
* Raw sample data is available in this [folder](https://github.com/JoachimGoedhart/Quantify-Intensity-from-Timelapse/tree/master/Example-data_raw)
* Background corrected data together with the ROIs and the results of the measurement is available in this [folder](https://github.com/JoachimGoedhart/Quantify-Intensity-from-Timelapse/tree/master/Example-data_processed)
* The graph of the example data generated with PlotTwist looks like this:


![alt text](https://github.com/JoachimGoedhart/Quantify-Intensity-from-Timelapse/blob/master/Example-data_processed/PlotTwist-results.png "Output")


#### (FRET) ratio analysis

In case of (FRET) emission ratio imaging, two intensity traces are acquired. The traces are acquired at different emission wavelengths (In case of FRET ratio imaging, one is acquired at the emission wavelength of the donor and another acquired at the acceptor wavelength).
Both intensity traces need to be background corrected (according to the procedure describe above under **Define and subtract background**). Next, a new stack with the ratio data can be obtained in ImageJ:
* When both image stacks are open, choose _Process > Image Calculator..._
* Select the stacks with emission data, for instance "Image1:" stack acquired at the first wavelength, "Image2:" stack acquired at the second wavelength
* Choose the operation "Divide"
* Make sure that the checkboxes "Create new window" and "32-bit (float) result" are activated.
* The result will be a new stack that has the ratiometric data.
* The ratio changes in this stack can be quantified as described above under **Select and analyze cells**



