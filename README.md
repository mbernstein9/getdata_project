getdata_project
===============

The script contained in this repo processes the "Human
Activity Reconition Using Smartphone Data set" from the UCI
Machine Learning DB into a a final data file named "final_text.txt".

The processed data set aggregates the mean of each observation of the fields
calculated by the study authors by each subject participating and the corresponding
activity performed to obtain the measurement.
===================================================================================

The R script will extract the folder prepared by the study authors at the UCI site.
The final data is prepared as follows:
  -Utilize the calculated fileds in the "X_train" and "X_test" files, which are processed from 
    the raw measurements by the study authors.
  -Merge these files, which inclue the traing and test data sets for all calculated fields
  -attach the subject labels from the "subject_train" and "subject_test", which indicate the
    from the corresponding observation
  -attach the activity labels from the "activity_labels" file, which indicate the activity
    performed during the observation
  -reduce the data down to only the mean and standard deviation measurement calculation.
  -aggregate the values of the retained calculated measurements by activity and by subject

===============================================================================================


The final data final has four fields
  
  -subject_label: indicate the individual participating in the study
    integers 1-30 
  
  -activity_label: indicate the various activity perform during the measurment
    "WALKING"
    "WALKING_UPSTAIRS"
    "WALKING_DOWNSTAIRS"
    "SITTING"
    "STANDING"
    "LAYING"
=================================================================================================================
  -measurment: indicate the calculated measurement from the activity
    "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"       "tBodyAcc-mean()-Z"           
    "tBodyAcc-std()-X"            "tBodyAcc-std()-Y"        "tBodyAcc-std()-Z"            
    "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"    "tGravityAcc-mean()-Z"        
    "tGravityAcc-std()-X"         "tGravityAcc-std()-Y"     "tGravityAcc-std()-Z"        
    "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"   "tBodyAccJerk-mean()-Z"       
    "tBodyAccJerk-std()-X"        "tBodyAccJerk-std()-Y"    "tBodyAccJerk-std()-Z"      
    "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"      "tBodyGyro-mean()-Z"          
    "tBodyGyro-std()-X"           "tBodyGyro-std()-Y"       "tBodyGyro-std()-Z"          
    "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"  "tBodyGyroJerk-mean()-Z"      
    "tBodyGyroJerk-std()-X"       "tBodyGyroJerk-std()-Y"   "tBodyGyroJerk-std()-Z"       
    "tBodyAccMag-mean()"          "tBodyAccMag-std()"          
    "tGravityAccMag-mean()"       "tGravityAccMag-std()"        
    "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"      
    "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"          
    "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"     
    "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"       "fBodyAcc-mean()-Z"
    "fBodyAcc-std()-X"            "fBodyAcc-std()-Y"        "fBodyAcc-std()-Z"            
    "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"   "fBodyAccJerk-mean()-Z"
    "fBodyAccJerk-std()-X"        "fBodyAccJerk-std()-Y"    "fBodyAccJerk-std()-Z"       
    "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"      "fBodyGyro-mean()-Z"          
    "fBodyGyro-std()-X"           "fBodyGyro-std()-Y"       "fBodyGyro-std()-Z"           
    "fBodyAccMag-mean()"          "fBodyAccMag-std()"          
    "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"   
    "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"     
    "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()"
    
  ===========================================================================  
    mean_value: the mean of all measurements for a given subject and activity
      real number from [-1,1]
    
    
    
