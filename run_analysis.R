# Load the library plyr
library(plyr)

#Download and unzip the data files
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile <- tempfile()
download.file(fileUrl, destfile)

unzip(zipfile=destfile, exdir="./data")

#Read the data and Merges the training and the test sets to create one data set.

# Reading trainings tables:
xTrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Reading testing tables:
xTest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Reading feature vector:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# Reading activity labels:
activityLabels <- read.table('./data/UCI HAR Dataset/activity_labels.txt')

#View(xTrain)
#View(yTrain)

#x data set - bind training and test data sets
xDataSet <- rbind(xTrain, xTest)

# y data set - bind training and test data sets
yDataSet <- rbind(yTrain, yTest)

# 'subject' data set
subjectDataSet <- rbind(subjectTrain, subjectTest)


# Extract only the measurements on the mean and standard deviation for each measurement


# Find columns with mean or standard deviation
meanStd <- grep("-(mean|std)\\(\\)", features[, 2])

# Get the needed Data
xDataSet <- xDataSet[, meanStd]
names(xDataSet) <- features[meanStd, 2]
#print(names(xDataSet))

# activity names
yDataSet[, 1] <- activityLabels[yDataSet[, 1], 2]

# Appropriately label the data set with descriptive variable names

names(yDataSet) <- "Activity"
names(subjectDataSet) <- "Subject"




#combining all data sets
finalData <- cbind(xDataSet, yDataSet, subjectDataSet)

#View(finalData)

# get column names
activityCols <- colnames(finalData)

# remove special character
activityCols <- gsub("[\\(\\)-]", "", activityCols)

# expand abbreviations and clean up names
activityCols <- gsub("^f", "frequencyDomain", activityCols)
activityCols <- gsub("^t", "timeDomain", activityCols)
activityCols <- gsub("Acc", "Accelerometer", activityCols)
activityCols <- gsub("Gyro", "Gyroscope", activityCols)
activityCols <- gsub("Mag", "Magnitude", activityCols)
activityCols <- gsub("Freq", "Frequency", activityCols)
activityCols <- gsub("mean", "Mean", activityCols)
activityCols <- gsub("std", "StandardDeviation", activityCols)
activityCols <- gsub("BodyBody", "Body", activityCols)

# use new labels as column names
colnames(finalData) <- activityCols

#From the data set in step 4, creates a second, independent tidy data set with the average 
#of each variable for each activity and each subject


secondTidySet <- ddply(finalData, .(Subject, Activity), function(x) colMeans(x[, 1:66]))

write.table(secondTidySet, "secondTidySet.txt", row.name=FALSE)

View(secondTidySet)