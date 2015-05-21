## CodeBook
### Getting and Cleaning Data - Course Project
#### by jmvilaverde

***

##Data Files

> Zip file getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
> 
>  Relevant content unzipped:
>   
 directory     | file
 ------------- | -------------
 .             | activity_labels.txt
 .             | features.txt
 test          | X_test.txt
 test          | Y_test.txt
 test          | subject_test.txt
 train         | X_train.txt
 train         | Y_train.txt
 train         | subject_train.txt

###Files containing data

> Get data from 3 files per each set:
> 
> Test set:
> 
> file                  | Columns       | Rows          | Header
> --------------------- | ------------- | ------------- | ----------
> X_test.txt            | 561           | 2947          | no header
> Y_test.txt            | 1             | 2947          | no header
> subject_test.txt      | 1             | 2947          | no header
>
> Training set:
>
> file                  | Rows | Columns | Header
> --------------------- | ---- | ------- | ---------
> X_train.txt           | 7352 | 561     | no header
> Y_train.txt           | 7352 | 1       | no header
> subject_train.txt     | 7352 | 1       | no header

###Other files:

> file                  | Rows | Columns | Header
> --------------------- | ---- | ------- | ---------
> features.txt          | 561  | 2       | no header
> activity_labels.txt   | 6    | 2       | no header

***

##Complete procedure

####0.Call to function run_analysis()

***

####1.Call to function adquireData() -> Adquire files and unzip it

> ####1.1.Download zip file from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

> ####1.2.Unzip the file in work directory creates a directory: "/UCI HAR Dataset" with the structure: 
> 
> directory     | file
> ------------- | -------------
> .             | activity_labels.txt
> .             | features.txt
> test          | X_test.txt
> test          | Y_test.txt
> test          | subject_test.txt
> train         | X_train.txt
> train         | Y_train.txt
> train         | subject_train.txt

***

####2.Call to function fileToData() -> Conversion from file to Data

> ####2.1.Call to function: getLabels() -> Get labels for X files and names for Activities

> ####2.1.1.Get data from File features.txt into Data Frame features
> 
> from File                               | to Data Frame | Data Frame dimension [rows x columns] | Data Frame Columns names
> --------------------------------------- | ------------- | ------------------------------------- | ------------------------
> /UCI HAR Dataset/features.txt           | features      | 561 x 2                               | V1, V2
> 
> 
> Data frame      | Columns names
> --------------- | -------------
> features        | V1, V2
> 
> Rename column names of features
> 
> Data Frame | Old column name | New column name
> ---------- | --------------- | ---------------
> features   | V1              | Id
> features   | V2              | Feature_Label


> ####2.1.2.Get data from File activity_labels.txt into Data Frame activity_labels
> 
> from File                            | to Data Frame   | Data Frame dimension [rows x columns] | Data Frame Columns names
> ------------------------------------ | --------------- | ------------------------------------- | ------------------------
> /UCI HAR Dataset/activity_labels.txt | activity_labels | 6 x 2                                 | V1, V2
> 
> 
> Data frame      | Columns names
> --------------- | -------------
> features        | V1, V2
 
> ####2.1.3.Rename column names of activity_labels
> 
> Data Frame      | Old column name | New column name
> --------------- | --------------- | ---------------
> activity_labels | V1              | Id
> activity_labels | V2              | Activity_Label

> ####2.2.Obtains data from files of Train and Test and stores into a Data Frame
> 
> ####2.2.1.Get data from Test
> 
> ####2.2.1.1.Set path for Test files and final part of file names 
> 
> variable | value stored
> -------- | ----------------------
> testPath | "/UCI HAR Dataset/test/""
> extTest  | "_test.txt""
 
> ####2.2.1.2.Call function getDataSet() to extract Test data from files to Data Frame dataTest
        
> dataTest <- getDataSet(testPath, extTest)

> ####2.2.1.2.1.Obtains data from files and sets the column names
>
> from File                              | to Data Frame | Data Frame dimension [rows x columns] | Data Frame Columns names
> -------------------------------------- | ------------- | ------------------------------------- | ------------------------
> /UCI HAR Dataset/test/X_test.txt       | dataX         | 2947 x 561                            | features$Feature_Label
> /UCI HAR Dataset/test/y_test.txt       | dataY         | 2947 x 1                              | "Id_Activity"
> /UCI HAR Dataset/test/subject_test.txt | dataSub       | 2947 x 1                              | "Subject"

