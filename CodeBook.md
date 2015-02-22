I use library dplyr to do the course project

The steps followed in the R script are:

1. Merges the training and the test sets to create one data set.
    
    For each set we have three files, x file, y file and analysis file, so I download the each file info from
    test folder and train folder and I merge each pair of files using rbind function
    
    Variables:
      data_test -> contains info from test/X_test.txt
      label_test -> contains info from test/Y_test.txt
      subject_test -> contains info fromtest/subject_test.txt
      data_train -> contains info from test/X_train.txt
      label_train -> contains info from test/y_train.txt
      subject_train -> contains info fromtest/subject_train.txt

      data_info -> merged info from data_test and data_train
      label_info -> merged info from label_test and label_train
      subject_info -> merged info from subject_test and subject_train
      
      
2. Extracts only the measurements on the mean and standard deviation for each measurement. 

  I take the col names which includes std or mean in the name. The names are in the features files

3. Uses descriptive activity names to name the activities in the data set

  I take the activity names from the activity_labels.txt file and I put the correct names in a column called ACTIVITY
  in the label info data set obtained in task 1.
  
4. Appropriately labels the data set with descriptive variable names. 
  
  I put a name to the column included in the subject_info data set, called subject
  I create a data set called all_info with all previous data sets with de correct column names

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

  I take all columns except SUBJECT and ACTIVITY and grouping by these two variables I calculate the mean of each other variable.
  I assign this tidy set to the average_set variable and I write it to the average_set.txt file
