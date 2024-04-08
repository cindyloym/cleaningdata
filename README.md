# Getting and Cleaning Data - Course Project

This is a course project for the Getting and Cleaning Data Coursera course.
The R script, `run_analysis.R`, does the following:

1. Import a library for statistical functions
2. Load the activity labels and feature info
3. Extract the desired features
4. Load both the training and test datasets, filtered those columns which
   reflect a mean or standard deviation
5. Load the activity and subject data, and merge those columns with the 
   dataset
6. Merges the two datasets
7. Convert the `Activity` and `Subject` columns into factors
8. Create a tidy dataset that consists of the average value of each variable
   for each subject and activity pair.

Output result is in `tidy.txt`.
