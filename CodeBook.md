This file provides details on the Variable used

The input data is gathered from
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Followng is done on the data to tidy the data

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement.
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names.
      Labels are changed as follows
      Suject id are named as Subject
      Activitties are named as Activity
      Data correction is done where columen name had "datadata"
      Column  names are renamed , wtih full names to include timeDoman and frequencyDomain
      abriviations are replaced with full names for freq, Acc, Gyro, Mac, mean, std, 
    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Variable used in the Code
fileUrl - URL from which Human Activity Recognition data is collected
destfile - A tempoarary file in local director to which the data is downloaded


xTrain - Training data set.
yTrain - Training labels.
subjectTrain - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


xTest - Test data st
yTest - Test labels
subjectTest - test data set of the subject who performed the activity

# Reading feature vector:
features - List of all features

# Reading activity labels:
activityLabels -  Links the class labels with their activity name.
Activity identifier, string with 6 possible values:
      WALKING: subject was walking
      WALKING_UPSTAIRS: subject was walking upstairs
      WALKING_DOWNSTAIRS: subject was walking downstairs
      SITTING: subject was sitting
      STANDING: subject was standing
      LAYING: subject was laying


#x data set - 
xDataSet <- combined training and test data sets

# y data set - 
yDataSet - bind training and test data labels

# 'subject' data set
subjectDataSet - combined data of subjectTrain and subjectTest 


meanStd - columns with mean or standard deviation

# activity names
yDataSet - activity Names


#combining all data sets
finalData - All data including xDataSet, yDataSet and subjectDataSet

activityCols - Columnn names

secondTidySet- a second, independent tidy data set with the average 
#of each variable for each activity and each subject

Input Files
features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Output file
"secondTidySet.txt" - Final tidy data


Variable in Output Files
Subject - Subject id - values range from 1 to 30
Activity - 6 Actitivies - Laying, Sitting, Standing, Walking, Walking_Downstairs and Walking_Upstairs
Two types of measurements - Time domain and Frequency Domain
Mean and Standard deviation of timeDomainBody accelerometer measurements in x, y and Z directions
  timeDomainBodyAccelerometerMeanX
  timeDomainBodyAccelerometerMeanY
  timeDomainBodyAccelerometerMeanZ
  timeDomainBodyAccelerometerStandardDeviationX
  timeDomainBodyAccelerometerStandardDeviationY
  timeDomainBodyAccelerometerStandardDeviationZ
  
  Like above, mean and std calculations for gravity acceleraton and acceleration jerk are measured
  
  As above, Gyroscope measurements (mean and standard deviation) are provided for x, y and z directions. 
    timeDomainBodyGyroscopeMeanX
    timeDomainBodyGyroscopeMeanY
    timeDomainBodyGyroscopeMeanZ
    timeDomainBodyGyroscopeStandardDeviationX
    timeDomainBodyGyroscopeStandardDeviationY
    timeDomainBodyGyroscopeStandardDeviationZ
    
    Similarly, next six variable represent the  mean and std of angular jerk in x, y and z directions
    
    Next 10 variables represent
    Average and standard deviation of the time-domain magnitude of body acceleration:

timeDomainBodyAccelerometerMagnitudeMean
timeDomainBodyAccelerometerMagnitudeStandardDeviation
Average and standard deviation of the time-domain magnitude of gravity acceleration:

timeDomainGravityAccelerometerMagnitudeMean
timeDomainGravityAccelerometerMagnitudeStandardDeviation
Average and standard deviation of the time-domain magnitude of body acceleration jerk (derivation of the acceleration in time):

timeDomainBodyAccelerometerJerkMagnitudeMean
timeDomainBodyAccelerometerJerkMagnitudeStandardDeviation
Average and standard deviation of the time-domain magnitude of body angular velocity:

timeDomainBodyGyroscopeMagnitudeMean
timeDomainBodyGyroscopeMagnitudeStandardDeviation
Average and standard deviation of the time-domain magnitude of body angular velocity jerk (derivation of the angular velocity in time):

timeDomainBodyGyroscopeJerkMagnitudeMean
timeDomainBodyGyroscopeJerkMagnitudeStandardDeviation

Rest of the variables are similar to above representing Frequency Domain


