---
title: "Getting And Cleaning Data"
author: "Yasmin"
date: "03/07/2020"
output: html_document
---

### Getting And Cleaning Data

This is repository created to complete week 4 assignment of Getting and Cleaning Data

### Data set used for completing this assignment

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Code Explaination

Training set and test set is combined and extracted partial variables to create another dataset with the averages of each variable for each activity.

### Tidy Data Set(New data set)

The new generated data set containse variables calculated based on mean and standard deviation

### The code was written based on the instruction of this assignment

Read training and test dataset into R environment. Read variable names into R envrionment. Read subject index into R environment.

1.  Merges the training and the test sets to create one data set. Use command       rbind to combine training and test set
  Extracts only the measurements on the mean and standard deviation for each      measurement. Use grep command to get column indexes for variable name contains   "mean()" or "std()"\n
2. Uses descriptive activity names to name the activities in the data set Convert   activity labels to characters and add a new column as factor\n
3. Appropriately labels the data set with descriptive variable names. Give the     selected descriptive names to variable columns\n
4. From the data set in step 4, creates a second, independent tidy data set with   the average of each variable for each activity and each subject. Use pipeline   command to create a new tidy dataset with command group_by and summarize_each   in dplyr package

