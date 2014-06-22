GettingCleaningData
===================
The data used in this assignment is from "Human Activity Recognition Using Smartphones Dataset Version 1.0" [1].
All of the data can be found at the following URL
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Contained within the zip file is a README file that describes all of the data and how it was collected.

Only the training and testing datasets were used in this assignment.  The inertial signals data were not used.

The run_analysis.R script contains all of the R code for creating a new tidyData dataset.
The script performs the following steps
1.  reads in all data from the training and testing directories using the read.table() function
2.  reads in the activity labels and features
3.  combines together the x datasets, y datasets and subject datasets
4.  names the x data with descriptive and valid names from the features data
5.  names the y data with a descriptive variable name
6.  names the subject data with descriptive variable names
7.  combines all the x, y and subject data together to create a consistent dataset
8.  merges the combined dataset with the activity labels to get a descriptive variable for the activities
9.  extracts a subset of the data for those fields dealing with standard deviation variables
10.  extracts a subset of the data for those fields dealing with mean variables
11.  creates a new data set from the activity descriptions, subjects, mean and standard deviation data
12.  loads the reshape2 library to utilize the melt function
13.  melt the mean and standard deviation data to create a skinny dataset
14.  calculate the mean for each of the measurement fields by every combination of subject and activity description
15.  write the results to a file

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
