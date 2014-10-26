runAnalysis <- function(){
    
    ## NOTE#1: this R script assumes that the Samsung data is in the
    ## working directory (i.e. no special directory positioning will be provided)
    ## Therefore we are assuming that the two sudirectories 'train' and 'test'
    ## with the actual observations are present.

    ## NOTE#2: this function requires that library "data.table" is installed
    
    
    ## Dataset reference:
    ## D. Anguita, A. Ghio, L. Oneto, X. Parra and J. Reyes-Ortiz.
    ## Human Activity Recognition on Smartphones using a Multiclass 
    ## Hardware-Friendly Support Vector Machine. in
    ## International Workshop of Ambient Assisted Living (IWAAL 2012)
    ## Vitoria-Gasteiz, Spain. Dec 2012
    

    
    
    ## ************************************************
    ## 1.Merge the training and the test sets to create one unified data set.
    
    ## 1.1-start by getting the training observations
    setwd("./train")
    
    
    ## get the columns to merge
    subject <- read.table("subject_train.txt")
    activity <- read.table("y_train.txt")
    features <- read.table("X_train.txt")
    
    ## merge columns into unified trainSet of observations 
    trainSet <- cbind(subject, activity, features)
    
    setwd("..")     ## return to project dir          
    
    ## 1.2-now, go and get the test observations
    setwd("./test")
    
    ## get the columns to merge
    subject <- read.table("subject_test.txt")
    activity <- read.table("y_test.txt")
    features <- read.table("X_test.txt")
    
    ## merge columns into unified testSet of observations 
    testSet <- cbind(subject, activity, features)
    setwd("..") ## return to project dir
    
    ## 1.3-finally merge the rows of the two datasets into one
    dataSet <- rbind(testSet,trainSet)
    
    ## ************************************************
    ## 2.Extract only the measurements on the mean and standard deviation
    ##   for each measurement. 
    ##
    ## Strategy:
    ##   In order to identify the mean and standard deviation fields,
    ##   we are going to extract the columns whose headers have either
    ##   the string 'mean()' or the string 'std()' on the name.
    ##   Those headers are on the './features.txt' file.
    
    ## read the headers file
    headers <- read.table("features.txt", colClasses = "character")
    #add labels to ease manipulation
    colnames(headers) <- c("nr","feature")
    
    ## extract the columns whose headers' names include 'mean' or 'std'
    ##   "+2" because we have added 2 fields (subject and activity)
    ##   to the original datafile
    mydataset <- dataSet[,c(1,2,grep("mean\\(\\)|std\\(\\)", headers$feature)+2)]
     
   
   ## ************************************************
   ## 3.Label the data set with descriptive variable names. 
   
   ## We shall use the original names from the "features.txt" file
   ## plus the initial two new fields, 'subject' and 'activity'
   
   mycolnames <- c("subject", "activity", headers[grep("mean\\(\\)|std\\(\\)", headers$feature),2])
   mycolnames <- tolower(mycolnames)
   mycolnames <- gsub("-","",mycolnames)
   mycolnames <- gsub("\\(","",mycolnames)
   mycolnames <- gsub("\\)","",mycolnames)
   
   colnames(mydataset) <- mycolnames
   
   
   
   ## ************************************************
   ## 4. Create a second, independent tidy data set with
   ## the average of each variable for each activity and each subject.
   ## Obs: this code requires library "data.table" installed.
   
   library(data.table)
   DT <- data.table(mydataset)
   
   DT[,lapply(.SD,mean), by=list(subject,activity)]
   
   ## NOTE: we used the wide (not the narrow) form of data tidiness
   ## because we think that the narrow form would violate the rule
   ## "Each variable forms a column"..
   ## ..by having multiple variables stored in one same column.
   
   ## the last operation (i.e. DT) will be returned
}
