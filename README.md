## Getting and Cleaning Data - Class Project

This depot contains the required files for the Getting and Cleaning Data class project:

- readme.md - this descriptive file explaining the depot contents
- codebook.md - a codebook explaining the data and how it was manipulated
- run_analysis.r - the script that did the data tidying and outputs the final product
- tidy_data.txt - the final output of the script

 Program is intended to get data from here:
 
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

 And then do the following 5 things:
 
 - Merges the training and the test sets to create one data set.
 - Extracts only the measurements on the mean and standard deviation for each measurement.
 - Uses descriptive activity names to name the activities in the data set
 - Appropriately labels the data set with descriptive variable names.
 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


To run the script you need to first download the data set and unzip the data files in to a directory "c:\prog".  The script looks in the "c:\prog" directory for the test and train data files as well as the feature, activity, subject information.  

The script then proceeds to perform the five required actions including merging, filtering, tidying, summarizing and outputting the tidy data set from the source information.  

The script is dependent on the dplyr package so you must have this installed if you wish to download the run_analysis.r file and test it out.
