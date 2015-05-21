# GettingAndCleaningDataCourseProject
> Repository containing code for Getting and Cleaning Data Course Project

***

## Requirements

> Use of package dplyr

***

## Instructions to read the tidydata.txt

> Use this: read.table("tidyData.txt",header=TRUE)

***

##Basic Steps

> 1. Adquire Files
> 2. Extract Data from the files
> 3. Create data set of averages
> 4. Save data set to file

***
***

#Detailed Steps and Functions

***

##run_analysis()
> Description: Main function
 
> No parameters

> Main function, calls to:
>
> * adquireFile to download the file and unzip it
> * fileToData to extract the data from files
> * getDataSetAverage to transform the data to a data Set of averages per each value and each Subject and each Activity
> * saveDataToFile to save the data set of averages into a tidyData.txt file

***

##adquireFile(fileUrl, unzipPath) 
> Description: Function to adquire Data files

> 2 parameters:
>
> * fileUrl         (default value: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
> * unzipPath       (default value: "./UCI HAR Dataset")

***

> This function checks if exists the zip File and the directory with the files, 
> if it doesn't exists dowload the files and uncompress the files.
        
***

##fileToData(path) 
> Description: Function to get data from files and transform data in one complete data set

> 1 parameter:
> 
> * path            (default value: "./UCI HAR Dataset")

> Extract data from files into formated data set and merge all in one

***

##getLabels(path)
> Description: Function to get labels from features.txt for X_???.txt files
> also obtains labels for activity

> 1 parameter:
> 
> * path            (default value: "./UCI HAR Dataset")
        
> Read files features.txt and activity_labels.txt and store the data in a global data frame.

***

##getDataSet(path, ext)
> Description: Function to get data from files and return formated data set

> 2 parameters:
> 
> * path            (no default values)
> * ext             (no default values)

> Obtains data from files X_????.txt, y_????.txt and subject_????.txt, sets the column names, 
> filter columns that only contains "mean" and "std", merges activity Id with his activity name, 
> merges together the three datasets = X + y + subject and return the complete data sets

***

##getDataSetAverage()
> Description: Function to get average from each values group by value label, Subject and Activity

> 1 parameter:
> 
> * dataSet         (no default values)

> Obtains the mean for each column group by Subject and Activity_label and format resultant data set

***

##saveDataToFile
> Description: Function to save data to a file

> 1 parameter:
> 
> * dataToSave      (no default values)

> Save data to file tidyData.txt
