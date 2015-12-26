Pipeline for processing the data sets

Step 1: download the zipped dataset from internet and unzip the files

Step 2: prepare the training dataset by reading the training set, training subject, and training activity data;
        change the column names to descriptive variable names (features or subject or activity)
        combine training set with the corresponding subject and activity

Step 3: prepare the test dataset by reading the test set, test subject, and test activity data;
        change the column names to descriptive variable names (features or subject or activity)
        combine test set with the corresponding subject and activity

Step 4: merge the training and the test sets to create one data set by using rbind

Step 5: extract the measurements on the mean and standard deviation for each measurement;
        first, identify the wanted features by isolating the column names that contain "mean" or "std";
        second, subset the merged dataset (training+test) by the wanted features, subject and activity

Step 6: use descriptive activity names to name the activities in the data set;
        first, read the activity_labels file and change the column names to "activity" and "activity_description";
        second, merge the columns of activity_labels with the dataset generated from step 5 by activity

Step 7: appropriately labels the data set with descriptive variable names;
        first, assign the column names to a new vector variable;
        second, in the column names, remove '-()', change the initial 't' to 'time' and the initial 'f' to 'frequency',
        convert 'mean' to 'Mean' and 'std' to 'STD';
        third, change the column names of the dataset from step 6 with the newly converted names

Step 8: create a second, independent tidy data set with the average of each variable for each activity and each subject;
        first, replace the numbers in "activity" to descriptive activity names and remove the column of activity_description;  
        second, convert the columns "activity" and "subject" to factors;
        third, melt the dataset by ids "subject" and "activity"
        forth, dcast the melted dataset by "subject" and "activity" and take the mean of each variable;
        finally, save the tidy data to a txt file  
        
Information about the headers in the final_tidy_data.txt.

subject: ID of each people taking the test
activity: The activity performed when measurements were taken. The activities including the following:
WALKING: subject was walking during the test
WALKING_UPSTAIRS: subject was walking up a staircase during the test
WALKING_DOWNSTAIRS: subject was walking down a staircase during the test
SITTING: subject was sitting during the test
STANDING: subject was standing during the test
LAYING: subject was laying down during the test

Measurements include the following: 
[3] "timeBodyAccMeanX"                    
 [4] "timeBodyAccMeanY"                    
 [5] "timeBodyAccMeanZ"                    
 [6] "timeBodyAccSTDX"                     
 [7] "timeBodyAccSTDY"                     
 [8] "timeBodyAccSTDZ"                     
 [9] "timeGravityAccMeanX"                 
[10] "timeGravityAccMeanY"                 
[11] "timeGravityAccMeanZ"                 
[12] "timeGravityAccSTDX"                  
[13] "timeGravityAccSTDY"                  
[14] "timeGravityAccSTDZ"                  
[15] "timeBodyAccJerkMeanX"                
[16] "timeBodyAccJerkMeanY"                
[17] "timeBodyAccJerkMeanZ"                
[18] "timeBodyAccJerkSTDX"                 
[19] "timeBodyAccJerkSTDY"                 
[20] "timeBodyAccJerkSTDZ"                 
[21] "timeBodyGyroMeanX"                   
[22] "timeBodyGyroMeanY"                   
[23] "timeBodyGyroMeanZ"                   
[24] "timeBodyGyroSTDX"                    
[25] "timeBodyGyroSTDY"                    
[26] "timeBodyGyroSTDZ"                    
[27] "timeBodyGyroJerkMeanX"               
[28] "timeBodyGyroJerkMeanY"               
[29] "timeBodyGyroJerkMeanZ"               
[30] "timeBodyGyroJerkSTDX"                
[31] "timeBodyGyroJerkSTDY"                
[32] "timeBodyGyroJerkSTDZ"                
[33] "timeBodyAccMagMean"                  
[34] "timeBodyAccMagSTD"                   
[35] "timeGravityAccMagMean"               
[36] "timeGravityAccMagSTD"                
[37] "timeBodyAccJerkMagMean"              
[38] "timeBodyAccJerkMagSTD"               
[39] "timeBodyGyroMagMean"                 
[40] "timeBodyGyroMagSTD"                  
[41] "timeBodyGyroJerkMagMean"             
[42] "timeBodyGyroJerkMagSTD"              
[43] "frequencyBodyAccMeanX"               
[44] "frequencyBodyAccMeanY"               
[45] "frequencyBodyAccMeanZ"               
[46] "frequencyBodyAccSTDX"                
[47] "frequencyBodyAccSTDY"                
[48] "frequencyBodyAccSTDZ"                
[49] "frequencyBodyAccMeanFreqX"           
[50] "frequencyBodyAccMeanFreqY"           
[51] "frequencyBodyAccMeanFreqZ"           
[52] "frequencyBodyAccJerkMeanX"           
[53] "frequencyBodyAccJerkMeanY"           
[54] "frequencyBodyAccJerkMeanZ"           
[55] "frequencyBodyAccJerkSTDX"            
[56] "frequencyBodyAccJerkSTDY"            
[57] "frequencyBodyAccJerkSTDZ"            
[58] "frequencyBodyAccJerkMeanFreqX"       
[59] "frequencyBodyAccJerkMeanFreqY"       
[60] "frequencyBodyAccJerkMeanFreqZ"       
[61] "frequencyBodyGyroMeanX"              
[62] "frequencyBodyGyroMeanY"              
[63] "frequencyBodyGyroMeanZ"              
[64] "frequencyBodyGyroSTDX"               
[65] "frequencyBodyGyroSTDY"               
[66] "frequencyBodyGyroSTDZ"               
[67] "frequencyBodyGyroMeanFreqX"          
[68] "frequencyBodyGyroMeanFreqY"          
[69] "frequencyBodyGyroMeanFreqZ"          
[70] "frequencyBodyAccMagMean"             
[71] "frequencyBodyAccMagSTD"              
[72] "frequencyBodyAccMagMeanFreq"         
[73] "frequencyBodyBodyAccJerkMagMean"     
[74] "frequencyBodyBodyAccJerkMagSTD"      
[75] "frequencyBodyBodyAccJerkMagMeanFreq" 
[76] "frequencyBodyBodyGyroMagMean"        
[77] "frequencyBodyBodyGyroMagSTD"         
[78] "frequencyBodyBodyGyroMagMeanFreq"    
[79] "frequencyBodyBodyGyroJerkMagMean"    
[80] "frequencyBodyBodyGyroJerkMagSTD"     
[81] "frequencyBodyBodyGyroJerkMagMeanFreq"  


