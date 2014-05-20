## Set working directory - should be customized for each user
dir <- readline(prompt="Copy and paste working directory string from windows tree with original slashes:  ")
dir <- gsub('\\\\', "/", dir)   # reverse slashes
setwd(dir)                      # set working directory
rm(dir)

## Download data set, establish download date and license information
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile="projectData.zip")      # Save zip file 
rm(fileurl)                                             # cleanup
dateDownloaded<<-as.POSIXlt(Sys.time())    # standard date format
dateDownloaded
# "2014-05-18 15:32:36 EDT"
License<<-"License: Use of this dataset in publications must be acknowledged by referencing the following publication: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.  Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012."
#License:
#Use of this dataset in publications must be acknowledged by referencing the following publication [1] 
#[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
#This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
#Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

## Unzip files to directory
unzip("projectData.zip")   # creates new subdirectory called UCI HAR Dataset
setwd("./UCI HAR Dataset")      # drop down to new directory

## Load two data files and verify dimensions
trainData<-read.table("./train/X_train.txt",sep="")     # load training data
trainDataDim<-dim(trainData)                            # save dimensions
testData<-read.table("./test/X_test.txt",sep="")        # load test data
testDataDim<-dim(testData)                              # save dimensions
testDims<-vector(mode="logical",length=3)               # create logical vector of three falses
testDims[1]<-trainDataDim[2]==561                       # test correct length of training data
testDims[2]<-testDataDim[2]==561                        # test correct length of test data
testDims[3]<-trainDataDim[1]+testDataDim[1]==10299      # test total rows
if(!sum(testDims[1:3])==3) {                            # if any of three fail test
        stop("Files are not the correct dimensions - processing stopped")
} else {print("Combining files...")                     # stop processing with error
        mergedData<-rbind(trainData,testData)           # otherwise merge two files into one
        rm(trainData)                                   # clean up
        rm(testData)
        rm(testDataDim)
        rm(testDims)
        rm(trainDataDim)
}      


## Add activity numbers
trainActivity <- read.table("./train/y_train.txt",sep="")       #load training activity numbers
testActivity <- read.table("./test/y_test.txt",sep="")          #load test activity numbers
mergedActivity<-rbind(trainActivity,testActivity)       # merge activity numbers
mergedData <- cbind(mergedActivity,mergedData)          # add activity numbers to dataset
rm(mergedActivity)                                      # clean up
rm(trainActivity)
rm(testActivity)

## Add subject numbers
trainSubject <- read.table("./train/subject_train.txt",sep="")  #load training subject numbers
testSubject <- read.table("./test/subject_test.txt",sep="")     #load test subject numbers
mergedSubject<-rbind(trainSubject,testSubject)                  #merge subject numbers
mergedData <- cbind(mergedSubject,mergedData)                   #add subject numbers to dataset
rm(mergedSubject)                                               #clean up
rm(trainSubject)
rm(testSubject)

## Add column labels
features<-read.table("features.txt",sep="",stringsAsFactors=FALSE)      #read column labels
cnames <- c("subjectNumber","activityNumber",(as.vector(features[,2]))) #build vector of labels
colnames(mergedData)<-cnames                                    #add labels to dataset
rm(cnames)                                                      #clean up
rm(features)

## Add in activity description                                  
labels<- read.table("activity_labels.txt")                      #read activity table
colnames(labels) <- c("activityNumber","Activity")              #add column labels to activity
mergedData <- (merge(labels,mergedData, by = "activityNumber")) #add activity names to dataset
rm(labels)                                                      #clean up

## Create item #2, a table with just means and standard deviations
tomatch<-c("mean+","std+")                                      #build regular expression list
meanStdCols<-grep(paste(tomatch,collapse="|"),colnames(mergedData),ignore.case=TRUE)
#ID cols with "mean" or "std"
dataFrame2 <- mergedData[,c(1,2,3,meanStdCols)]                 #extract columns identified above
write.table(dataFrame2,"meanSTD.txt",sep=",")                   #write to new data file
rm(tomatch)                                                     #clean up
rm(meanStdCols)

## Create item #5, a second data set with the means of each variable by subject/activity
# Assignment was unclear if the mean is for ALL variables or just the means and stds created above
# This execution assumes all variables in the original data set

splitAct <- mergedData$Activity                                 #load first factor string
splitSub <- as.factor(mergedData$subjectNumber)                 #load second factor
splitData<-split(mergedData,list(splitSub,splitAct), drop=TRUE) #split data based on two factors

meansBySubjectActivity <- sapply(splitData,function(mergedData) colMeans(mergedData[4:564]))
# calculate mean of all columns for two factors
meansBySubjectActivity <- t(meansBySubjectActivity)             #invert table to original config
# the inversion above restores subject number and activity to rows, all other measures to cols
concatNames <- rownames(meansBySubjectActivity) #new row names are concatentation of 2 factors
list <- strsplit(concatNames,"\\.")             # split back into two columns
library("plyr")                                 #load plyr
df <- ldply(list)                               #make into two dimension list
colnames(df) <- c("subjectNumber","Activity")   #add two column names
meansBySubjectActivity <- cbind(df,meansBySubjectActivity)      #add two columns with subject and activity
write.table(meansBySubjectActivity,"meansBySubjectActivity.txt",sep=",")
# save new file
rm(concatNames)                 #clean up
rm(list)
rm(df)
rm(splitAct)
rm(splitSub)
rm(splitData)

setwd("..")     #Move back up to original working directory

## END OF CODE