> Values of features$Feature_Label
>
> [1] tBodyAcc-mean()-X                    tBodyAcc-mean()-Y                    tBodyAcc-mean()-Z                   
  [4] tBodyAcc-std()-X                     tBodyAcc-std()-Y                     tBodyAcc-std()-Z                    
  [7] tBodyAcc-mad()-X                     tBodyAcc-mad()-Y                     tBodyAcc-mad()-Z                    
 [10] tBodyAcc-max()-X                     tBodyAcc-max()-Y                     tBodyAcc-max()-Z                    
 [13] tBodyAcc-min()-X                     tBodyAcc-min()-Y                     tBodyAcc-min()-Z                    
 [16] tBodyAcc-sma()                       tBodyAcc-energy()-X                  tBodyAcc-energy()-Y                 
 [19] tBodyAcc-energy()-Z                  tBodyAcc-iqr()-X                     tBodyAcc-iqr()-Y                    
 [22] tBodyAcc-iqr()-Z                     tBodyAcc-entropy()-X                 tBodyAcc-entropy()-Y                
 [25] tBodyAcc-entropy()-Z                 tBodyAcc-arCoeff()-X,1               tBodyAcc-arCoeff()-X,2              
 [28] tBodyAcc-arCoeff()-X,3               tBodyAcc-arCoeff()-X,4               tBodyAcc-arCoeff()-Y,1              
 [31] tBodyAcc-arCoeff()-Y,2               tBodyAcc-arCoeff()-Y,3               tBodyAcc-arCoeff()-Y,4              
 [34] tBodyAcc-arCoeff()-Z,1               tBodyAcc-arCoeff()-Z,2               tBodyAcc-arCoeff()-Z,3              
 [37] tBodyAcc-arCoeff()-Z,4               tBodyAcc-correlation()-X,Y           tBodyAcc-correlation()-X,Z          
 [40] tBodyAcc-correlation()-Y,Z           tGravityAcc-mean()-X                 tGravityAcc-mean()-Y                
 [43] tGravityAcc-mean()-Z                 tGravityAcc-std()-X                  tGravityAcc-std()-Y                 
 [46] tGravityAcc-std()-Z                  tGravityAcc-mad()-X                  tGravityAcc-mad()-Y                 
 [49] tGravityAcc-mad()-Z                  tGravityAcc-max()-X                  tGravityAcc-max()-Y                 
 [52] tGravityAcc-max()-Z                  tGravityAcc-min()-X                  tGravityAcc-min()-Y                 
 [55] tGravityAcc-min()-Z                  tGravityAcc-sma()                    tGravityAcc-energy()-X              
 [58] tGravityAcc-energy()-Y               tGravityAcc-energy()-Z               tGravityAcc-iqr()-X                 
 [61] tGravityAcc-iqr()-Y                  tGravityAcc-iqr()-Z                  tGravityAcc-entropy()-X             
 [64] tGravityAcc-entropy()-Y              tGravityAcc-entropy()-Z              tGravityAcc-arCoeff()-X,1           
 [67] tGravityAcc-arCoeff()-X,2            tGravityAcc-arCoeff()-X,3            tGravityAcc-arCoeff()-X,4           
 [70] tGravityAcc-arCoeff()-Y,1            tGravityAcc-arCoeff()-Y,2            tGravityAcc-arCoeff()-Y,3           
 [73] tGravityAcc-arCoeff()-Y,4            tGravityAcc-arCoeff()-Z,1            tGravityAcc-arCoeff()-Z,2           
 [76] tGravityAcc-arCoeff()-Z,3            tGravityAcc-arCoeff()-Z,4            tGravityAcc-correlation()-X,Y       
 [79] tGravityAcc-correlation()-X,Z        tGravityAcc-correlation()-Y,Z        tBodyAccJerk-mean()-X               
 [82] tBodyAccJerk-mean()-Y                tBodyAccJerk-mean()-Z                tBodyAccJerk-std()-X                
 [85] tBodyAccJerk-std()-Y                 tBodyAccJerk-std()-Z                 tBodyAccJerk-mad()-X                
 [88] tBodyAccJerk-mad()-Y                 tBodyAccJerk-mad()-Z                 tBodyAccJerk-max()-X                
 [91] tBodyAccJerk-max()-Y                 tBodyAccJerk-max()-Z                 tBodyAccJerk-min()-X                
 [94] tBodyAccJerk-min()-Y                 tBodyAccJerk-min()-Z                 tBodyAccJerk-sma()                  
 [97] tBodyAccJerk-energy()-X              tBodyAccJerk-energy()-Y              tBodyAccJerk-energy()-Z             
