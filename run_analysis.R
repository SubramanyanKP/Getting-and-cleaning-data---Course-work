#Getting and Cleaning Data (Assignment) February 2019

my_analysis <- function(){
  
  # Each row of subject_test.txt/subject_train.txt identifies the subject who performed the activity for each window sample.
  # Its range is from 1 to 30.
  
  # load test data and read the contents to three varables from the test directory of UCI HAR Dataset  
  my_subject_testdata = read.table("UCI HAR Dataset/test/subject_test.txt")
  X_testdata = read.table("UCI HAR Dataset/test/X_test.txt")
  Y_testdata = read.table("UCI HAR Dataset/test/Y_test.txt")
  
  # load training data and read the contents to three varables from the test directory of UCI HAR Dataset
  my_subject_traindata = read.table("UCI HAR Dataset/train/subject_train.txt")
  X_traindata = read.table("UCI HAR Dataset/train/X_train.txt")
  Y_traindata = read.table("UCI HAR Dataset/train/Y_train.txt")
  
  # load lookup information from the features and activity_labels.txt
  my_features <- read.table("UCI HAR Dataset/features.txt", col.names=c("featureId", "featureLabel"))
  my_activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("activityId", "activityLabel"))
  my_activities$activityLabel <- gsub("_", "", as.character(my_activities$activityLabel))
  included_Features <- grep("-mean\\(\\)|-std\\(\\)", my_features$featureLabel)
  
  # merge test and training data and name them
  my_subject <- rbind(my_subject_testdata, my_subject_traindata)
  names(my_subject) <- "subjectId"
  X <- rbind(X_testdata, X_traindata)
  X <- X[, included_Features]
  names(X) <- gsub("\\(|\\)", "", my_features$featureLabel[included_Features])
  Y <- rbind(Y_testdata, Y_traindata)
  names(Y) = "activityId"
  my_activity <- merge(Y, my_activities, by="activityId")$activityLabel
  
  # merge data frames of different columns to form one data table
  my_data <- cbind(my_subject, X, my_activity)
  write.table(my_data, "mergedtidydata.txt")
  
  # create a dataset grouped by subject and activity after applying standard deviation and average calculations
  library(data.table)
  my_dataDT <- data.table(my_data)
  my_calculatedData <- my_dataDT[, lapply(.SD, mean), by=c("subjectId", "my_activity")]
  write.table(my_calculatedData, "calculatedtidydata.txt")
}