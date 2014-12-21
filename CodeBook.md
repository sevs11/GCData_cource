General dataset info:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Data transformation:

Training and test data merged to a single dataset. From all the sensors data selected only data concerning mean or std (standard deviation) information. Average value of each sensor data column for each activity and each subject is calculated.

There are 2 datasets are avuilable: table containing all the activities from base dataset (variable name: "subMergData") and average values table (variable name: "avgData", also avialable as a data file "resData.txt"). Those tables structures are very close.

Table structure of result tables:

1. "SubjectN" fiels -  volunteer code (the same as in general dataset)
2. "Activity" field - text field concerning one of six base activities (see general info).
3. All the other fields - sensors data from general dataset. All the column names were taken from original data. More information see in file "features_info.txt" of Samsung dataset directory.

How to get data:

Download original dataset. Download file "run_analysis.R" from this repository. Run this file in R worhspace. See more detailed instructions  in "readme.md" file.
