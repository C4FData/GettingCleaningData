Data
All data originated from the following URL.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Variable Description
X_train               this is the data frame that is created from the X_train.txt input file.  This contains all the measurements.
y_train               this is the data frame that is created from the y_train.txt input file.  This contains the activities associated with the measurements.
subject_train         this is the data frame that is created from the subject_train.txt input file.  This contains the subject number associated with the measurements.
X_test                this is the data frame that is created from the X_test.txt input file.  This contains all the measurements.
y_test                this is the data frame that is created from the y_test.txt input file.  This contains the activities associated with the measurements.
subject_test          this is the data frame that is created from the subject_test.txt input file.  This contains the subject number associated with the measurements.
activity_labels       this is the data frame that is created from the activity_labels.txt input file.  This contains the cross reference between the activity number and its description.
features              this is the data frame that is created from the features.txt input file.  This contains the names of each of the variables associated with the x-data sets.
All_x                 this is a data frame that contains all the x-data from both the training (X_train) and testing (X_test) datasets
All_y                 this is a data frame that contains all the y-data from both the training (y_train) and testing (y_test) datasets
All_subject           this is a data frame that contains all the subject data from both the training (subject_train) and testing (subject_test) datasets
All_Data              this is a data frame that contains all the y (All_y), subject (All_subject) and x (All_x) data together
All_Data_Descriptions this is a merged dataset between the All_Data and activity_labels datasets
AllDataSTD            this is the subset of data from All_Data_Descriptions where the variable is related to a standard deviation
AllDataMean           this is the subset of data from All_Data_Descriptions where the variable is related to a mean
AllDataMeanSTD        this is the set of data that includes the activities, subjects, standard deviations (AllDataSTD) and means (AllDataMean)
skinnyData            this is the melted dataset from the AllDataMeanSTD data.  This includes the fields for activity, subject, variable and value
tidyData              this is the data frame from calculating the mean for each combination of activity type, subject and measurement

Data Transformations
1.  training and testing sets were combined together using the rbind() function
2.  make.names() function was used to create valid and unique variable names for the x data measurements.  UNIQUE option was set to TRUE
3.  x, y and subject datasets were combined using the cbind() function
4.  the merge() function was used to join the previously combined data with the activity labels.  The order of these activities is important as the merge will reorder the data and we need to ensure this all of the data is consistent.
5.  the grep() function was used to determine all the variables that contained either the STD or MEAN strings
6.  the melt() function from the reshape2 library was used to create a skinny dataset.  The na.rm option was set to TRUE to eliminate any missing data.
7.  the dcast() function was used calculate the mean for each subject, activity and measurement combination
