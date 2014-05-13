# Merges the training and the test sets to create one data set.
#load test set and train set. Assume that the files are in local folder. Only "X" files are used.
# Inertial Signals folder is ignored
set_test <- read.table("X_test.txt")
set_train <- read.table("X_train.txt")
set_merge <- rbind(set_test,set_train)
## do the same for subjects
subjects <- rbind(read.table("subject_test.txt", "subject_train.txt"))


#Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("features.txt")
##which columns we are going to use, indexes
featuresToUse <- grep("mean|std", features$V2)
##refine names of columns, remove special chars, put them as BodyBodyGyroJerkMagmeanFreq 
##("mean" or "std" somewhere in the middle of the name#
namesToUse <- gsub("^f|-|\\(\\)","",features[featuresToUse,]$V2)
##extracting columns we need
use_ds <- set_merge[,featuresToUse]
## renaming columns
colnames(use_ds) = namesToUse
colnames(subjects)=c("subject")
use_ds = cbind(use_ds,subjects)
#Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
library(data.table)
dt = data.table(use_ds)
dtOut <- dt[, lapply(.SD,mean), by=subject]
write.csv(dtOut[order(dtOut$subject)],"output.csv")