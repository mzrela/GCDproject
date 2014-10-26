GCDproject
==========


  GOAL:
  To generate a tidy data set with the average of each body movement variable for each activity (walking, running, etc.) for each individual subject collected from the accelerometers in a Samsung Galaxy S smartphone.
  A full description is available at the site where the data was obtained:
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  
  This is the project assignement for the 'Getting and Cleaning Data' (GTD) course on Coursera (October 2014).
  
  The detailed step-by-step description on how the script works is in the script itself (run_analysys.R) and 
  replicated in the comments section below. Beware: the source code is the ultimate reference. 
  

#NOTES
  
1: the 'run_analysis' R script assumes that the Samsung data is in the working directory (i.e. no special directory positioning will be provided). Therefore we are assuming that the two sudirectories 'train' and 'test' with the actual observations are present.

2: this function requires that library "data.table" is installed

3: The criteria to decide which are the mean and standard deviation fields, was straightforward: if the string 'mean()' or 'std()' are on the headers names of the original dataset (on the './features.txt' file) these are considered mean and standard deviation values.

4: The final dataset names were built by 'normalizing' the original names (no underscores, no hiphens, no parenthesis). Its nature is provided in the accompanying code book describing the variables.

5: We used a wide (not a narrow) form of data tidiness because we think that the narrow form would violate the rule "Each variable forms a column" by having multiple variables stored in one same column.
  
----------------------- 
 Dataset reference:
 D. Anguita, A. Ghio, L. Oneto, X. Parra and J. Reyes-Ortiz, Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. in International Workshop of Ambient Assisted Living (IWAAL 2012), Vitoria-Gasteiz, Spain. Dec 2012.
 
 
#Step-by-step description 
 
 (comments extracted from the "run_analysis.R" script)
 
 
    ## 1.Merge the training and the test sets to create one unified data set.
    ## 1.1-start by getting the training observations
    ##   get the columns to merge
    ##   merge columns into unified trainSet of observations 
    ## 1.2-now, go and get the test observations
    ##   get the columns to merge
    ##   merge columns into unified testSet of observations 
    ## 1.3-finally merge the rows of the two datasets into one

    ## ************************************************
    ## 2.Extract only the measurements on the mean and standard deviation
    ##   for each measurement. 
    ##
    ## Strategy:
    ##   In order to identify the mean and standard deviation fields,
    ##   we are going to extract the columns whose headers have either
    ##   the string 'mean()' or the string 'std()' on the name.
    ##   Those headers are on the './features.txt' file.
    
    ##   read the headers file
    ##   add labels to ease manipulation
    ##   extract the columns whose headers' names include 'mean' or 'std'
    ##   "+2" because we have added 2 fields (subject and activity)
    ##   to the original datafile
    
    ## ************************************************
    ## 3.Label the data set with descriptive variable names. 
    ##   We shall use the original names from the "features.txt" file
    ##   plus the initial two new fields, 'subject' and 'activity'
    
    ## ************************************************
    ## 4. Create a second, independent tidy data set with
    ##   the average of each variable for each activity and each subject.
    ##   Obs: this code requires library "data.table" installed.
    ## NOTE: we used the wide (not the narrow) form of data tidiness
    ##   because we think that the narrow form would violate the rule
    ## "Each variable forms a column"..
    ## ..by having multiple variables stored in one same column.
    ## the last operation (i.e. DT) will be returned
