# Getting and Cleaning Data - Code Book
This file contains a summary and description of the variables as well as the applied data set transformations to obtain the tidy data set `tidy.txt`. 

## Variables
The variables can be grouped in identifiers and averages of measurements. Note that all variables are normalized and bounded within [-1,1] and are therefore dimensionless. 

### Identifiers
-`subject`: ID of the subject. Integer variable ranging from 1 to 30.
-`activity`: ID of the activity. String variable with the 6 (self-explaining) possible values  `WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, and `LAYING`.

Each row contains averaged signal measurements for each subject and activity.

### Averages
Acceleration measurements are indicated by variables containing `Acceleration` and gyroscope measurements are indicated by variables containing `Gyroscope`. 
There are 2 different types of accelerations measured, i.e., `Body` and `Gravity` accelerations. The acceleration jerk and magnitude are indicated by `Jerk` and `Magnitude`, respectively. 

The measurements are classified in a time-domain, which are variables with the prefix `timedomain`, and in a frequency domain, which are variables with the prefix `frequencydomain`.

The mean values are indicated by variables containing `Mean` and the ones containing the standard deviation are indicated by variables containing `StandardDeviation`.

Each pattern `XYZ` is used to denote 3-axial signals in the `X`, `Y` and `Z` directions.


The variables are:

- `timedomainBodyAccelerationMeanX`
- `timedomainBodyAccelerationMeanY`
- `timedomainBodyAccelerationMeanZ`

- `timedomainBodyAccelerationStandardDeviationX`
- `timedomainBodyAccelerationStandardDeviationY`
- `timedomainBodyAccelerationStandardDeviationZ`

- `timedomainGravityAccelerationMeanX`
- `timedomainGravityAccelerationMeanY`
- `timedomainGravityAccelerationMeanZ`

- `timedomainGravityAccelerationStandardDeviationX`
- `timedomainGravityAccelerationStandardDeviationY`
- `timedomainGravityAccelerationStandardDeviationZ`

- `timedomainBodyAccelerationJerkMeanX`
- `timedomainBodyAccelerationJerkMeanY`
- `timedomainBodyAccelerationJerkMeanZ`

- `timedomainBodyAccelerationJerkStandardDeviationX`
- `timedomainBodyAccelerationJerkStandardDeviationY`
- `timedomainBodyAccelerationJerkStandardDeviationZ`

- `timedomainBodyGyroscopeMeanX`
- `timedomainBodyGyroscopeMeanY`
- `timedomainBodyGyroscopeMeanZ`

- `timedomainBodyGyroscopeStandardDeviationX`
- `timedomainBodyGyroscopeStandardDeviationY`
- `timedomainBodyGyroscopeStandardDeviationZ`

- `timedomainBodyGyroscopeJerkMeanX`
- `timedomainBodyGyroscopeJerkMeanY`
- `timedomainBodyGyroscopeJerkMeanZ`

- `timedomainBodyGyroscopeJerkStandardDeviationX`
- `timedomainBodyGyroscopeJerkStandardDeviationY`
- `timedomainBodyGyroscopeJerkStandardDeviationZ`

- `timedomainBodyAccelerationMagnitudeMean`
- `timedomainBodyAccelerationMagnitudeStandardDeviation`

- `timedomainGravityAccelerationMagnitudeMean`
- `timedomainGravityAccelerationMagnitudeStandardDeviation`

- `timedomainBodyAccelerationJerkMagnitudeMean`
- `timedomainBodyAccelerationJerkMagnitudeStandardDeviation`

- `timedomainBodyAccelerationJerkMagnitudeMean`
- `timedomainBodyAccelerationJerkMagnitudeStandardDeviation`

- `timedomainBodyGyroscopeMagnitudeMean`
- `timedomainBodyGyroscopeMagnitudeStandardDeviation`

- `timedomainBodyGyroscopeJerkMagnitudeMean`
- `timedomainBodyGyroscopeJerkMagnitudeStandardDeviation`

- `frequencydomainBodyAccelerationMeanX`
- `frequencydomainBodyAccelerationMeanY`
- `frequencydomainBodyAccelerationMeanZ`

- `frequencydomainBodyAccelerationStandardDeviationX`
- `frequencydomainBodyAccelerationStandardDeviationY`
- `frequencydomainBodyAccelerationStandardDeviationZ`

- `frequencydomainGravityAccelerationMeanX`
- `frequencydomainGravityAccelerationMeanY`
- `frequencydomainGravityAccelerationMeanZ`

- `frequencydomainGravityAccelerationStandardDeviationX`
- `frequencydomainGravityAccelerationStandardDeviationY`
- `frequencydomainGravityAccelerationStandardDeviationZ`

- `frequencydomainBodyAccelerationJerkMeanX`
- `frequencydomainBodyAccelerationJerkMeanY`
- `frequencydomainBodyAccelerationJerkMeanZ`

- `frequencydomainBodyAccelerationJerkStandardDeviationX`
- `frequencydomainBodyAccelerationJerkStandardDeviationY`
- `frequencydomainBodyAccelerationJerkStandardDeviationZ`

- `frequencydomainBodyGyroscopeMeanX`
- `frequencydomainBodyGyroscopeMeanY`
- `frequencydomainBodyGyroscopeMeanZ`

- `frequencydomainBodyGyroscopeStandardDeviationX`
- `frequencydomainBodyGyroscopeStandardDeviationY`
- `frequencydomainBodyGyroscopeStandardDeviationZ`

- `frequencydomainBodyGyroscopeJerkMeanX`
- `frequencydomainBodyGyroscopeJerkMeanY`
- `frequencydomainBodyGyroscopeJerkMeanZ`

- `frequencydomainBodyGyroscopeJerkStandardDeviationX`
- `frequencydomainBodyGyroscopeJerkStandardDeviationY`
- `frequencydomainBodyGyroscopeJerkStandardDeviationZ`

- `frequencydomainBodyAccelerationMagnitudeMean`
- `frequencydomainBodyAccelerationMagnitudeStandardDeviation`

- `frequencydomainGravityAccelerationMagnitudeMean`
- `frequencydomainGravityAccelerationMagnitudeStandardDeviation`

- `frequencydomainBodyAccelerationJerkMagnitudeMean`
- `frequencydomainBodyAccelerationJerkMagnitudeStandardDeviation`

- `frequencydomainBodyAccelerationJerkMagnitudeMean`
- `frequencydomainBodyAccelerationJerkMagnitudeStandardDeviation`

- `frequencydomainBodyGyroscopeMagnitudeMean`
- `frequencydomainBodyGyroscopeMagnitudeStandardDeviation`

- `frequencydomainBodyGyroscopeJerkMagnitudeMean`
- `frequencydomainBodyGyroscopeJerkMagnitudeStandardDeviation`

## Transformations
The raw data is located in a [zip-file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The following set of transformations have been applied (performed by the R-script `run_analysis.R`) to these data to obtain the tidy data set `tidy.txt`:

1. Merge the test and training sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. The raw data variables are indicated by `mean` and `std`.
3. Rename the the activities in the data set to descriptive names, see Identifiers above. 
4. Label the data set with descriptive variable names by the following rules:
- Expand the prefix `t` to `timedomain` and `f` to `frequencydomain`.
- Remove the character string `()-`.
- Expand `Acc` to `Acceleration`, `Gyro` to `Gyroscope`, `Mag` to `Magnitude`, `Freq` to `Frequency`, `mean` to `Mean`, `std` to `StandardDeviation`, and the typo `BodyBody` to `Body`.
5. Create a tidy data set with the average of each variable for each activity and each subject.

## Study design
How the study has been performed can be found at [UCI - Data Set Information](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).


