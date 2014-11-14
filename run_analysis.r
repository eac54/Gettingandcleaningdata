#Merging test data together
setwd("~/Downloads/UCI HAR Dataset/test")
xtest<-read.table("X_test.txt")
ytest<-read.table("y_test.txt")
colnames(ytest)<-c("Activity")
subjecttest<-read.table("subject_test.txt")
colnames(subjecttest)<-c("Subject")
testtotal <- cbind(subjecttest, ytest, xtest)

#Merging train data together
setwd("~/Downloads/UCI HAR Dataset/train")
xtrain<-read.table("X_train.txt")
ytrain<-read.table("y_train.txt")
colnames(ytrain)<-c("Activity")
subjecttrain<-read.table("subject_train.txt")
colnames(subjecttrain)<-c("Subject")
traintotal <- cbind(subjecttrain, ytrain, xtrain)

#Merging test and train data together
overalltotal<-rbind(testtotal, traintotal)


#Using descriptive activity names to name the activities in the data set
overalltotal$Activity[overalltotal$Activity==1] <- "Walking"
overalltotal$Activity[overalltotal$Activity==2] <- "Walking_upstairs"
overalltotal$Activity[overalltotal$Activity==3] <- "Walking_downstairs"
overalltotal$Activity[overalltotal$Activity==4] <- "Sitting"
overalltotal$Activity[overalltotal$Activity==5] <- "Standing"
overalltotal$Activity[overalltotal$Activity==6] <- "Laying"

#Labelling columns
setwd("~/Downloads/UCI HAR Dataset")
x <- scan("features.txt", what="", sep="\n")
colnames(overalltotal)<-c("Subject", "Activity", x)

#Creating new table with average values per subject, per activity
a<-aggregate(overalltotal[,3:563], list(Subject=overalltotal$Subject, Activity=overalltotal$Activity), mean)
write.table(a, "Tidy_data_set.txt", row.name=FALSE)