[100] tBodyAccJerk-iqr()-X                 tBodyAccJerk-iqr()-Y                 tBodyAccJerk-iqr()-Z                
[103] tBodyAccJerk-entropy()-X             tBodyAccJerk-entropy()-Y             tBodyAccJerk-entropy()-Z            
[106] tBodyAccJerk-arCoeff()-X,1           tBodyAccJerk-arCoeff()-X,2           tBodyAccJerk-arCoeff()-X,3          
[109] tBodyAccJerk-arCoeff()-X,4           tBodyAccJerk-arCoeff()-Y,1           tBodyAccJerk-arCoeff()-Y,2          
[112] tBodyAccJerk-arCoeff()-Y,3           tBodyAccJerk-arCoeff()-Y,4           tBodyAccJerk-arCoeff()-Z,1          
[115] tBodyAccJerk-arCoeff()-Z,2           tBodyAccJerk-arCoeff()-Z,3           tBodyAccJerk-arCoeff()-Z,4          
[118] tBodyAccJerk-correlation()-X,Y       tBodyAccJerk-correlation()-X,Z       tBodyAccJerk-correlation()-Y,Z      
[121] tBodyGyro-mean()-X                   tBodyGyro-mean()-Y                   tBodyGyro-mean()-Z                  
[124] tBodyGyro-std()-X                    tBodyGyro-std()-Y                    tBodyGyro-std()-Z                   
[127] tBodyGyro-mad()-X                    tBodyGyro-mad()-Y                    tBodyGyro-mad()-Z                   
[130] tBodyGyro-max()-X                    tBodyGyro-max()-Y                    tBodyGyro-max()-Z                   
[133] tBodyGyro-min()-X                    tBodyGyro-min()-Y                    tBodyGyro-min()-Z                   
[136] tBodyGyro-sma()                      tBodyGyro-energy()-X                 tBodyGyro-energy()-Y                
[139] tBodyGyro-energy()-Z                 tBodyGyro-iqr()-X                    tBodyGyro-iqr()-Y                   
[142] tBodyGyro-iqr()-Z                    tBodyGyro-entropy()-X                tBodyGyro-entropy()-Y               
[145] tBodyGyro-entropy()-Z                tBodyGyro-arCoeff()-X,1              tBodyGyro-arCoeff()-X,2             
[148] tBodyGyro-arCoeff()-X,3              tBodyGyro-arCoeff()-X,4              tBodyGyro-arCoeff()-Y,1             
[151] tBodyGyro-arCoeff()-Y,2              tBodyGyro-arCoeff()-Y,3              tBodyGyro-arCoeff()-Y,4             
[154] tBodyGyro-arCoeff()-Z,1              tBodyGyro-arCoeff()-Z,2              tBodyGyro-arCoeff()-Z,3             
[157] tBodyGyro-arCoeff()-Z,4              tBodyGyro-correlation()-X,Y          tBodyGyro-correlation()-X,Z         
[160] tBodyGyro-correlation()-Y,Z          tBodyGyroJerk-mean()-X               tBodyGyroJerk-mean()-Y              
[163] tBodyGyroJerk-mean()-Z               tBodyGyroJerk-std()-X                tBodyGyroJerk-std()-Y               
[166] tBodyGyroJerk-std()-Z                tBodyGyroJerk-mad()-X                tBodyGyroJerk-mad()-Y               
[169] tBodyGyroJerk-mad()-Z                tBodyGyroJerk-max()-X                tBodyGyroJerk-max()-Y               
[172] tBodyGyroJerk-max()-Z                tBodyGyroJerk-min()-X                tBodyGyroJerk-min()-Y               
[175] tBodyGyroJerk-min()-Z                tBodyGyroJerk-sma()                  tBodyGyroJerk-energy()-X            
[178] tBodyGyroJerk-energy()-Y             tBodyGyroJerk-energy()-Z             tBodyGyroJerk-iqr()-X               
[181] tBodyGyroJerk-iqr()-Y                tBodyGyroJerk-iqr()-Z                tBodyGyroJerk-entropy()-X           
[184] tBodyGyroJerk-entropy()-Y            tBodyGyroJerk-entropy()-Z            tBodyGyroJerk-arCoeff()-X,1         
[187] tBodyGyroJerk-arCoeff()-X,2          tBodyGyroJerk-arCoeff()-X,3          tBodyGyroJerk-arCoeff()-X,4         
[190] tBodyGyroJerk-arCoeff()-Y,1          tBodyGyroJerk-arCoeff()-Y,2          tBodyGyroJerk-arCoeff()-Y,3         
[193] tBodyGyroJerk-arCoeff()-Y,4          tBodyGyroJerk-arCoeff()-Z,1          tBodyGyroJerk-arCoeff()-Z,2         
[196] tBodyGyroJerk-arCoeff()-Z,3          tBodyGyroJerk-arCoeff()-Z,4          tBodyGyroJerk-correlation()-X,Y     
[199] tBodyGyroJerk-correlation()-X,Z      tBodyGyroJerk-correlation()-Y,Z      tBodyAccMag-mean()                  
[202] tBodyAccMag-std()                    tBodyAccMag-mad()                    tBodyAccMag-max()                   
[205] tBodyAccMag-min()                    tBodyAccMag-sma()                    tBodyAccMag-energy()                
[208] tBodyAccMag-iqr()                    tBodyAccMag-entropy()                tBodyAccMag-arCoeff()1              
[211] tBodyAccMag-arCoeff()2               tBodyAccMag-arCoeff()3               tBodyAccMag-arCoeff()4              
[214] tGravityAccMag-mean()                tGravityAccMag-std()                 tGravityAccMag-mad()                
[217] tGravityAccMag-max()                 tGravityAccMag-min()                 tGravityAccMag-sma()                
[220] tGravityAccMag-energy()              tGravityAccMag-iqr()                 tGravityAccMag-entropy()            
[223] tGravityAccMag-arCoeff()1            tGravityAccMag-arCoeff()2            tGravityAccMag-arCoeff()3           
[226] tGravityAccMag-arCoeff()4            tBodyAccJerkMag-mean()               tBodyAccJerkMag-std()               
[229] tBodyAccJerkMag-mad()                tBodyAccJerkMag-max()                tBodyAccJerkMag-min()               
[232] tBodyAccJerkMag-sma()                tBodyAccJerkMag-energy()             tBodyAccJerkMag-iqr()               
[235] tBodyAccJerkMag-entropy()            tBodyAccJerkMag-arCoeff()1           tBodyAccJerkMag-arCoeff()2          
[238] tBodyAccJerkMag-arCoeff()3           tBodyAccJerkMag-arCoeff()4           tBodyGyroMag-mean()                 
[241] tBodyGyroMag-std()                   tBodyGyroMag-mad()                   tBodyGyroMag-max()                  
[244] tBodyGyroMag-min()                   tBodyGyroMag-sma()                   tBodyGyroMag-energy()               
[247] tBodyGyroMag-iqr()                   tBodyGyroMag-entropy()               tBodyGyroMag-arCoeff()1             
[250] tBodyGyroMag-arCoeff()2              tBodyGyroMag-arCoeff()3              tBodyGyroMag-arCoeff()4             
[253] tBodyGyroJerkMag-mean()              tBodyGyroJerkMag-std()               tBodyGyroJerkMag-mad()              
[256] tBodyGyroJerkMag-max()               tBodyGyroJerkMag-min()               tBodyGyroJerkMag-sma()              
[259] tBodyGyroJerkMag-energy()            tBodyGyroJerkMag-iqr()               tBodyGyroJerkMag-entropy()          
[262] tBodyGyroJerkMag-arCoeff()1          tBodyGyroJerkMag-arCoeff()2          tBodyGyroJerkMag-arCoeff()3         
[265] tBodyGyroJerkMag-arCoeff()4          fBodyAcc-mean()-X                    fBodyAcc-mean()-Y                   
[268] fBodyAcc-mean()-Z                    fBodyAcc-std()-X                     fBodyAcc-std()-Y                    
[271] fBodyAcc-std()-Z                     fBodyAcc-mad()-X                     fBodyAcc-mad()-Y                    
[274] fBodyAcc-mad()-Z                     fBodyAcc-max()-X                     fBodyAcc-max()-Y                    
[277] fBodyAcc-max()-Z                     fBodyAcc-min()-X                     fBodyAcc-min()-Y                    
[280] fBodyAcc-min()-Z                     fBodyAcc-sma()                       fBodyAcc-energy()-X                 
[283] fBodyAcc-energy()-Y                  fBodyAcc-energy()-Z                  fBodyAcc-iqr()-X                    
[286] fBodyAcc-iqr()-Y                     fBodyAcc-iqr()-Z                     fBodyAcc-entropy()-X                
[289] fBodyAcc-entropy()-Y                 fBodyAcc-entropy()-Z                 fBodyAcc-maxInds-X                  
[292] fBodyAcc-maxInds-Y                   fBodyAcc-maxInds-Z                   fBodyAcc-meanFreq()-X               
[295] fBodyAcc-meanFreq()-Y                fBodyAcc-meanFreq()-Z                fBodyAcc-skewness()-X               
[298] fBodyAcc-kurtosis()-X                fBodyAcc-skewness()-Y                fBodyAcc-kurtosis()-Y               
[301] fBodyAcc-skewness()-Z                fBodyAcc-kurtosis()-Z                fBodyAcc-bandsEnergy()-1,8          
[304] fBodyAcc-bandsEnergy()-9,16          fBodyAcc-bandsEnergy()-17,24         fBodyAcc-bandsEnergy()-25,32        
[307] fBodyAcc-bandsEnergy()-33,40         fBodyAcc-bandsEnergy()-41,48         fBodyAcc-bandsEnergy()-49,56        
[310] fBodyAcc-bandsEnergy()-57,64         fBodyAcc-bandsEnergy()-1,16          fBodyAcc-bandsEnergy()-17,32        
[313] fBodyAcc-bandsEnergy()-33,48         fBodyAcc-bandsEnergy()-49,64         fBodyAcc-bandsEnergy()-1,24         
[316] fBodyAcc-bandsEnergy()-25,48         fBodyAcc-bandsEnergy()-1,8           fBodyAcc-bandsEnergy()-9,16         
[319] fBodyAcc-bandsEnergy()-17,24         fBodyAcc-bandsEnergy()-25,32         fBodyAcc-bandsEnergy()-33,40        
[322] fBodyAcc-bandsEnergy()-41,48         fBodyAcc-bandsEnergy()-49,56         fBodyAcc-bandsEnergy()-57,64        
[325] fBodyAcc-bandsEnergy()-1,16          fBodyAcc-bandsEnergy()-17,32         fBodyAcc-bandsEnergy()-33,48        
[328] fBodyAcc-bandsEnergy()-49,64         fBodyAcc-bandsEnergy()-1,24          fBodyAcc-bandsEnergy()-25,48        
[331] fBodyAcc-bandsEnergy()-1,8           fBodyAcc-bandsEnergy()-9,16          fBodyAcc-bandsEnergy()-17,24        
[334] fBodyAcc-bandsEnergy()-25,32         fBodyAcc-bandsEnergy()-33,40         fBodyAcc-bandsEnergy()-41,48        
[337] fBodyAcc-bandsEnergy()-49,56         fBodyAcc-bandsEnergy()-57,64         fBodyAcc-bandsEnergy()-1,16         
[340] fBodyAcc-bandsEnergy()-17,32         fBodyAcc-bandsEnergy()-33,48         fBodyAcc-bandsEnergy()-49,64        
[343] fBodyAcc-bandsEnergy()-1,24          fBodyAcc-bandsEnergy()-25,48         fBodyAccJerk-mean()-X               
[346] fBodyAccJerk-mean()-Y                fBodyAccJerk-mean()-Z                fBodyAccJerk-std()-X                
[349] fBodyAccJerk-std()-Y                 fBodyAccJerk-std()-Z                 fBodyAccJerk-mad()-X                
[352] fBodyAccJerk-mad()-Y                 fBodyAccJerk-mad()-Z                 fBodyAccJerk-max()-X                
[355] fBodyAccJerk-max()-Y                 fBodyAccJerk-max()-Z                 fBodyAccJerk-min()-X                
[358] fBodyAccJerk-min()-Y                 fBodyAccJerk-min()-Z                 fBodyAccJerk-sma()                  
[361] fBodyAccJerk-energy()-X              fBodyAccJerk-energy()-Y              fBodyAccJerk-energy()-Z             
[364] fBodyAccJerk-iqr()-X                 fBodyAccJerk-iqr()-Y                 fBodyAccJerk-iqr()-Z                
[367] fBodyAccJerk-entropy()-X             fBodyAccJerk-entropy()-Y             fBodyAccJerk-entropy()-Z            
[370] fBodyAccJerk-maxInds-X               fBodyAccJerk-maxInds-Y               fBodyAccJerk-maxInds-Z              
[373] fBodyAccJerk-meanFreq()-X            fBodyAccJerk-meanFreq()-Y            fBodyAccJerk-meanFreq()-Z           
[376] fBodyAccJerk-skewness()-X            fBodyAccJerk-kurtosis()-X            fBodyAccJerk-skewness()-Y           
[379] fBodyAccJerk-kurtosis()-Y            fBodyAccJerk-skewness()-Z            fBodyAccJerk-kurtosis()-Z           
[382] fBodyAccJerk-bandsEnergy()-1,8       fBodyAccJerk-bandsEnergy()-9,16      fBodyAccJerk-bandsEnergy()-17,24    
[385] fBodyAccJerk-bandsEnergy()-25,32     fBodyAccJerk-bandsEnergy()-33,40     fBodyAccJerk-bandsEnergy()-41,48    
[388] fBodyAccJerk-bandsEnergy()-49,56     fBodyAccJerk-bandsEnergy()-57,64     fBodyAccJerk-bandsEnergy()-1,16     
[391] fBodyAccJerk-bandsEnergy()-17,32     fBodyAccJerk-bandsEnergy()-33,48     fBodyAccJerk-bandsEnergy()-49,64    
[394] fBodyAccJerk-bandsEnergy()-1,24      fBodyAccJerk-bandsEnergy()-25,48     fBodyAccJerk-bandsEnergy()-1,8      
[397] fBodyAccJerk-bandsEnergy()-9,16      fBodyAccJerk-bandsEnergy()-17,24     fBodyAccJerk-bandsEnergy()-25,32    
[400] fBodyAccJerk-bandsEnergy()-33,40     fBodyAccJerk-bandsEnergy()-41,48     fBodyAccJerk-bandsEnergy()-49,56    
[403] fBodyAccJerk-bandsEnergy()-57,64     fBodyAccJerk-bandsEnergy()-1,16      fBodyAccJerk-bandsEnergy()-17,32    
[406] fBodyAccJerk-bandsEnergy()-33,48     fBodyAccJerk-bandsEnergy()-49,64     fBodyAccJerk-bandsEnergy()-1,24     
[409] fBodyAccJerk-bandsEnergy()-25,48     fBodyAccJerk-bandsEnergy()-1,8       fBodyAccJerk-bandsEnergy()-9,16     
[412] fBodyAccJerk-bandsEnergy()-17,24     fBodyAccJerk-bandsEnergy()-25,32     fBodyAccJerk-bandsEnergy()-33,40    
[415] fBodyAccJerk-bandsEnergy()-41,48     fBodyAccJerk-bandsEnergy()-49,56     fBodyAccJerk-bandsEnergy()-57,64    
[418] fBodyAccJerk-bandsEnergy()-1,16      fBodyAccJerk-bandsEnergy()-17,32     fBodyAccJerk-bandsEnergy()-33,48    
[421] fBodyAccJerk-bandsEnergy()-49,64     fBodyAccJerk-bandsEnergy()-1,24      fBodyAccJerk-bandsEnergy()-25,48    
[424] fBodyGyro-mean()-X                   fBodyGyro-mean()-Y                   fBodyGyro-mean()-Z                  
[427] fBodyGyro-std()-X                    fBodyGyro-std()-Y                    fBodyGyro-std()-Z                   
[430] fBodyGyro-mad()-X                    fBodyGyro-mad()-Y                    fBodyGyro-mad()-Z                   
[433] fBodyGyro-max()-X                    fBodyGyro-max()-Y                    fBodyGyro-max()-Z                   
[436] fBodyGyro-min()-X                    fBodyGyro-min()-Y                    fBodyGyro-min()-Z                   
[439] fBodyGyro-sma()                      fBodyGyro-energy()-X                 fBodyGyro-energy()-Y                
[442] fBodyGyro-energy()-Z                 fBodyGyro-iqr()-X                    fBodyGyro-iqr()-Y                   
[445] fBodyGyro-iqr()-Z                    fBodyGyro-entropy()-X                fBodyGyro-entropy()-Y               
[448] fBodyGyro-entropy()-Z                fBodyGyro-maxInds-X                  fBodyGyro-maxInds-Y                 
[451] fBodyGyro-maxInds-Z                  fBodyGyro-meanFreq()-X               fBodyGyro-meanFreq()-Y              
[454] fBodyGyro-meanFreq()-Z               fBodyGyro-skewness()-X               fBodyGyro-kurtosis()-X              
[457] fBodyGyro-skewness()-Y               fBodyGyro-kurtosis()-Y               fBodyGyro-skewness()-Z              
[460] fBodyGyro-kurtosis()-Z               fBodyGyro-bandsEnergy()-1,8          fBodyGyro-bandsEnergy()-9,16        
[463] fBodyGyro-bandsEnergy()-17,24        fBodyGyro-bandsEnergy()-25,32        fBodyGyro-bandsEnergy()-33,40       
[466] fBodyGyro-bandsEnergy()-41,48        fBodyGyro-bandsEnergy()-49,56        fBodyGyro-bandsEnergy()-57,64       
[469] fBodyGyro-bandsEnergy()-1,16         fBodyGyro-bandsEnergy()-17,32        fBodyGyro-bandsEnergy()-33,48       
[472] fBodyGyro-bandsEnergy()-49,64        fBodyGyro-bandsEnergy()-1,24         fBodyGyro-bandsEnergy()-25,48       
[475] fBodyGyro-bandsEnergy()-1,8          fBodyGyro-bandsEnergy()-9,16         fBodyGyro-bandsEnergy()-17,24       
[478] fBodyGyro-bandsEnergy()-25,32        fBodyGyro-bandsEnergy()-33,40        fBodyGyro-bandsEnergy()-41,48       
[481] fBodyGyro-bandsEnergy()-49,56        fBodyGyro-bandsEnergy()-57,64        fBodyGyro-bandsEnergy()-1,16        
[484] fBodyGyro-bandsEnergy()-17,32        fBodyGyro-bandsEnergy()-33,48        fBodyGyro-bandsEnergy()-49,64       
[487] fBodyGyro-bandsEnergy()-1,24         fBodyGyro-bandsEnergy()-25,48        fBodyGyro-bandsEnergy()-1,8         
[490] fBodyGyro-bandsEnergy()-9,16         fBodyGyro-bandsEnergy()-17,24        fBodyGyro-bandsEnergy()-25,32       
[493] fBodyGyro-bandsEnergy()-33,40        fBodyGyro-bandsEnergy()-41,48        fBodyGyro-bandsEnergy()-49,56       
[496] fBodyGyro-bandsEnergy()-57,64        fBodyGyro-bandsEnergy()-1,16         fBodyGyro-bandsEnergy()-17,32       
[499] fBodyGyro-bandsEnergy()-33,48        fBodyGyro-bandsEnergy()-49,64        fBodyGyro-bandsEnergy()-1,24        
[502] fBodyGyro-bandsEnergy()-25,48        fBodyAccMag-mean()                   fBodyAccMag-std()                   
[505] fBodyAccMag-mad()                    fBodyAccMag-max()                    fBodyAccMag-min()                   
[508] fBodyAccMag-sma()                    fBodyAccMag-energy()                 fBodyAccMag-iqr()                   
[511] fBodyAccMag-entropy()                fBodyAccMag-maxInds                  fBodyAccMag-meanFreq()              
[514] fBodyAccMag-skewness()               fBodyAccMag-kurtosis()               fBodyBodyAccJerkMag-mean()          
[517] fBodyBodyAccJerkMag-std()            fBodyBodyAccJerkMag-mad()            fBodyBodyAccJerkMag-max()           
[520] fBodyBodyAccJerkMag-min()            fBodyBodyAccJerkMag-sma()            fBodyBodyAccJerkMag-energy()        
[523] fBodyBodyAccJerkMag-iqr()            fBodyBodyAccJerkMag-entropy()        fBodyBodyAccJerkMag-maxInds         
[526] fBodyBodyAccJerkMag-meanFreq()       fBodyBodyAccJerkMag-skewness()       fBodyBodyAccJerkMag-kurtosis()      
[529] fBodyBodyGyroMag-mean()              fBodyBodyGyroMag-std()               fBodyBodyGyroMag-mad()              
[532] fBodyBodyGyroMag-max()               fBodyBodyGyroMag-min()               fBodyBodyGyroMag-sma()              
[535] fBodyBodyGyroMag-energy()            fBodyBodyGyroMag-iqr()               fBodyBodyGyroMag-entropy()          
[538] fBodyBodyGyroMag-maxInds             fBodyBodyGyroMag-meanFreq()          fBodyBodyGyroMag-skewness()         
[541] fBodyBodyGyroMag-kurtosis()          fBodyBodyGyroJerkMag-mean()          fBodyBodyGyroJerkMag-std()          
[544] fBodyBodyGyroJerkMag-mad()           fBodyBodyGyroJerkMag-max()           fBodyBodyGyroJerkMag-min()          
[547] fBodyBodyGyroJerkMag-sma()           fBodyBodyGyroJerkMag-energy()        fBodyBodyGyroJerkMag-iqr()          
[550] fBodyBodyGyroJerkMag-entropy()       fBodyBodyGyroJerkMag-maxInds         fBodyBodyGyroJerkMag-meanFreq()     
[553] fBodyBodyGyroJerkMag-skewness()      fBodyBodyGyroJerkMag-kurtosis()      angle(tBodyAccMean,gravity)         
[556] angle(tBodyAccJerkMean),gravityMean) angle(tBodyGyroMean,gravityMean)     angle(tBodyGyroJerkMean,gravityMean)
[559] angle(X,gravityMean)                 angle(Y,gravityMean)                 angle(Z,gravityMean)



