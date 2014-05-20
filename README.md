# README for Getting and Cleaning Data Course Project
========================================================


## The Data

The source of the data is located at this url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  The data represents accelerometer data tracked across six different activities and 100 subjects.  The subjects were divided into a training group and a test group, and the resulting data is split between the two groups.

The file downloads as a .zip file.  Once unzipped it creates a new sub directory called UCI HAR Dataset, which in turn has two sub directories called TEST and TRAIN.  All files are gap delimited text files.  The primary measurement data is contained in two files contained in these sub directories: X_test.txt and X_train.txt.  Combined these two files provide 10,299 observations of 561 measured variables.  The observations are in rows and the variables are in columns.

The specific activity number for each observation is contained in two additional files, also split between the two sub directories: y_train.txt and y_test.txt.  

The subject numbers for the observations are similarly split between files subject_train.txt and subject_test.txt.

The variable names (columns labels) are in a file called features.txt in the main UCI HAR Dataset directory.

Lastly, the English descriptions of each activity are in a file called activity_labels.txt in the main UCI HAR Dataset directory.


## The Process

* The script is contained in an R file called run_analysis.R.  There are no additional scripts.  This script will download the file, unzip it to a new directory, clean and merge the data (combining test and training data), and create the two output files as follows.

* The first file created is a clean (tidy) data set of all of the mean and standard deviation observations for all subjects.  This data set is clearly labeled with English descriptions of the activity.  It is written to a file called meanSTD.txt in the UCI HAR DATASET directory.  The variables selected for this file were chosen based on the variable label.  All variables with a label that contained either "mean" or "std" were included in the ridy dataset.

* The second file is the mean of ALL variables in the full data set for each combination of subject and activity.

                                   
## Specific Processing Sequence - See CodeBook.md for variable details

1. The two data sets were merged in order to maximize the observations available.  Merger required merging the subject and activity numbers as well as the primary data.

2. Subject and activity numbers were added to the data set as columns on the left.

3. Column labels were added from the features.txt file.

4. Activity descriptions were added using the activity number as a cross reference.

5. To create the first file, all variables that contained either the phrase "mean" or "std" 
        were extracted to a subset, maintaining all of the descriptive information.  
        It is written to a file called meanSTD.txt in the UCI HAR DATASET directory.
        
6. To create the second file, the mean of ALL variables is calculated using a combination of
        the functions "split" and "sapply" across the split table.  It is saved as a file named 
        meansBySubjectActivity.txt in the UCI HAR DATASET directory.

