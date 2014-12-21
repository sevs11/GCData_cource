# load data
trainData<-read.table("./train/X_train.txt")
testData<-read.table("./test/X_test.txt")
trainDataAct<-read.table("./train/subject_train.txt",col.names=c("subjectN"))
testDataAct<-read.table("./test/subject_test.txt",col.names=c("subjectN"))
trainDataY<-read.table("./train/Y_train.txt",col.names=c("ActNum"))
testDataY<-read.table("./test/Y_test.txt",col.names=c("ActNum"))
infoData<-read.table("features.txt")
# step 1 - merge
mergData<-rbind(trainData,testData)
mergDataAct<-rbind(trainDataAct,testDataAct)
mergDataY<-rbind(trainDataY,testDataY)
# step 2 - select only mean or std fields
meanStdFieldsNum<-grep("mean|std", infoData[,2],ignore.case = TRUE)
subMergData<-mergData[,meanStdFieldsNum]
subInfoData<-infoData[meanStdFieldsNum,]
# step 3 - load activities data
actLabels<-read.table("activity_labels.txt",col.names=c("ActNum","Activity"))
# step 3 - merge activities names with data
subMergData<-cbind(mergDataY,subMergData,mergDataAct)
subMergData<-merge(subMergData,actLabels,by.x='ActNum',by.y='ActNum',all=TRUE)
# del activities num column
subMergData<-subMergData[,2:89]
# step 4 - name data columns
names(subMergData)[1:86]<-as.vector(subInfoData$V2)
# step 5 - tidy data set creating
avgData<-aggregate(subMergData[,1:86],list(subMergData$subjectN,subMergData$Activity),mean)
names(avgData)[1:2]<-c("subjectN","Activity")
# save file
write.table(avgData,file="resData.txt",row.name=FALSE)
