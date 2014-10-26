GCDproject
==========


  #GOAL
  To generate a tidy data set with the average of each body movement variable for each activity (walking, running, etc.) for each individual subject collected from the accelerometers in a Samsung Galaxy S smartphone.
  A full description is available at the site where the data was obtained:
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  
  This the project assignement for the 'Getting and Cleaning Data' (GTD) course on Coursera (October 2014).
  

#NOTES
  
1: this R script assumes that the Samsung data is in the working directory (i.e. no special directory positioning will be provided). Therefore we are assuming that the two sudirectories 'train' and 'test' with the actual observations are present.

2: this function requires that library "data.table" is installed

3: The criteria to decide which are the mean and standard deviation fields, was straightforward: if the string 'mean()' or 'std()' are on the headers names of the original dataset (on the './features.txt' file) these are considered mean and standard deviation values.

4: The final dataset names were built by 'normalizing' the original names (no underscores, no hiphens, no parenthesis). Its nature is provided in the accompanying code book describing the variables.

5: We used a wide (not a narrow) form of data tidiness because we think that the narrow form would violate the rule "Each variable forms a column" by having multiple variables stored in one same column.
  
----------------------- 
 Dataset reference:
 D. Anguita, A. Ghio, L. Oneto, X. Parra and J. Reyes-Ortiz, Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. in International Workshop of Ambient Assisted Living (IWAAL 2012), Vitoria-Gasteiz, Spain. Dec 2012.
 
