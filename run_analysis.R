library(dplyr)

#Load activity labels and features
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

#Get the wanted features, i.e. mean and standard deviation
featuresWanted <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]

#Load training datasets
train <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresWanted[,1]]
trainActivities <- read.table("UCI HAR Dataset/train/y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

#Load test datasets
test <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresWanted[,1]]
testActivities <- read.table("UCI HAR Dataset/test/y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

#Merge training and test datasets
merged  <- rbind(train, test)

#Label the merged set
colnames(merged) <- c("Subject", "Activity", featuresWanted[,2])

merged$Activity <- factor(merged$Activity, levels = activityLabels[,1], labels = activityLabels[,2])
merged$subject <- as.factor(merged$Subject)

#Create tidy set with the average of each variable for each activity and each subject
data_mean <- merged %>% group_by(Activity, Subject) %>% summarize_all(mean)

write.table(data_mean, "tidy_set.txt", row.name=FALSE)
