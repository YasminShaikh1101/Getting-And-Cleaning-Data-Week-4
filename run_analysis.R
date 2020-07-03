# Unzip dataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")
unzip(zipfile="./midtermdata/Dataset.zip",exdir="./midtermdata")

library(dplyr)

#Reading training tables
x_train   <- read.table("./train/X_train.txt")
y_train   <- read.table("./train/Y_train.txt") 
sub_train <- read.table("./train/subject_train.txt")

#Reading the testing tables
x_test   <- read.table("./test/X_test.txt")
y_test   <- read.table("./test/Y_test.txt") 
sub_test <- read.table("./test/subject_test.txt")

#Read the features data
variable_names <- read.table("./features.txt")
features <- read.table("./features.txt")

#Read activity labels data
activity_labels <- read.table("./activity_labels.txt") 

#Create Column Values to the Train Data
colnames(xtrain) = features[,2]
colnames(ytrain) = "activityId"
colnames(subject_train) = "subjectId"

#Merging training set and test set
x_total   <- rbind(x_train, x_test)
y_total   <- rbind(y_train, y_test) 
sub_total <- rbind(sub_train, sub_test) 

#measurements for mean and standard deviation 
sel_features <- variable_names[grep(".*mean\\(\\)|std\\(\\)", features[,2], ignore.case = FALSE),]
x_total <- x_total[,sel_features[,1]]


#Name columns
colnames(x_total)   <- sel_features[,2]
colnames(y_total)   <- "activity"
colnames(sub_total) <- "subject"

#Create the main data table merging both table tables
setAllInOne = rbind(mrg_train, mrg_test)

#read all the values
colNames = colnames(setAllInOne)

#merging final data set
total <- cbind(sub_total, y_total, x_total)

# turn activities & subjects into factors 
total$activity <- factor(total$activity, levels = activity_labels[,1], labels = activity_labels[,2]) 
total$subject  <- as.factor(total$subject) 

# create a summary independent tidy dataset from final dataset 
# with the average of each variable for each activity and each subject. 
total_mean <- total %>% group_by(activity, subject) %>% summarize_all(funs(mean)) 

# tidy data set
write.table(total_mean, file = "./tidydata.txt", row.names = FALSE, col.names = TRUE) 