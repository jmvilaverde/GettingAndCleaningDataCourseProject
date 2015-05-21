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
##adquireFile to download the file and unzip it
##fileToData to extract the data from files
##getDataSetAverage to transform the data to a data set of averages per each value and each Subject and each Activity
##saveDataToFile to save the data set of averages into a tidyData.txt file
run_analysis <- function(){
        
        ##Adquire Data
        adquireFile("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "./UCI HAR Dataset")
        
        ##Extract data from the files and merge training and test sets in one set
        dataComplete <- fileToData("./UCI HAR Dataset")
        
        #Obtains Data set of averages per value grouped by Subject and Activity
        dataAverage <- getDataSetAverage(dataComplete)
        
        #save set to a file
        saveDataToFile(dataAverage)
        
        #Return dataAverage
        dataAverage
}

##Function to adquire the files

adquireFile <- function(fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                        unzipPath = "./UCI HAR Dataset"){
        
        #Set file name for temporary zip file
        fileZip <- "./temp.zip"
        
        #Checks if directoy exists, else, check if zip file exists to download and extract it.
        if (!file.exists(unzipPath)){
                if (!file.exists(fileZip)){
                        download.file(fileUrl, fileZip)
                }
                unzip(fileZip)
        }

}

##Function to get data from files and transform data in one complete data set
fileToData <- function(path = "./UCI HAR Dataset"){
        
        #Get labels for X_???.txt columns and activity list labels
        getLabels(path)
        
        #Set path for test files, final part of file names and calls function getDataSet to extract
        #data from the files
        testPath <- paste(path,"test/", sep = "/")
        extTest <- "_test.txt"
        dataTest <- getDataSet(testPath, extTest)
        
        #Same operation with train files
        trainPath <- paste(path,"train/", sep = "/")
        extTrain <- "_train.txt"
        dataTrain <- getDataSet(trainPath, extTrain)
        
        #Merge Test and Train data sets in only one data set
        dataComplete <<- rbind(dataTest, dataTrain)
        dataComplete
        
}

##Function to get labels from features.txt for X_???.txt  files
##also obtains labels for activity
getLabels <- function(path = "./UCI HAR Dataset"){
        #Read file features.txt 
        #and store the data in a global data frame with 2 columns: Id and Feature_Label
        features <- read.table(paste(path, "features.txt", sep = "/"))
        features <<- rename(features, Id = V1, Feature_Label = V2)
        
        #Read file activity_labels.txt 
        #and store the data in a global data frame with 2 columns: Id and Activity_Label
        activity_labels <- read.table(paste(path, "activity_labels.txt", sep = "/"))
        activity_labels <<- rename(activity_labels, Id = V1, Activity_Label = V2)
        
}

#Obtains data from files, 
#sets the column names, 
#filter columns that only contains "mean" or "std",
#merges activity Id with his activity name
#merges together the three datasets = X + y + subject
#return the complete data sets

getDataSet <- function(path, ext){
        
        #Read data from file X_????? 
        #use features global data frame to set col names 
        dataX <- read.table(paste(path,"X", ext, sep = ""), col.names = features$Feature_Label)
        
        #Read data from file y_????? 
        #set col name to Id_Activity
        dataY <- read.table(paste(path,"y", ext, sep = ""), col.names = c("Id_Activity"))
        
        #Read data from file subject_????? 
        #set col name to Subject
        dataSub <- read.table(paste(path,"subject", ext, sep = ""), col.names = "Subject")
        
        #Obtain only data with "mean" or "std" contained into column label for dataX
        #It's possible to quit "meanFreq", but I consider it as a "mean"
        dataXOptimized <- dataX[,grepl(pattern="mean", x = names(dataX))|grepl(pattern="std", x = names(dataX))]
        
        #Complete data from Y with the name for activities
        #Inner join between dataY and activity_labels to obtain the Activity names for each Id
        dataYCompleted <<- merge(dataY, activity_labels, by.x="Id_Activity", by.y="Id")
        
        #Merge the three datasets
        data <- cbind(dataXOptimized, dataYCompleted, dataSub)
        
        data
}

##Function to get average from each values group by value label, Subject and Activity

getDataSetAverage <- function(dataSet){
        
        #Obtains the mean for each column from 1 to 79 group by Subject and Activity_label
        data <- aggregate(dataComplete[,1:79], list(dataComplete$Subject, dataComplete$Activity_Label), mean)
        
        #Rename columns Group.1 and Group.2 to Subject and Activity
        data <- rename(data, Subject = Group.1, Activity = Group.2)
        
        #Order data by Subject and Activity
        data <- arrange(data, Subject, Activity)
        
        data
}

##Function to save data to a file

saveDataToFile <- function(dataToSave){
        #save table to file tidyData.txt
        write.table(dataToSave, file="tidyData.txt", row.name=FALSE)
        datos <<- read.table("tidyData.txt",header=TRUE)
}