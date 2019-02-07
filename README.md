# Getting and Cleaning Data Course Project

This repository hosts the R code and documentation files that are needed for the Data Science's track course - "Getting and Cleaning data"
as part of final assignment for Week4

## The Following are the files posted to run the project:

1. `CodeBook.md` which describes the following activities :
(a). how to use the inputs given to complete the project.
(b). variables used in the code.
(c). the data used for which the code is written.
(d). any such transformations or work that was performed to clean up the data thereof.

2. The Rscript submitted for the project, `run_analysis.R` contains all the code to perform the analyses described in the 5 steps as per the instructions given in the assignment. They can be launched by importing the file in RStudio and running the code with the run button found in the right hand titlebar of the Rscript console.

3. The output of the 5th step which is called `calculated_tidy_data.txt` and has been uploaded in the course project's form.

Instructions

1. Checkout the code using the CodeBook.md submitted in the repository

2. Download the data set, https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

3. Unzip the dataset into your working directory and ensure that you are able to see a folder named UCI HAR Dataset in your working directory

4. Load RStudio and set the work directory to your working directory using setwd("your work directory")

5. Load the R script using source("runanalysis.txt")

6. Run the R script using runanalysis() and after executing the function, you will see that merged_tidy_data.txt and calculated_tidy_data.txt would have been replaced with the newest outputs.

Note : The dependancy here is that the R script assumes you have 'data.table' installed using install.packages("data.table")
 Please refer to http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones for additional information on the data set