> ####2.2.1.2.2.Filter data by columns names that only contains "mean" and "std",
> 
> from Data Frame | Filter                                      | to Data Frame  | Data Frame dimension [rows x columns]
> --------------- | ------------------------------------------- | -------------- | -------------------------------------
> dataX           | columns names that contains "mean" or "std" | dataXOptimized | 2947 x 79
>
> 
> Note: It's possible to quit "meanFreq", but I consider it as a "mean"

> Columns names that contains "mean" or "std"
> 
>[1] "tBodyAcc.mean...X"               "tBodyAcc.mean...Y"               "tBodyAcc.mean...Z"              
 [4] "tBodyAcc.std...X"                "tBodyAcc.std...Y"                "tBodyAcc.std...Z"               
 [7] "tGravityAcc.mean...X"            "tGravityAcc.mean...Y"            "tGravityAcc.mean...Z"           
[10] "tGravityAcc.std...X"             "tGravityAcc.std...Y"             "tGravityAcc.std...Z"            
[13] "tBodyAccJerk.mean...X"           "tBodyAccJerk.mean...Y"           "tBodyAccJerk.mean...Z"          
[16] "tBodyAccJerk.std...X"            "tBodyAccJerk.std...Y"            "tBodyAccJerk.std...Z"           
[19] "tBodyGyro.mean...X"              "tBodyGyro.mean...Y"              "tBodyGyro.mean...Z"             
[22] "tBodyGyro.std...X"               "tBodyGyro.std...Y"               "tBodyGyro.std...Z"              
[25] "tBodyGyroJerk.mean...X"          "tBodyGyroJerk.mean...Y"          "tBodyGyroJerk.mean...Z"         
[28] "tBodyGyroJerk.std...X"           "tBodyGyroJerk.std...Y"           "tBodyGyroJerk.std...Z"          
[31] "tBodyAccMag.mean.."              "tBodyAccMag.std.."               "tGravityAccMag.mean.."          
[34] "tGravityAccMag.std.."            "tBodyAccJerkMag.mean.."          "tBodyAccJerkMag.std.."          
[37] "tBodyGyroMag.mean.."             "tBodyGyroMag.std.."              "tBodyGyroJerkMag.mean.."        
[40] "tBodyGyroJerkMag.std.."          "fBodyAcc.mean...X"               "fBodyAcc.mean...Y"              
[43] "fBodyAcc.mean...Z"               "fBodyAcc.std...X"                "fBodyAcc.std...Y"               
[46] "fBodyAcc.std...Z"                "fBodyAcc.meanFreq...X"           "fBodyAcc.meanFreq...Y"          
[49] "fBodyAcc.meanFreq...Z"           "fBodyAccJerk.mean...X"           "fBodyAccJerk.mean...Y"          
[52] "fBodyAccJerk.mean...Z"           "fBodyAccJerk.std...X"            "fBodyAccJerk.std...Y"           
[55] "fBodyAccJerk.std...Z"            "fBodyAccJerk.meanFreq...X"       "fBodyAccJerk.meanFreq...Y"      
[58] "fBodyAccJerk.meanFreq...Z"       "fBodyGyro.mean...X"              "fBodyGyro.mean...Y"             
[61] "fBodyGyro.mean...Z"              "fBodyGyro.std...X"               "fBodyGyro.std...Y"              
[64] "fBodyGyro.std...Z"               "fBodyGyro.meanFreq...X"          "fBodyGyro.meanFreq...Y"         
[67] "fBodyGyro.meanFreq...Z"          "fBodyAccMag.mean.."              "fBodyAccMag.std.."              
[70] "fBodyAccMag.meanFreq.."          "fBodyBodyAccJerkMag.mean.."      "fBodyBodyAccJerkMag.std.."      
[73] "fBodyBodyAccJerkMag.meanFreq.."  "fBodyBodyGyroMag.mean.."         "fBodyBodyGyroMag.std.."         
[76] "fBodyBodyGyroMag.meanFreq.."     "fBodyBodyGyroJerkMag.mean.."     "fBodyBodyGyroJerkMag.std.."     
[79] "fBodyBodyGyroJerkMag.meanFreq.."




