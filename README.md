Gettingandcleaningdata
======================

run_analysis.r
==============


This R script does the following:
-merges the X test, SubjectTest and Y test data together
-merges the X train, SubjectTrain and T train data together
-merges the train and test composite datasets together.

For activities, numbers are replaced with the name of the activity as per activity_labels.txt.

Columns 1 is renamed 'Subject', column 2 is renamed 'Activity' and columns 3-563 are renamed according to the vairables listed in features.txt.

The script then produces a new tidy dataset, 'Tidy_data_set.txt', that contains the mean of columns 3-563, by subject and activity. 

