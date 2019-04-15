##--------------------------------------------------------------------------------------------##
## R-Script      : run_analysis.R
## Author        : PT
## Created       : 11/04/2019
## Last modified : 11/04/2019
## Description   : Creates a tidy data set "tidy.txt" from data collected from the
##                 accelerometers from the Samsung Galaxy S smartphone. See "README.md"
##                 for a detailed description.
##--------------------------------------------------------------------------------------------##

library(dplyr)

##--------------------------------------------------------------------------------------------##
##
## Part 0: Download and read the raw data
##
##--------------------------------------------------------------------------------------------##

## Download zip-file and unzip it if not already done
if(!file.exists("./Dataset.zip"))
{
  zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(zipUrl, destfile = "./Dataset.zip")
  unzip("./Dataset.zip")
}

## Read test data
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testSet     <- read.table("./UCI HAR Dataset/test/X_test.txt")
testLabels  <- read.table("./UCI HAR Dataset/test/y_test.txt")

## Read training data
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainSet     <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainLabels  <- read.table("./UCI HAR Dataset/train/y_train.txt")

## Read activity lables
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Read features
features <- read.table("./UCI HAR Dataset/features.txt", as.is = TRUE)

##--------------------------------------------------------------------------------------------##
##
## Part 1: Merge the training and the test sets to create one data set
##
##--------------------------------------------------------------------------------------------##

## Put the training data next to each other and remove the individual tables
trainComplete <- cbind(trainSubject, trainSet, trainLabels)
rm(trainSubject, trainSet, trainLabels)

## Put the test data next to each other and remove the individual tables
testComplete <- cbind(testSubject, testSet, testLabels)
rm(testSubject, testSet, testLabels)

## Put the training and test data below each other and remove individual tables
fullData <- rbind(trainComplete, testComplete)
rm(trainComplete, testComplete)

## Rename the column lables
colnames(fullData) <- c("subject", features[, 2], "activity")

##--------------------------------------------------------------------------------------------##
##
## Part 2: Extract only the measurements on the mean and standard deviation
##         for each measurement
##
##--------------------------------------------------------------------------------------------##

fullData <- fullData[, grepl("subject|mean|std|activity", colnames(fullData))]

##--------------------------------------------------------------------------------------------##
##
## Part 3: Uses descriptive activity names to name the activities in the data set
##
##--------------------------------------------------------------------------------------------##

## Acitivity names are stored in acitivtyLabels (see Part 0)
fullData$activity <- factor(fullData$activity, activityLabels[, 1], activityLabels[, 2])

##--------------------------------------------------------------------------------------------##
##
## Part 4: Appropriately label the data set with descriptive variable names
##
##--------------------------------------------------------------------------------------------##

columnNames <- colnames(fullData)
columnNames <- gsub("[\\(\\)-]", "", columnNames) # remove "()-"
columnNames <- gsub("^t", "timedomain", columnNames)
columnNames <- gsub("^f", "frequencydomain", columnNames)
columnNames <- gsub("Acc", "Acceleration", columnNames)
columnNames <- gsub("Gyro", "Gyroscope", columnNames)
columnNames <- gsub("Mag", "Magnitude", columnNames)
columnNames <- gsub("Freq", "Frequency", columnNames)
columnNames <- gsub("mean", "Mean", columnNames)
columnNames <- gsub("std", "StandardDeviation", columnNames)
columnNames <- gsub("BodyBody", "Body", columnNames)

colnames(fullData) <- columnNames

##--------------------------------------------------------------------------------------------##
##
## Part 5: Create a second, independent tidy set with the average of each
##         variable for each activity and each subject
##
##--------------------------------------------------------------------------------------------##

## First group data by "subject" and acitivity"
subjectactivity <- group_by(fullData, subject, activity)
## summarize_each to summarize multiple columns into the mean value
meanValues <-  summarize_each(subjectactivity,funs(mean))

# Output to file "tidy.txt"
write.table(meanValues, "./tidy.txt", row.names = FALSE, quote = FALSE)