> ####2.2.1.2.3.Merges activity Id with his activity name
>
> from Data Frame A | Data Frame A ID | from Data Frame B | Data Frame B ID | to Data Frame  | Data Frame dimension [rows x columns] | Header
> ----------------- | --------------- | ----------------- | --------------- | -------------- | ------------------------------------- | ---------------------------
> dataY             | Id_Activity     | activity_labels   | Id              | dataYCompleted | 2947 x 2                              | Id_Activity, Activity_Label
>
> INNER JOIN between dataY.Id_Activity = activity_labels.Id
        
> ####2.2.1.2.4.Merges together the three datasets = X + y + subject
> 
> form Data Frame A | from Data Frame B | from Data Frame C | to Data Frame | Data Frame dimension [rows x columns] | Header
> ----------------- | ----------------- | ----------------- | ------------- | ------------------------------------- | ------
> dataXOptimized    | dataYCompleted    | dataSub           | data          | 2947 x 82                             | 
>
> Header of Data Frame data: Header from dataOptimizer + Header from dataYcompleted ("Id_Activity", "Activity_Label") + Header from dataSub ("Subject")
>
> This merge add columns but keeps rows (cbind)

        
> ####2.2.1.2.5.Return the complete data sets
>
> data

> ####2.2.2.Get data from Train
> 
> ####2.2.2.1.Set path for Train files and final part of file names 
> 
> variable | value stored
> -------- | ----------------------
> trainPath | "/UCI HAR Dataset/train/""
> extTrain  | "_train.txt""
 
