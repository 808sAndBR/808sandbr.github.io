library(dplyr)

# Check if data directory exists, create if not
if(!file.exists("./data")){dir.create("data")}

# Get the zip file and unzip if it does not exist/is not unziped
if(!file.exists("./data/projectData.zip/")){
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","./data/projectData.zip", method = "curl")
}
if(!file.exists("./data/UCI HAR Dataset/")){
    unzip("./data/projectData.zip",exdir = "./data")
}

# Read in, combine, and label all Activity data
test_y <- read.table("data/UCI HAR Dataset/test/y_test.txt")
train_y <- read.table("data/UCI HAR Dataset/train/y_train.txt")
all_y <- rbind(test_y,train_y)
colnames(all_y) <- "Activity"

# Read in, combine, and label all Subject data
test_sub <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
train_sub <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
all_sub <- rbind(test_sub, train_sub)
colnames(all_sub) <- "Subject"

# Read in, combine, and label all "X" data
test_x <- read.table("data/UCI HAR Dataset/test/X_test.txt")
train_x <- read.table("data/UCI HAR Dataset/train/X_train.txt")
all_x <- rbind(test_x, train_x)
col_labels <- read.table("data/UCI HAR Dataset/features.txt")
col_labels$V2<- make.unique(as.character(col_labels$V2))
colnames(all_x) <- col_labels$V2

# Combine all data into one Data Frame
all_data <- cbind(all_sub,all_y,all_x)

# Collect only values that are a mean or standard diviation 
mean_std_df <- select(all_data, Subject, Activity, contains("mean()"), contains("std()"))

#Clean up and reasign column names
new_colnames <- make.names(colnames(mean_std_df))
new_colnames <- gsub("\\.\\.\\."," ",new_colnames)
new_colnames <- gsub("\\.\\."," ",new_colnames)
new_colnames <- gsub("\\."," ",new_colnames)
colnames(mean_std_df) <- new_colnames

# Rename activities to their descriptive names
activity_lables <- read.table("data/UCI HAR Dataset/activity_labels.txt")
mean_std_df$Activity <- activity_lables$V2[match(mean_std_df$Activity, activity_lables$V1)]

# Group data by Subject and Activity 
groupedDF <- group_by(mean_std_df, Subject, Activity)

# Create data frame of average value for each subject's activities
tidyDF <- groupedDF %>% summarise_each(funs(mean))

write.table(tidyDF,file="Averaged_data.txt",row.names = FALSE)

