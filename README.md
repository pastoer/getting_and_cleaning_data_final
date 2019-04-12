# Getting and Cleaning Data - Course Project

## Introduction

One of the most exciting areas in all of data science right now is wearable computing. The raw data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. The purpose of this project is to produce a tidy data set from these raw data.

This repository consist of four files:

- `README.md`: Explains how the tidy set data `tidy.txt` is created by the R-Script an_analysis.R`. 
- `CodeBook.md`: Describes each variable and its values in the tidy data set `tidy.txt.
- `run_analysis.R`: R-Script which produces the tidy data set "tidy.txt".
- `tidy.txt`: The tidy data set.

## Creating the tidy data set

The following R-Version and packages have been used: 

- R version 3.5.3 (2019-03-11)
- dplyr version 0.8.0.1

The tidy data set `tidy.txt` is produced by the R-Script `run_analysis.R`. This script downloads a raw data zip-file and produces the tidy data set by performing the following steps:

1. If it does not exist download and unzip the raw data.
2. Read the all the training and test data tables as well as the activity labels and features stored in individual files.
3. Merge the test and training sets to create one data set.
4. Extract only the measurements on the mean and standard deviation for each measurement. 
5. Rename the the activities in the data set to descriptive names.
6. Label the data set with descriptive variable names.
7. Create a tidy data set with the average of each variable for each activity and each subject.
8. Write the tidy data onto the output file `tidy.txt`.
