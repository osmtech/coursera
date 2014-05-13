Getting and Cleaning Data Course Project
========================================================

The script run_analysis.R works has inline comments. Here's high level overview:
Requirements
----------------

* analysis only uses X_test.txt, X_train.txt, subject_test.txt, subject_train.txt, features.txt,
* these files must be in the same (current) folder.

Details of implementation
----------------

* Feature names are cleaned of special characters and cast to something like *BodyBodyGyroJerkMagmeanFreq*
* **data.table** package is used to do the final computation (aggregate over all columns)
* output is saved to **output.csv** in the same folder