> ####2.2.2.2.Call function getDataSet() to extract Train data from files to Data Frame dataTrain
        
> dataTrain <- getDataSet(trainPath, extTrain)

> ####2.2.2.2.1.Obtains data from files and sets the column names
>
> from File                               | to Data Frame | Data Frame dimension [rows x columns] | Data Frame Columns names
> --------------------------------------- | ------------- | ------------------------------------- | ------------------------
> /UCI HAR Dataset/test/X_train.txt       | dataX         | 7352 x 561                            | features$Feature_Label
> /UCI HAR Dataset/test/y_train.txt       | dataY         | 7352 x 1                              | "Id_Activity"
> /UCI HAR Dataset/test/subject_train.txt | dataSub       | 7352 x 1                              | "Subject"

> Values of features$Feature_Label (Same that in 2.2.1.2.1)


> ####2.2.2.2.2.Filter data by columns names that only contains "mean" and "std",
> 
> from Data Frame | Filter                                      | to Data Frame  | Data Frame dimension [rows x columns]
> --------------- | ------------------------------------------- | -------------- | -------------------------------------
> dataX           | columns names that contains "mean" or "std" | dataXOptimized | 7352 x 79
>
> 
> Note: It's possible to quit "meanFreq", but I consider it as a "mean"

> Columns names that contains "mean" or "std" (Same that in 2.2.1.2.2)

