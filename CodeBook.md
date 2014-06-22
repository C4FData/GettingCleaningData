Variable              Description
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
