##Getting and Cleaning Data- Final project Script

library(reshape2)
library(plyr)

##Download and unzip the data

zip_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
zip_name<-"getdata_projectfiles.zip"

download.file(zip_url,destfile=zip_name)
unzip(zip_name)

##Name key files

train_file<-"./UCI HAR Dataset/train/X_train.txt"
train_labels_file<-"./UCI HAR Dataset/train/y_train.txt"
train_subj_file<-"./UCI HAR Dataset/train/subject_train.txt"

test_file<-"./UCI HAR Dataset/test/X_test.txt"
test_labels_file<-"./UCI HAR Dataset/test/y_test.txt"
test_subj_file<-"./UCI HAR Dataset/test/subject_test.txt"


feature_file<-"./UCI HAR Dataset/features.txt"
activity_file<-"./UCI HAR Dataset/activity_labels.txt"

##extract file data
train_data<-read.table(train_file)
train_labels<-read.table(train_labels_file)
train_subj<-read.table(train_subj_file)

test_data<-read.table(test_file)
test_labels<-read.table(test_labels_file)
test_subj<-read.table(test_subj_file)

feature_data<-read.table(feature_file,colClasses=c("numeric","character"))
activity<-read.table(activity_file)

##merge the dataset
data_all<-rbind(train_data,test_data)

##  Create activity label vectors for train and test data
activity_train<-as.character(merge(activity,train_labels)[,2])
activity_test<-as.character(merge(activity,test_labels)[,2])

activity_labels<-c(activity_train,activity_test)

##Create a subjec label vector for the merged data

subj<-rbind(train_subj,test_subj)

## Add the subject number and activity labels to each data set
data_all_label<-cbind(subj,activity_labels,data_all)

##add names
names(data_all_label)<-c("subject_label","activity_label",feature_data[,2])

##set subject_label to be a factor variable
data_all_label$subject_label<-as.factor(data_all_label$subject_label)


##produce file data, remove data fields calculating
##measures other than mean and standard dev
kept_cols<-c(1,2,grep("mean\\(\\)|std\\(\\)",names(data_all_label)))
data_reduce<-data_all_label[,kept_cols]

##reshape the data in order to summarize the
##mean of each variable for each subject and activity

data_reshape<-melt(data_reduce,id=names(data_reduce)[1:2],measure.vars=names(data_reduce)[3:ncol(data_reduce)],
                factorsAsString=FALSE)

##summarize and sort
data_final<-arrange(aggregate(value~subject_label+activity_label+variable,FUN=mean,data=data_reshape),
                      subject_label,activity_label,variable)

##write final data to file

write.table(data_final,file="final_data.txt",sep=" ",row.names=FALSE)


