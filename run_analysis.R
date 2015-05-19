##function run_analysis
##ASIGNMENT:
##You should create one R script called run_analysis.R that does the following. 
##1.Merges the training and the test sets to create one data set.
##2.Extracts only the measurements on the mean and standard deviation for each measurement. 
##3.Uses descriptive activity names to name the activities in the data set
##4.Appropriately labels the data set with descriptive variable names. 
##5.From the data set in step 4, creates a second, independent tidy data set with the average 
##of each variable for each activity and each subject.

run_analysis <- function(){
        
        ##Adquire Data
        dataSet <- adquireData()
        fileDestiny
        
        ##Merge training and test sets
        
        
#directory        
}

adquireData <- function(fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"){
        
        fileZip <- "./temp.zip"
        download.file(fileUrl, fileZip)
        unzip(fileZip)
        file.remove(fileZip)
        dirPath <- "./UCI HAR Dataset"
        #unlink(dirPath, recursive = TRUE)
        testPath <- paste(dirPath,"test", sep = "/")
        dir(testPath)
        dataTest <- read.table(paste(testPath,"x_test.txt", sep = "/"))
        dataTestY <- read.table(paste(testPath,"y_test.txt", sep = "/"))
        dataTestSub <- read.table(paste(testPath,"subject_test.txt", sep = "/"))
        
}