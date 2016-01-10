---
title: "Codebook"
author: "Scott Brenstuhl"
date: "July 26, 2015"
output: html_document
---
## Project Description
In this project we collect accelorometer data from a UCI study that was gathered from thirty subjects who carried Samsung Galexy S smartphones. We then combine the data into a usable format, retain only means and standard deviations of the various mesurments, and clarify the labeling of the data. Finally we take the average of each remaining variable for each subject's six activities and write it to a text file.

##Study design and data processing

###Collection of the raw data
The raw data was collected by checking if a "/data" directory exists, then creading it if it does not. Then checking if the zip file has been downloaded, and donloading it if it does not. Finally it checks if the zip file has been unziped and unzips it if it has not.

###Note on the original (raw) data 
I saw in the discussion boards that some people prefer to unzipping the file directly in the working directory, however I did so in a /data directory seems to be more in line with our example videos. This way satisfies the requirment that run_analysis.R can run as long as the Samsung data is in the directory since it will gather the data itself and all data reading functions are set up to look in the /data directory.

##Creating the tidy datafile

###Guide to create the tidy data file
This script will gather the date itself and create a txt file of the tidy data (named "Averaged_data.txt")
1. Set your working directory to where you want the resulting file saved 
2. Save the run_analysis.R script in your working directory
3. Run source("run_analysis.R")

