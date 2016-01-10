---
title: "Readme"
author: "Scott Brenstuhl"
date: "July 26, 2015"
output: html_document
---

## The Repo includes the following files:
-'README.rmd'
-'Averaged_data.txt'
-'Codebook.rmd'
-'run_analysis.R'

## Explanation of analysis file
The run_analysis.R script combines the data from "
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" into a usable format, retains only means and standard deviations of the various mesurments, clarifies the labeling of the data, and takes the average of each remaining variable for each subject's six activities and writes them to a text file.

## Explanation of Averaged Data
This file is the result of running the run_analysis.R script. It contains the average result of each activity by subject for each of the following variables:
-tBodyAcc mean X
-tBodyAcc mean Y
-tBodyAcc mean Z
-tGravityAcc mean X
-tGravityAcc mean Y
-tGravityAcc mean Z
-tBodyAccJerk mean X
-tBodyAccJerk mean Y
-tBodyAccJerk mean Z
-tBodyGyro mean X
-tBodyGyro mean Y
-tBodyGyro mean Z
-tBodyGyroJerk mean X
-tBodyGyroJerk mean Y
-tBodyGyroJerk mean Z
-tBodyAccMag mean 
-tGravityAccMag mean 
-tBodyAccJerkMag mean 
-tBodyGyroMag mean 
-tBodyGyroJerkMag mean 
-fBodyAcc mean X
-fBodyAcc mean Y
-fBodyAcc mean Z
-fBodyAccJerk mean X
-fBodyAccJerk mean Y
-fBodyAccJerk mean Z
-fBodyGyro mean X
-fBodyGyro mean Y
-fBodyGyro mean Z
-fBodyAccMag mean 
-fBodyBodyAccJerkMag mean 
-fBodyBodyGyroMag mean 
-fBodyBodyGyroJerkMag mean 
-tBodyAcc std X
-tBodyAcc std Y
-tBodyAcc std Z
-tGravityAcc std X
-tGravityAcc std Y
-tGravityAcc std Z
-tBodyAccJerk std X
-tBodyAccJerk std Y
-tBodyAccJerk std Z
-tBodyGyro std X
-tBodyGyro std Y
-tBodyGyro std Z
-tBodyGyroJerk std X
-tBodyGyroJerk std Y
-tBodyGyroJerk std Z
-tBodyAccMag std 
-tGravityAccMag std 
-tBodyAccJerkMag std 
-tBodyGyroMag std 
-tBodyGyroJerkMag std 
-fBodyAcc std X
-fBodyAcc std Y
-fBodyAcc std Z
-fBodyAccJerk std X
-fBodyAccJerk std Y
-fBodyAccJerk std Z
-fBodyGyro std X
-fBodyGyro std Y
-fBodyGyro std Z
-fBodyAccMag std 
-fBodyBodyAccJerkMag std 
-fBodyBodyGyroMag std 
-fBodyBodyGyroJerkMag std 

## Required Libraries
Please make sure you install the "dplyr" package before running the script

## Running run_analysis.R
This script will collect the data itself so simply run it with the command: source("run_analysis.R")
