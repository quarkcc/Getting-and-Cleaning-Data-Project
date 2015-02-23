library (plyr)
library (dplyr)

# 1- Merges the training and the test sets to create one data set

# x file contains data
# y file contains labels

# Test folder
data_test <- read.table("test/X_test.txt")
label_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Train folder
data_train <- read.table("train/X_train.txt")
label_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")


# merge x sets
data_info <- rbind(x_train, x_test)

# merge y sets
label_info <- rbind(y_train, y_test)

# merge subject sets
subject_info <- rbind(subject_train, subject_test)

# 2- Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("features.txt")

mean_std <- grep("-(mean|std)\\(\\)", features[, 2])

data_info <- data_info[, mean_std]

names(data_info) <- features[mean_std, 2]

# 3 - Use descriptive activity names to name the activities in the data set
activities_labels <- read.table("activity_labels.txt")

# update labels with the correct name
label_info[, 1] <- activities_labels[label_info[, 1], 2]

names(label_info) <- "ACTIVITY"

# 4- Appropriately label the data set with descriptive variable names


names(subject_info) <- "SUBJECT"

# Union of all data sets (data, labels and subject) with appropiate col names
all_info <- cbind(data_info, label_info, subject_info)

# 5- Create a second, independent tidy data set with the average of each variable for each activity and each subject

averages_set <- ddply(all_info, .(SUBJECT, ACTIVITY), function(x) colMeans(x[, 1:66]))

write.table(averages_set, "averages_set.txt", row.name=FALSE)



