## Read in all the data so it can be manipulated
# Read all of the appropriate datasets into R for the training set
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

# Read all of the appropriate datasets into R for the testing set
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

# Read the activity labels and features into R
activity_labels <- read.table("./activity_labels.txt")
features <- read.table("./features.txt")

# Append the data together from both the training and testing datasets.  
# Use rbind to add the rows
All_X <- rbind(X_train,X_test)
All_y <- rbind(y_train,y_test)
All_subject <- rbind(subject_train,subject_test)

## Label all of the columns so that they are easily understood
# Use the make.names function to create a set of valid variable names from
# the second columns of the features data 
# We can't use the second column of the features object directly as it is not unique
features$Description <- make.names(features[,2],unique=TRUE)

# Name the variables in the x data with the unique descriptive names
colnames(All_X) <- features$Description

# Name the y data with a descriptive name
colnames(All_y) <- "ActivityNumber"

# Name the subject data with a descriptive name
colnames(All_subject) <- "SubjectNumber"

# Name the activity labels with descriptive names
colnames(activity_labels) <- c("ActivityNumber","ActivityDescription")

# Combine the y, subject and x datasets together to get a consistent complete dataset
All_Data <- cbind(All_y,All_subject,All_X)

## Uses descriptive activity names to name the activities in the data set
# merge the y_train data with the activity_labels data
All_Data_Descriptions = merge(All_Data,activity_labels,by.x="ActivityNumber",by.y="ActivityNumber",all.x=TRUE,sort=FALSE)

## Extracts only the measurements on the mean and standard deviation for each measurement. 
# use the grep function to get just the columns that include std in their names
# store the results in a new dataframe
AllDataSTD <- All_Data_Descriptions[,(grep("std",colnames(All_Data_Descriptions)))]

# use the grep function to get just the columns that include mean in their names
# store the results in a new dataframe
AllDataMean <- All_Data_Descriptions[,(grep("mean",colnames(All_Data_Descriptions)))]

# combine the std and mean dataframes with the activity description and subject numbers
AllDataMeanSTD <-cbind(All_Data_Descriptions[,c(564,2)],AllDataSTD,AllDataMean)

## Create a second, independent tidy data set with the average of each variable for 
## each activity and each subject.
# load the library for the reshape2 package so we can use the melt function
library("reshape2", lib.loc=NULL)

# melt the data frame with the standard deviations and means to have a skinny set
skinnyData <- melt(AllDataMeanSTD,id=c("ActivityDescription","SubjectNumber"),na.rm=TRUE)

# cast the skinnyData back into a data frame with the calculated averages for each
# combination of subject and activity
tidyData <- dcast(skinnyData,ActivityDescription + SubjectNumber ~ variable, mean)

# write the table to working directory with write.table function.
# exclude row names so the column names line up correctly
write.table(tidyData,file="tidyData.txt",row.names=FALSE)