###Cleaning of the data
Once all of the data is read in, the script combines the data. It then gathers only labeling colums and ones where the variable contains mean() or std(). It then renames the column to be more easy to read/descriptive by removing punctuaton and replacing it all with single spaces. Finally the numeric activity data is replaced by descriptive activity names.[https://github.com/808sAndBR/Coursera_Getting_and_Cleaning_Data_Project/README.rmd]()

##Description of the variables in the Averaged_data.txt file
 - Dimensions: 180 x 68
 
 Column| Class | Unit of Measurement| Description
 --------- | ------ |--------------------------- | ---------------
Subject | integer | Subject's Number | Subject who was observed
Activity | factor | Activity Name | Activity they performed 
tBodyAcc mean X | numeric | second | tBodyAcc's Average X
tBodyAcc mean Y | numeric | second | tBodyAcc's Average Y
tBodyAcc mean Z | numeric | second | tBodyAcc's Average Z
tGravityAcc mean X | numeric | second | tGravityAcc's Average X
tGravityAcc mean Y | numeric | second | tGravityAcc's Average Y
tGravityAcc mean Z | numeric | second | tGravityAcc's Average Z
tBodyAccJerk mean X | numeric | second | tBodyAccJerk's Average X
tBodyAccJerk mean Y | numeric | second | tBodyAccJerk's Average Y
tBodyAccJerk mean Z | numeric | second | tBodyAccJerk's Average Z
tBodyGyro mean X | numeric | second | tBodyGyro's Average X
tBodyGyro mean Y | numeric | second | tBodyGyro's Average Y
tBodyGyro mean Z | numeric | second | tBodyGyro's Average Z
tBodyGyroJerk mean X | numeric | second | tBodyGyroJerk's Average X
tBodyGyroJerk mean Y | numeric | second | tBodyGyroJerk's Average Y
tBodyGyroJerk mean Z | numeric | second | tBodyGyroJerk's Average Z
tBodyAccMag mean  | numeric | second | tBodyAccMag's Average 
tGravityAccMag mean  | numeric | second | tGravityAccMag's Average 
tBodyAccJerkMag mean  | numeric | second | tBodyAccJerkMag's Average 
tBodyGyroMag mean  | numeric | second | tBodyGyroMag's Average 
tBodyGyroJerkMag mean  | numeric | second | tBodyGyroJerkMag's Average 
fBodyAcc mean X | numeric | Hz | fBodyAcc's Average X
fBodyAcc mean Y | numeric | Hz | fBodyAcc's Average Y
fBodyAcc mean Z | numeric | Hz | fBodyAcc's Average Z
fBodyAccJerk mean X | numeric | Hz | fBodyAccJerk's Average X
fBodyAccJerk mean Y | numeric | Hz | fBodyAccJerk's Average Y
fBodyAccJerk mean Z | numeric | Hz | fBodyAccJerk's Average Z
fBodyGyro mean X | numeric | Hz | fBodyGyro's Average X
fBodyGyro mean Y | numeric | Hz | fBodyGyro's Average Y
fBodyGyro mean Z | numeric | Hz | fBodyGyro's Average Z
fBodyAccMag mean  | numeric | Hz | fBodyAccMag's Average 
fBodyBodyAccJerkMag mean  | numeric | Hz | fBodyBodyAccJerkMag's Average 
fBodyBodyGyroMag mean  | numeric | Hz | fBodyBodyGyroMag's Average 
fBodyBodyGyroJerkMag mean  | numeric | Hz | fBodyBodyGyroJerkMag's Average 
tBodyAcc std X | numeric | second | tBodyAcc's Standard Diviation X
tBodyAcc std Y | numeric | second | tBodyAcc's Standard Diviation Y
tBodyAcc std Z | numeric | second | tBodyAcc's Standard Diviation Z
tGravityAcc std X | numeric | second | tGravityAcc's Standard Diviation X
tGravityAcc std Y | numeric | second | tGravityAcc's Standard Diviation Y
tGravityAcc std Z | numeric | second | tGravityAcc's Standard Diviation Z
tBodyAccJerk std X | numeric | second | tBodyAccJerk's Standard Diviation X
tBodyAccJerk std Y | numeric | second | tBodyAccJerk's Standard Diviation Y
tBodyAccJerk std Z | numeric | second | tBodyAccJerk's Standard Diviation Z
tBodyGyro std X | numeric | second | tBodyGyro's Standard Diviation X
tBodyGyro std Y | numeric | second | tBodyGyro's Standard Diviation Y
tBodyGyro std Z | numeric | second | tBodyGyro's Standard Diviation Z
tBodyGyroJerk std X | numeric | second | tBodyGyroJerk's Standard Diviation X
tBodyGyroJerk std Y | numeric | second | tBodyGyroJerk's Standard Diviation Y
tBodyGyroJerk std Z | numeric | second | tBodyGyroJerk's Standard Diviation Z
tBodyAccMag std  | numeric | second | tBodyAccMag's Standard Diviation 
tGravityAccMag std  | numeric | second | tGravityAccMag's Standard Diviation 
tBodyAccJerkMag std  | numeric | second | tBodyAccJerkMag's Standard Diviation 
tBodyGyroMag std  | numeric | second | tBodyGyroMag's Standard Diviation 
tBodyGyroJerkMag std  | numeric | second | tBodyGyroJerkMag's Standard Diviation 
fBodyAcc std X | numeric | Hz | fBodyAcc's Standard Diviation X
fBodyAcc std Y | numeric | Hz | fBodyAcc's Standard Diviation Y
fBodyAcc std Z | numeric | Hz | fBodyAcc's Standard Diviation Z
fBodyAccJerk std X | numeric | Hz | fBodyAccJerk's Standard Diviation X
fBodyAccJerk std Y | numeric | Hz | fBodyAccJerk's Standard Diviation Y
fBodyAccJerk std Z | numeric | Hz | fBodyAccJerk's Standard Diviation Z
fBodyGyro std X | numeric | Hz | fBodyGyro's Standard Diviation X
fBodyGyro std Y | numeric | Hz | fBodyGyro's Standard Diviation Y
fBodyGyro std Z | numeric | Hz | fBodyGyro's Standard Diviation Z
fBodyAccMag std  | numeric | Hz | fBodyAccMag's Standard Diviation 
fBodyBodyAccJerkMag std  | numeric | Hz | fBodyBodyAccJerkMag's Standard Diviation 
fBodyBodyGyroMag std  | numeric | Hz | fBodyBodyGyroMag's Standard Diviation 
fBodyBodyGyroJerkMag std  | numeric | Hz | fBodyBodyGyroJerkMag's Standard Diviation


##Source
All data was pulled from:
-https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

With original data coming from:
-http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
 
 
 

