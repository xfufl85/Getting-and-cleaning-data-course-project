#download zip file
install.packages("downloader")
library("downloader")
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download(url, dest="dataset.zip", mode="wb")
unzip ("dataset.zip")
date()

## prepare training dataset
#read training set, training subject,and training activity data;
#add descriptive variable names
training_set<-read.table("./train/X_train.txt",header=FALSE)
dim(training_set)
features<-read.table("features.txt",header=FALSE)
colnames(training_set)<-features$V2

training_subject<-read.table("./train/subject_train.txt",header=FALSE)
colnames(training_subject)<-"subject"

training_activity<-read.table("./train/y_train.txt",header=FALSE)
colnames(training_activity)<-"activity"

#merge training set with the corresponding subject and activity
training_set<-cbind(training_subject, training_activity, training_set)

## prepare test dataset
#read test set, test subject,and test activity data
#add descriptive variable names
test_set<-read.table("./test/X_test.txt",header=FALSE)
dim(test_set)

test_subject<-read.table("./test/subject_test.txt",header=FALSE)
colnames(test_subject)<-"subject"
features<-read.table("features.txt",header=FALSE)
colnames(test_set)<-features$V2

test_activity<-read.table("./test/y_test.txt",header=FALSE)
colnames(test_activity)<-"activity"

#merge training set with the corresponding subject and activity
test_set<-cbind(test_subject, test_activity, test_set)

## merge the training and the test sets to create one data set
data<-rbind(training_set,test_set)

## Extract the measurements on the mean and standard deviation for each measurement
mean_std <- grep(".*mean.*|.*std.*", features[,2])
mean_std.names <- features[mean_std,2]
mean_std.names<-as.character(mean_std.names)
data_2<-data[,c("subject","activity",mean_std.names)]
dim(data_2)

## Use descriptive activity names to name the activities in the data set
activity_labels<-read.table("activity_labels.txt",header=FALSE)
colnames(activity_labels)<-c("activity","activity_description")
data_3<-merge(activity_labels,data_2,all=TRUE)

## Appropriately labels the data set with descriptive variable names
names<-colnames(data_3)
names_1 = gsub('[-()]', '', names)
names_1 = gsub('^(t)','time',names_1)
names_1 = gsub('^(f)','frequency',names_1)
names_1 = gsub('mean','Mean',names_1)
names_1 = gsub('std','STD',names_1)
colnames(data_3)<-names_1

## Create a second, independent tidy data set with the average of each variable for 
## each activity and each subject
library(reshape2)
activity_labels[,2]<-as.character(activity_labels[,2])
data_3$activity<-factor(data_3$activity, levels = activity_labels[,1], labels = activity_labels[,2])
data_3$subject<-as.factor(data_3$subject)
data_4<-data_3[,-2]
data_5<-melt(data_4, id=c("subject","activity"))
data_6<-dcast(data_5,subject + activity ~ variable,mean)
write.csv(data_6,"average_of_each_variable_for_each_activity_and_subject.csv")