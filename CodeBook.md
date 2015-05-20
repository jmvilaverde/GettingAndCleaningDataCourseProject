## CodeBook
### Getting and Cleaning Data - Course Project

Variables

##Data Files

Zip file getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Relevant content unzipped:
|
|-activity_labels.txt
|-features.txt
|-/test/X_test.txt
|-/test/Y_test.txt
|-/test/subject_test.txt
|-/train/X_train.txt
|-/train/Y_train.txt
|-/train/subject_train.txt

###Initial Data Set

get data from 3 files per each set:

Test set:

X_test.txt:             561 columns,    2947 rows,      no header
Y_test.txt:             1 column,       2947 rows,      no header
subject_test.txt:       1 column,       2947 rows,      no header


Training set: 

X_train.txt:            561 columns,    7352 rows,      no header
Y_train.txt:            1 column,       7352 rows,      no header
subject_train.txt:      1 column,       7352 rows,      no header

###Other files:

features.txt:           2 columns,      561 rows,       no header
activity_labels.txt:    2 columns,      6 rows,         no header

##Transformation
###In order

Call to function run_analysis

1.Call to function adquireData()

1.1.Download zip file from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
1.2.Unzip the file in work directory creates a directory: "/UCI HAR Dataset" with the structure 

|
|-activity_labels.txt
|-features.txt
|-/test/X_test.txt
|-/test/Y_test.txt
|-/test/subject_test.txt
|-/train/X_train.txt
|-/train/Y_train.txt
|-/train/subject_train.txt

2.Call to function fileToData() -> Conversion from file to Data

2.1. Call to function: getLabels() -> Get labels for X files and names for Activities



Put content from file "./UCI HAR Dataset/features.txt" into data frame "features"
Rename "features"'s columns "V1" and "V2" to "Id" and "Feature_Label"

Put content from file "./UCI HAR Dataset/activity_labels.txt" into data frame "activity_labels"
Rename "activity_labels"'s columns "V1" and "V2" to "Id" and "Activity_Label"
        
2. 
#Set path for test files, final part of the name and calls function getDataSet to extract
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
 
 
        #Obtains Data set of averages per value grouped by Subject and Activity
        dataAverage <- getDataSetAverage(dataComplete)
        
        #save set to a file
        saveDataToFile(dataAverage)
}



#Obtains data from files, 
#sets the column names, 
#filter columns that only contains "mean" and "std",
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
        
        #Obtain only data with "mean" or "str" contained into column label for dataX
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