> ####2.2.2.2.3.Merges activity Id with his activity name
>
> from Data Frame A | Data Frame A ID | from Data Frame B | Data Frame B ID | to Data Frame  | Data Frame dimension [rows x columns] | Header
> ----------------- | --------------- | ----------------- | --------------- | -------------- | ------------------------------------- | ---------------------------
> dataY             | Id_Activity     | activity_labels   | Id              | dataYCompleted | 7352 x 2                              | Id_Activity, Activity_Label
>
> INNER JOIN between dataY.Id_Activity = activity_labels.Id
        
> ####2.2.2.2.4.Merges together the three datasets = X + y + subject
> 
> form Data Frame A | from Data Frame B | from Data Frame C | to Data Frame | Data Frame dimension [rows x columns] | Header
> ----------------- | ----------------- | ----------------- | ------------- | ------------------------------------- | ------
> dataXOptimized    | dataYCompleted    | dataSub           | data          | 7352 x 82                             | 
>
> Header of Data Frame data: Header from dataOptimizer + Header from dataYcompleted ("Id_Activity", "Activity_Label") + Header from dataSub ("Subject")
>
> This merge add columns but keeps rows (cbind)

        
> ####2.2.2.2.5.Return the complete data sets
>
> data

> ####2.3.Merges together the datasets = dataTest + dataTrain
> 
> form Data Frame A | from Data Frame B | to Data Frame | Data Frame dimension [rows x columns] | Header
> ----------------- | ----------------- | ------------- | ------------------------------------- | ------
> dataTest          | dataTrain         | dataComplete  | 10299 x 82                            | 
>
> Header of Data Frame dataComplete: Same header as dataTest and dataTrain (See Header description in 2.2.1.2.4 or 2.2.2.2.4)
>
> This merge add rows but keeps columns (rbind)

