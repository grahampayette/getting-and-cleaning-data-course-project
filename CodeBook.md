<b><h1>CodeBook for Getting and Cleaning Data Course Project</h1></b>

<b>Source Data</b>

The raw data for this project is from a human activity study that used 
accelerometer data collected from Smartphones while participants completed six different activities.  

The data and explanation of the raw data can be found at the following links:

Data file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
CodeBook: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The zip contains several files that repeat for a set of test and train measurements. 
There are 10299 observations overall with 2947 for training data and 7352 for testing.
There are 30 test subjects
There are 6 different activities
There are 561 "features" or different measurements taken

The zip contains this source data as well as descriptive information about the activities and measurement data elements.


<b>Data load</b>

The run_analysis.r script is dependent on the files being downloaded and unzipped to a "c:\prog" directory.  The script will then load each 
space deliminted file in to a temporary data table.  

<b>Transformation</b>

The data is first merged. The activity and subject information pertaining to the test and train data sets are joined to the main datasets
and then the test and train data sets are merged.  

The activities are given descriptive lables using the activity_labels.txt file.

The data is filtered looking only for those columns containing measures for mean or stddev. 

The data is tidied, removing special characters and expanding abbreviations.  

The data is summarized and the mean taken by subject and activity

<b>Data Outputted</b>

The data is output to the tidy_data.txt file.

The tidy_data file contains 180 summarized measurements (6 for each of the 30 subjects) that contain the summarized mean for the
Time and Frequency domains in the X,Y and Z dimensions.  

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using
a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) 
using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals 
(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the 
Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, f
BodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
(Note the 'f' to indicate frequency domain signals). 

- tBodyAcceleration
- tGravityAccelerometer
- tBodyAccelerometerJerk
- tBodyGyroscope
- tBodyGyroscopeJerk
- tBodyAccelerometerMagnitude
- tGravityAccelerometerMagnitude
- tBodyAccelerometerJerkMagnitude
- tBodyGyroscopeMagnitude
- tBodyGyroscopeJerkMagnitude
- fBodyAccelerometer
- fBodyAccelerometerJerk
- fBodyGyroscope
- fBodyAccelerometerMagnitude
- fBodyAccelerometerJerkMagnitude
- fBodyGyroscopeMagnitude
- fBodyGyroscopeJerkMagnitude

