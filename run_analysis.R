##Getting and Cleaning Data- Final project Script


##Download and unzip the data

zip_url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
zip_name<-"getdata_projectfiles.zip"

download.file(zip_url,destfile=zip_name)
unzip(zip_name)

##Name key files

train_file<-"./UCI HAR Dataset/train/X_train.txt"
test_file<-"./UCI HAR Dataset/test/X_test.txt"
feature_file<-"./UCI HAR Dataset/features.txt"

##extract file data
train_data<-read.table(train_file)
test_data<-read.table(test_file)
feature_data<-read.table(feature_file,colClasses=c("numeric","character"))

## add an indicator to the test and train data
train_data_rows<-nrow(train_data)
train_data<-cbind(rep("train",times=train_data_rows),train_data)

test_data_rows<-nrow(test_data)
test_data<-cbind(rep("test",times=test_data_rows),test_data)

##add names and combine test and train data
names(test_data)<-c("test_train",feature_data[,2])
names(train_data)<-c("test_train",feature_data[,2])
data_all<-rbind(test_data,train_data)

##produce file data, remove data fields calculating
##measures other than mean and standard dev
kept_cols<-c(1,grep("mean\\(\\)|std\\(\\)",names(data_all)))
data_reduce<-data_all[,kept_cols]
names(data_all)[kept_cols]

write.table(data_reduce,file="final_data.txt",sep=" ",row.names=FALSE)


