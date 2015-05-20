##function run_analysis
##ASIGNMENT:
##You should create one R script called run_analysis.R that does the following. 
##1.Merges the training and the test sets to create one data set.
##2.Extracts only the measurements on the mean and standard deviation for each measurement. 
##3.Uses descriptive activity names to name the activities in the data set
##4.Appropriately labels the data set with descriptive variable names. 
##5.From the data set in step 4, creates a second, independent tidy data set with the average 
##of each variable for each activity and each subject.

##Load library dplyr
library(dplyr)


##Main function, calls to 
run_analysis <- function(){
        
        ##Adquire Data
        adquireFile("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "./UCI HAR Dataset")
        
        ##Extract data from the files and merge training and test sets in one set
        dataComplete <- fileToData("./UCI HAR Dataset")
        
        #Obtains Data set of averages per value grouped by Subject and Activity
        dataAverage <<- getDataSetAverage(dataComplete)
        
        #save set to a file
        saveDataToFile(dataAverage)
}

adquireFile <- function(fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                        unzipPath = "./UCI HAR Dataset"){
        
        fileZip <- "./temp.zip"
        
        if (!file.exists(unzipPath)){
                if (!file.exists(fileZip)){
                        download.file(fileUrl, fileZip)
                }
                unzip(fileZip)
        }
        
        ##Delete directory after process data
        #unlink(dirPath, recursive = TRUE)
}

fileToData <- function(path = "./UCI HAR Dataset"){
        
        #Get labels for X_???.txt and activity list
        getLabels(path)
        
        testPath <- paste(path,"test/", sep = "/")
        extTest <- "_test.txt"
        dataTest <- getDataSet(testPath, extTest)
        
        trainPath <- paste(path,"train/", sep = "/")
        extTrain <- "_train.txt"
        dataTrain <- getDataSet(trainPath, extTrain)
        
        #merge Test and Train set in only one
        dataComplete <<- rbind(dataTest, dataTrain)
        dataComplete
        
}


getLabels <- function(path = "./UCI HAR Dataset"){
        features <<- read.table(paste(path, "features.txt", sep = "/"))
        features <<- rename(features, Id = V1, Feature_Label = V2)
        activity_labels <<- read.table(paste(path, "activity_labels.txt", sep = "/"))
        activity_labels <<- rename(activity_labels, Id = V1, Activity_Label = V2)
        
}

#Obtains data from files, sets the column names, filter columns that only contains "mean" and "std",
#merges activity Id with his activity name
#merges all three datasets = X + y + subject
#return the complete data sets

getDataSet <- function(path, ext){
        dataX <- read.table(paste(path,"X", ext, sep = ""), col.names = features$Feature_Label)
        dataY <- read.table(paste(path,"y", ext, sep = ""), col.names = c("Id_Activity"))
        dataSub <- read.table(paste(path,"subject", ext, sep = ""), col.names = "Subject")
        
        #Obtain only data with "mean" or "str" column label for dataX
        #It's possible to quit "meanFreq", but I consider it as a "mean"
        dataXOptimized <- dataX[,grepl(pattern="mean", x = names(dataX))|grepl(pattern="std", x = names(dataX))]
        
        #Complete data from Y with the name for activities
        #Inner join between dataY and activity_labels
        dataYCompleted <<- merge(dataY, activity_labels, by.x="Id_Activity", by.y="Id")
        
        data <- cbind(dataXOptimized, dataYCompleted, dataSub)
        
        data
}

getDataSetAverage <- function(dataSet){
        ##TODO create averagete over grouped_by values
        data <- aggregate(dataComplete[,1:79], list(dataComplete$Subject, dataComplete$Activity_Label), mean)
        data <- rename(data, Subject = Group.1, Activity = Group.2)
        data <- arrange(data, Subject, Activity)
        data
}

saveDataToFile <- function(dataToSave){
        write.table(dataToSave, file="tidyData.txt", row.name=FALSE)
}