setwd("./Desktop/R-Coursera/Dataset")

#Creates a data frame that contains all the activity names with activity id.
activity<- read.table("activity_labels.txt", header = FALSE, col.names = c("activityId", "activity"))

#Creates a data frame that contains all the subjects on which the testing is done. Its range is 1-30.
testSubject<- read.table("subject_test.txt", header = FALSE, col.names = "testSubjectId")
#Creates a data frame that contains all the subjects on which the training is done. Its range is 1-30.
trainSubject<- read.table("subject_train.txt", header = FALSE, col.names = "trainSubjectId")

#Creates a data frame that contains all the features and its id.
features<- read.table("features.txt", header = FALSE, col.names = c("featureId", "feature"))

#Creates a data frame that contains all the test activity id. 
testActivity<-read.table("y_test.txt", header = FALSE, col.names = "testActivityId")
#Creates a data frame that contains all the train activity id. 
trainActivity<- read.table("y_train.txt", header = FALSE, col.names = "trainActivityId")

#Creates a data frame that contains all the test set values for all the features.
testSet<-read.table("x_test.txt", header = FALSE, col.names = features[,2])
#Creates a data frame that contains all the train set values for all the features.
trainSet<-read.table("x_train.txt", header = FALSE, col.names = features[,2])

#Modifies the testSet data frame to display test values for mean and std only.
testSet<-testSet[,grep("mean|std", features$feature)]
#Modifies the trainSet data frame to display train values for mean and std only.
trainSet<-trainSet[, grep("mean|std", features$feature)]


#Combine all the data frames to creat a test data set.
test<- cbind(testSubject, testActivity, testSet)
#Combine all the data frames to create a train data set.
train<- cbind(trainSubject, trainActivity, trainSet)



bodyAccXTest<-read.table("body_acc_x_test.txt", col.names = BATTx)
bodyAccYTest<-read.table("body_acc_y_test.txt", col.names = BATTy)
bodyAccZTest<-read.table("body_acc_z_test.txt", col.names = BATTz)
bodyGyroXTest<- read.table("body_gyro_x_test.txt", col.names = BGTTx)
bodyGyroYTest<- read.table("body_gyro_y_test.txt", col.names = BGTTy)
bodyGyroZTest<- read.table("body_gyro_z_test.txt", col.names = BGTTz)
totalAccXTest<-read.table("total_acc_x_test.txt", col.names = TATTx)
totalAccYTest<-read.table("total_acc_y_test.txt", col.names = TATTy)
totalAccZTest<-read.table("total_acc_z_test.txt", col.names = TATTz)
bodyAccXTrain<-read.table("body_acc_x_train.txt", col.names = BATx)
bodyAccYTrain<-read.table("body_acc_y_train.txt", col.names = BATy)
bodyAccZTrain<-read.table("body_acc_z_train.txt", col.names = BATz)
bodyGyroXTrain<-read.table("body_gyro_x_train.txt", col.names = BGTx)
bodyGyroYTrain<-read.table("body_gyro_y_train.txt", col.names = BGTy)
bodyGyroZTrain<-read.table("body_gyro_z_train.txt", col.names = BGTz)
totalAccXTrain<-read.table("total_acc_x_train.txt", col.names = TATx)
totalAccYTrain<-read.table("total_acc_y_train.txt", col.names = TATy)
totalAccZTrain<-read.table("total_acc_z_train.txt", col.names = TATz)

 train<- cbind(trainSubject, trainActivity, trainSet, bodyAccXTrain, bodyAccYTrain, bodyAccZTrain, bodyGyroXTrain,bodyGyroYTrain, bodyGyroZTrain, totalAccXTrain, totalAccYTrain, totalAccZTrain)
 test<- cbind(testSubject, testActivity, testSet, bodyAccXTest, bodyAccYTest, bodyAccZTest, bodyGyroXTest, bodyGyroYTest, bodyGyroZTest, totalAccXTest, totalAccYTest, totalAccZTest)

 BATTx -- bodyAccXTest
 BATTy -- bodyAccYTest
 BATTz -- bodyAccYTest
 BGTTx -- bodyGyroXTest
 BGTTy -- bodyGyroYTest
 BGTTz -- bodyGyroZTest
 TATTx -- totalAccXTest
 TATTy -- totalAccYTest
 TATTz -- totalAccZTest
 
n<-as.character(1:128)
BATTx<-"BATTx"
BATTy<-"BATTy"
BATTz<-"BATTz"
BATTx<-paste0(BATTx, n)
BATTy<-paste0(BATTy, n)
BATTz<-paste0(BATTz, n)

BGTTx<-"BGTTx"
BGTTy<-"BGTTy"
BGTTz<-"BGTTz"
BGTTx<-paste0(BGTTx, n)
BGTTy<-paste0(BGTTy, n)
BGTTz<-paste0(BGTTz, n)

TATTx<-"TATTx"
TATTy<-"TATTy"
TATTz<-"TATTz"
TATTx<-paste0(TATTx, n)
TATTy<-paste0(TATTy, n)
TATTz<-paste0(TATTz, n)

BATx -- bodyAccXTest
BATy -- bodyAccYTest
BATz -- bodyAccYTest
BGTx -- bodyGyroXTest
BGTy -- bodyGyroYTest
BGTz -- bodyGyroZTest
TATx -- totalAccXTest
TATy -- totalAccYTest
TATz -- totalAccZTest

BATx<-"BATx"
BATy<-"BATy"
BATz<-"BATz"
BATx<-paste0(BATx, n)
BATy<-paste0(BATy, n)
BATz<-paste0(BATz, n)

BGTx<-"BGTx"
BGTy<-"BGTy"
BGTz<-"BGTz"
BGTx<-paste0(BGTx, n)
BGTy<-paste0(BGTy, n)
BGTz<-paste0(BGTz, n)

TATx<-"TATx"
TATy<-"TATy"
TATz<-"TATz"
TATx<-paste0(TATx, n)
TATy<-paste0(TATy, n) 
TATz<-paste0(TATz, n)



 