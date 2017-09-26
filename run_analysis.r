##############################################################################
#
# FILE
#   run_analysis.R
#
# OVERVIEW
# Project Assignment for Getting and Cleaning Data Course
# Program is intended to get data from here:
# 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
# And then do the following 5 things:
# 
# 1 - Merges the training and the test sets to create one data set.
# 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
# 3 - Uses descriptive activity names to name the activities in the data set
# 4 - Appropriately labels the data set with descriptive variable names.
# 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)

# Step 0 - get all of the data
##############################

# train, test, activity, feature data

d_train <- read.delim("c://prog/X_train.txt",header = FALSE, sep = "")
d_test <- read.delim("c://prog/X_test.txt",header = FALSE, sep = "")
d_act_labels <- read.delim("c://prog/activity_labels.txt", header = FALSE, sep = "")
d_feature <- read.delim("c://prog/features.txt", header = FALSE, sep = "")

# train and test subjects and activities

sub_train <- read.delim("c://prog/subject_train.txt", header = FALSE, sep = "")
act_train <- read.delim("c://prog/Y_train.txt", header = FALSE, sep = "")

sub_test <- read.delim("c://prog/subject_test.txt", header = FALSE, sep = "")
act_test <- read.delim("c://prog/Y_test.txt", header = FALSE, sep = "")



# Step 1 - merge everything together
#####################################

# merging activity, subject and measure data for both train and test

i_train <- cbind(act_train, sub_train, d_train)
i_test <- cbind(act_test, sub_test, d_test)

t_num <- c("1", "2")
t_title <- c("Activity", "Subject")
tmp <- data.frame(t_num, t_title)
names(d_feature) <- ""
names(tmp) <- ""

# adding activity and subject to the list of feature names
i_features <- rbind(tmp, d_feature)
names(i_features) <- c("ct","measure")

# mergine the test and train data sets
i_total <- rbind(i_test, i_train)

# giving them proper names
names(i_total) <- i_features$measure

# Step 2 - extracting only those columns for mean and StdDev measurements
#####################################################

fil_cols <- grep("Activity|Subject|mean|std", names(i_total))

# writing the filtered data to a table
fil_data <- i_total[fil_cols]


# Step 3 - Adding descriptive names and labels
##############################################

# Replace activity Id number with the label
fil_data$Activity <- factor(fil_data$Activity, levels = d_act_labels[, 1], labels = d_act_labels[, 2])


tidyNames <- colnames(fil_data)

# remove special characters
tidyNames <- gsub("[\\(\\)-]", "", tidyNames)

# expand abbreviations and clean up names
tidyNames <- gsub("^f", "FrequencyDomain", tidyNames)
tidyNames <- gsub("Mag", "Magnitude", tidyNames)
tidyNames <- gsub("Freq", "Frequency", tidyNames)
tidyNames <- gsub("mean", "Mean", tidyNames)
tidyNames <- gsub("std", "StandardDeviation", tidyNames)
tidyNames <- gsub("BodyBody", "Body", tidyNames)
tidyNames <- gsub("^t", "TimeDomain", tidyNames)
tidyNames <- gsub("Acc", "Accelerometer", tidyNames)
tidyNames <- gsub("Gyro", "Gyroscope", tidyNames)

# use new labels as column names
colnames(fil_data) <- tidyNames

# Step 4 - group by subjectID and activity and summarise using mean
###########################################
tidyMeans <- fil_data %>% 
  group_by(Subject, Activity) %>%
  summarise_each(funs(mean))

# Step 5 - output to file 
#########################################
write.table(tidyMeans, "c://prog/tidy_data.txt", row.names = FALSE, 
            quote = FALSE)
