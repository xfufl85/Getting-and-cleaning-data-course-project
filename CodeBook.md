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