> ####2.4.Returns Data Frame dataComplete

***

####3.Call to function getDataSetAverage() and store result in dataAverage
####-> Obtains Data set of averages per value grouped by Subject and Activity from dataComplete

> ####3.1.Obtains the mean for each column from 1 to 79, group by Subject and Activity_label
>
> from Data Frame | column group1 | column group2  | column values                                         | function to apply each column | to Data Frame | Data Frame dimension [rows x columns]
> --------------- | ------------- | -------------- | ----------------------------------------------------- | ----------------------------- | ------------- | --------------------------------
> dataComplete    | Subject       | Activity_Label | "tBodyAcc.mean...X":"fBodyBodyGyroJerkMag.meanFreq.." | mean                          | data          | 40 x 81
>
>
> ####3.2.Rename column names of data
> 
> Data Frame | Old column name | New column name
> ---------- | --------------- | ---------------
> data       | Group.1         | Subject
> data       | Group.2         | Activity        
>
>
> ####3.3.Order data by Subject and Activity
>
> from Data Frame | Order by          | to Data Frame
> --------------- | ----------------- | -------------
> data            | Subject, Activity | data
>
>
> ####3.4Return data

***

####4. Call to function saveDataToFile() -> save set to a file

> Save the data into a file
>
> from Data Frame | to File
> --------------- | -------
> dataToSave      | "tidyData.txt"
