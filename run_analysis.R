#download the file  and unzip it's content
zipUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile<-"dataSet.zip"
if(!file.exists(zipFile)){ 
  download.file(zipUrl, zipFile, method = "curl")
}
unzip(zipFile)

##############################################################################################################
#Read Activity.
activity<- read.table("activity_labels.txt", header = FALSE, col.names = c("activityId", "activity"))

#Read Features.
features<- read.table("features.txt", header = FALSE, col.names = c("featureId", "feature"))

#Read Test Data.
testSubject<- read.table("subject_test.txt", header = FALSE, col.names = "subjectId")
testActivity<-read.table("y_test.txt", header = FALSE, col.names = "activityId")
testSet<-read.table("x_test.txt", header = FALSE, col.names = features[,2])
#Combine Test Data.
test<- cbind(testSubject, testActivity, testSet)

#Read Train Data.
trainSubject<- read.table("subject_train.txt", header = FALSE, col.names = "subjectId")
trainActivity<- read.table("y_train.txt", header = FALSE, col.names = "activityId")
trainSet<-read.table("x_train.txt", header = FALSE, col.names = features[,2])
#Combine Train Data.
train<- cbind(trainSubject, trainActivity, trainSet)

#####################################################################################################################################################
# 1. Merges the training and the test sets to create one data set.

#Merge Test and Train Datasets.
dataSet<-rbind(test,train)

#####################################################################################################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

dataSet<- dataSet[,grep("subject|activity|mean|std", colnames(dataSet))]

#####################################################################################################################################################
# 3. Uses descriptive activity names to name the activities in the data set

dataSet$activityId<- factor(dataSet$activityId, levels = activity[,1], labels = activity[,2])

#####################################################################################################################################################
# 4. Appropriately labels the data set with descriptive variable names.

dataColNames<- colnames(dataSet)
dataColNames<- gsub("^t", "timeDomain", dataColNames)
dataColNames<- gsub("^f", "frequencyDomain", dataColNames)
dataColNames<- gsub("Acc", "Accelerometer", dataColNames)
dataColNames<- gsub("Gyro", "Gyroscope", dataColNames)
dataColNames<- gsub("mean", "Mean", dataColNames)
dataColNames<- gsub("std", "StandardDeviation", dataColNames)
dataColNames<- gsub("Mag", "Magnitude", dataColNames)
dataColNames<- gsub("\\.", "", dataColNames)
dataColNames<- gsub("Freq", "Frequency", dataColNames)
dataColNames<- gsub("BodyBody", "Body", dataColNames)
dataColNames<- gsub("activityId", "activity", dataColNames)

colnames(dataSet)<- dataColNames

#####################################################################################################################################################
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

dataMeans<- dataSet %>% group_by(subjectId, activity) %>% summarise_each(funs = mean)

#####################################################################################################################################################

#Generating the text file for submission.
if(!file.exists("tidyData.txt")){
  file.create("tidyData.txt")
  write.table(dataMeans, file = "tidyData.txt", row.names = FALSE)
}

 