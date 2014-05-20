# CodeBook for Getting and Cleaning Data Course Project
========================================================


## The Data

The source of the data is located at this url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  The data represents accelerometer data tracked across six different activities and 100 subjects.  The subjects were divided into a training group and a test group, and the resulting data is split between the two groups.

The file downloads as a .zip file.  Once unzipped it creates a new sub directory called UCI HAR Dataset, which in turn has two sub directories called TEST and TRAIN.  All files are gap delimited text files.  The primary measurement data is contained in two files contained in these sub directories: X_test.txt and X_train.txt.  Combined these two files provide 10,299 observations of 561 measured variables.  The observations are in rows and the variables are in columns.

The specific activity number for each observation is contained in two additional files, also split between the two sub directories: y_train.txt and y_test.txt.  

The subject numbers for the observations are similarly split between files subject_train.txt and subject_test.txt.

The variable names (columns labels) are in a file called features.txt in the main UCI HAR Dataset directory.

Lastly, the English descriptions of each activity are in a file called activity_labels.txt in the main UCI HAR Dataset directory.


## The Objective

The project has two output goals:

1. Create a clean (tidy) data set of all of the mean and standard deviation observations for all subjects.  This data set should be clearly labeled with English descriptions of the activity.

2. Create a summary data set that calculates the mean of ALL variables for each combination of subject and activity.

                                   
## The Tranformation Process

1. The two data sets were merged in order to maximize the observations available.  Merger required merging the subject and activity numbers as well as the primary data.

2. Subject and activity numbers were added to the data set as columns on the left.

3. Column labels were added from the features.txt file.

4. Activity descriptions were added using the activity number as a cross reference.

5. To create the first file, all variables that contained either the phrase "mean" or "std" 
        were extracted to a subset, maintaining all of the descriptive information.  
        It is written to a file called meanSTD.txt in the UCI HAR DATASET directory.
        
6. To create the second file, the mean of ALL variables is calculated using a combination of
        the functions "split" and "sapply" across the split table.  It is saved as a file named 
        meansBySubjectActivity.txt in the UCI HAR DATASET directory.


## The Variables


### Activities

|Number|Activity          |
|:----:|------------------|
|1     |WALKING           |
|2     |WALKING_UPSTAIRS  |
|3     |WALKING_DOWNSTAIRS|
|4     |SITTING           |
|5     |STANDING          |
|6     |LAYING            |



### The 561 measured variables with descriptions

|Number|Variable Name                       |Description                             |
|:----:|:-----------------------------------|:---------------------------------------|
|1     |tBodyAcc-mean()-X                   |Mean value                              |
|2     |tBodyAcc-mean()-Y                   |Mean value                              |
|3     |tBodyAcc-mean()-Z                   |Mean value                              |
|4     |tBodyAcc-std()-X                    |Standard deviation                      |
|5     |tBodyAcc-std()-Y                    |Standard deviation                      |
|6     |tBodyAcc-std()-Z                    |Standard deviation                      |
|7     |tBodyAcc-mad()-X                    |Median absolute deviation               |
|8     |tBodyAcc-mad()-Y                    |Median absolute deviation               |
|9     |tBodyAcc-mad()-Z                    |Median absolute deviation               |
|10    |tBodyAcc-max()-X                    |Largest value in array                  |
|11    |tBodyAcc-max()-Y                    |Largest value in array                  |
|12    |tBodyAcc-max()-Z                    |Largest value in array                  |
|13    |tBodyAcc-min()-X                    |Smallest value in array                 |
|14    |tBodyAcc-min()-Y                    |Smallest value in array                 |
|15    |tBodyAcc-min()-Z                    |Smallest value in array                 |
|16    |tBodyAcc-sma()                      |Signal magnitude area                   |
|17    |tBodyAcc-energy()-X                 |Sum of squares / number of values.      |
|18    |tBodyAcc-energy()-Y                 |Sum of squares / number of values.      |
|19    |tBodyAcc-energy()-Z                 |Sum of squares / number of values.      |
|20    |tBodyAcc-iqr()-X                    |Interquartile range                     |
|21    |tBodyAcc-iqr()-Y                    |Interquartile range                     |
|22    |tBodyAcc-iqr()-Z                    |Interquartile range                     |
|23    |tBodyAcc-entropy()-X                |Signal entropy                          |
|24    |tBodyAcc-entropy()-Y                |Signal entropy                          |
|25    |tBodyAcc-entropy()-Z                |Signal entropy                          |
|26    |tBodyAcc-arCoeff()-X,1              |Autorregresion coefficients             |
|27    |tBodyAcc-arCoeff()-X,2              |Autorregresion coefficients             |
|28    |tBodyAcc-arCoeff()-X,3              |Autorregresion coefficients             |
|29    |tBodyAcc-arCoeff()-X,4              |Autorregresion coefficients             |
|30    |tBodyAcc-arCoeff()-Y,1              |Autorregresion coefficients             |
|31    |tBodyAcc-arCoeff()-Y,2              |Autorregresion coefficients             |
|32    |tBodyAcc-arCoeff()-Y,3              |Autorregresion coefficients             |
|33    |tBodyAcc-arCoeff()-Y,4              |Autorregresion coefficients             |
|34    |tBodyAcc-arCoeff()-Z,1              |Autorregresion coefficients             |
|35    |tBodyAcc-arCoeff()-Z,2              |Autorregresion coefficients             |
|36    |tBodyAcc-arCoeff()-Z,3              |Autorregresion coefficients             |
|37    |tBodyAcc-arCoeff()-Z,4              |Autorregresion coefficients             |
|38    |tBodyAcc-correlation()-X,Y          |correlation coefficient of two signals  |
|39    |tBodyAcc-correlation()-X,Z          |correlation coefficient of two signals  |
|40    |tBodyAcc-correlation()-Y,Z          |correlation coefficient of two signals  |
|41    |tGravityAcc-mean()-X                |Mean value                              |
|42    |tGravityAcc-mean()-Y                |Mean value                              |
|43    |tGravityAcc-mean()-Z                |Mean value                              |
|44    |tGravityAcc-std()-X                 |Standard deviation                      |
|45    |tGravityAcc-std()-Y                 |Standard deviation                      |
|46    |tGravityAcc-std()-Z                 |Standard deviation                      |
|47    |tGravityAcc-mad()-X                 |Median absolute deviation               |
|48    |tGravityAcc-mad()-Y                 |Median absolute deviation               |
|49    |tGravityAcc-mad()-Z                 |Median absolute deviation               |
|50    |tGravityAcc-max()-X                 |Largest value in array                  |
|51    |tGravityAcc-max()-Y                 |Largest value in array                  |
|52    |tGravityAcc-max()-Z                 |Largest value in array                  |
|53    |tGravityAcc-min()-X                 |Smallest value in array                 |
|54    |tGravityAcc-min()-Y                 |Smallest value in array                 |
|55    |tGravityAcc-min()-Z                 |Smallest value in array                 |
|56    |tGravityAcc-sma()                   |Signal magnitude area                   |
|57    |tGravityAcc-energy()-X              |Sum of squares / number of values.      |
|58    |tGravityAcc-energy()-Y              |Sum of squares / number of values.      |
|59    |tGravityAcc-energy()-Z              |Sum of squares / number of values.      |
|60    |tGravityAcc-iqr()-X                 |Interquartile range                     |
|61    |tGravityAcc-iqr()-Y                 |Interquartile range                     |
|62    |tGravityAcc-iqr()-Z                 |Interquartile range                     |
|63    |tGravityAcc-entropy()-X             |Signal entropy                          |
|64    |tGravityAcc-entropy()-Y             |Signal entropy                          |
|65    |tGravityAcc-entropy()-Z             |Signal entropy                          |
|66    |tGravityAcc-arCoeff()-X,1           |Autorregresion coefficients             |
|67    |tGravityAcc-arCoeff()-X,2           |Autorregresion coefficients             |
|68    |tGravityAcc-arCoeff()-X,3           |Autorregresion coefficients             |
|69    |tGravityAcc-arCoeff()-X,4           |Autorregresion coefficients             |
|70    |tGravityAcc-arCoeff()-Y,1           |Autorregresion coefficients             |
|71    |tGravityAcc-arCoeff()-Y,2           |Autorregresion coefficients             |
|72    |tGravityAcc-arCoeff()-Y,3           |Autorregresion coefficients             |
|73    |tGravityAcc-arCoeff()-Y,4           |Autorregresion coefficients             |
|74    |tGravityAcc-arCoeff()-Z,1           |Autorregresion coefficients             |
|75    |tGravityAcc-arCoeff()-Z,2           |Autorregresion coefficients             |
|76    |tGravityAcc-arCoeff()-Z,3           |Autorregresion coefficients             |
|77    |tGravityAcc-arCoeff()-Z,4           |Autorregresion coefficients             |
|78    |tGravityAcc-correlation()-X,Y       |correlation coefficient of two signals  |
|79    |tGravityAcc-correlation()-X,Z       |correlation coefficient of two signals  |
|80    |tGravityAcc-correlation()-Y,Z       |correlation coefficient of two signals  |
|81    |tBodyAccJerk-mean()-X               |Mean value                              |
|82    |tBodyAccJerk-mean()-Y               |Mean value                              |
|83    |tBodyAccJerk-mean()-Z               |Mean value                              |
|84    |tBodyAccJerk-std()-X                |Standard deviation                      |
|85    |tBodyAccJerk-std()-Y                |Standard deviation                      |
|86    |tBodyAccJerk-std()-Z                |Standard deviation                      |
|87    |tBodyAccJerk-mad()-X                |Median absolute deviation               |
|88    |tBodyAccJerk-mad()-Y                |Median absolute deviation               |
|89    |tBodyAccJerk-mad()-Z                |Median absolute deviation               |
|90    |tBodyAccJerk-max()-X                |Largest value in array                  |
|91    |tBodyAccJerk-max()-Y                |Largest value in array                  |
|92    |tBodyAccJerk-max()-Z                |Largest value in array                  |
|93    |tBodyAccJerk-min()-X                |Smallest value in array                 |
|94    |tBodyAccJerk-min()-Y                |Smallest value in array                 |
|95    |tBodyAccJerk-min()-Z                |Smallest value in array                 |
|96    |tBodyAccJerk-sma()                  |Signal magnitude area                   |
|97    |tBodyAccJerk-energy()-X             |Sum of squares / number of values.      |
|98    |tBodyAccJerk-energy()-Y             |Sum of squares / number of values.      |
|99    |tBodyAccJerk-energy()-Z             |Sum of squares / number of values.      |
|100   |tBodyAccJerk-iqr()-X                |Interquartile range                     |
|101   |tBodyAccJerk-iqr()-Y                |Interquartile range                     |
|102   |tBodyAccJerk-iqr()-Z                |Interquartile range                     |
|103   |tBodyAccJerk-entropy()-X            |Signal entropy                          |
|104   |tBodyAccJerk-entropy()-Y            |Signal entropy                          |
|105   |tBodyAccJerk-entropy()-Z            |Signal entropy                          |
|106   |tBodyAccJerk-arCoeff()-X,1          |Autorregresion coefficients             |
|107   |tBodyAccJerk-arCoeff()-X,2          |Autorregresion coefficients             |
|108   |tBodyAccJerk-arCoeff()-X,3          |Autorregresion coefficients             |
|109   |tBodyAccJerk-arCoeff()-X,4          |Autorregresion coefficients             |
|110   |tBodyAccJerk-arCoeff()-Y,1          |Autorregresion coefficients             |
|111   |tBodyAccJerk-arCoeff()-Y,2          |Autorregresion coefficients             |
|112   |tBodyAccJerk-arCoeff()-Y,3          |Autorregresion coefficients             |
|113   |tBodyAccJerk-arCoeff()-Y,4          |Autorregresion coefficients             |
|114   |tBodyAccJerk-arCoeff()-Z,1          |Autorregresion coefficients             |
|115   |tBodyAccJerk-arCoeff()-Z,2          |Autorregresion coefficients             |
|116   |tBodyAccJerk-arCoeff()-Z,3          |Autorregresion coefficients             |
|117   |tBodyAccJerk-arCoeff()-Z,4          |Autorregresion coefficients             |
|118   |tBodyAccJerk-correlation()-X,Y      |correlation coefficient of two signals  |
|119   |tBodyAccJerk-correlation()-X,Z      |correlation coefficient of two signals  |
|120   |tBodyAccJerk-correlation()-Y,Z      |correlation coefficient of two signals  |
|121   |tBodyGyro-mean()-X                  |Mean value                              |
|122   |tBodyGyro-mean()-Y                  |Mean value                              |
|123   |tBodyGyro-mean()-Z                  |Mean value                              |
|124   |tBodyGyro-std()-X                   |Standard deviation                      |
|125   |tBodyGyro-std()-Y                   |Standard deviation                      |
|126   |tBodyGyro-std()-Z                   |Standard deviation                      |
|127   |tBodyGyro-mad()-X                   |Median absolute deviation               |
|128   |tBodyGyro-mad()-Y                   |Median absolute deviation               |
|129   |tBodyGyro-mad()-Z                   |Median absolute deviation               |
|130   |tBodyGyro-max()-X                   |Largest value in array                  |
|131   |tBodyGyro-max()-Y                   |Largest value in array                  |
|132   |tBodyGyro-max()-Z                   |Largest value in array                  |
|133   |tBodyGyro-min()-X                   |Smallest value in array                 |
|134   |tBodyGyro-min()-Y                   |Smallest value in array                 |
|135   |tBodyGyro-min()-Z                   |Smallest value in array                 |
|136   |tBodyGyro-sma()                     |Signal magnitude area                   |
|137   |tBodyGyro-energy()-X                |Sum of squares / number of values.      |
|138   |tBodyGyro-energy()-Y                |Sum of squares / number of values.      |
|139   |tBodyGyro-energy()-Z                |Sum of squares / number of values.      |
|140   |tBodyGyro-iqr()-X                   |Interquartile range                     |
|141   |tBodyGyro-iqr()-Y                   |Interquartile range                     |
|142   |tBodyGyro-iqr()-Z                   |Interquartile range                     |
|143   |tBodyGyro-entropy()-X               |Signal entropy                          |
|144   |tBodyGyro-entropy()-Y               |Signal entropy                          |
|145   |tBodyGyro-entropy()-Z               |Signal entropy                          |
|146   |tBodyGyro-arCoeff()-X,1             |Autorregresion coefficients             |
|147   |tBodyGyro-arCoeff()-X,2             |Autorregresion coefficients             |
|148   |tBodyGyro-arCoeff()-X,3             |Autorregresion coefficients             |
|149   |tBodyGyro-arCoeff()-X,4             |Autorregresion coefficients             |
|150   |tBodyGyro-arCoeff()-Y,1             |Autorregresion coefficients             |
|151   |tBodyGyro-arCoeff()-Y,2             |Autorregresion coefficients             |
|152   |tBodyGyro-arCoeff()-Y,3             |Autorregresion coefficients             |
|153   |tBodyGyro-arCoeff()-Y,4             |Autorregresion coefficients             |
|154   |tBodyGyro-arCoeff()-Z,1             |Autorregresion coefficients             |
|155   |tBodyGyro-arCoeff()-Z,2             |Autorregresion coefficients             |
|156   |tBodyGyro-arCoeff()-Z,3             |Autorregresion coefficients             |
|157   |tBodyGyro-arCoeff()-Z,4             |Autorregresion coefficients             |
|158   |tBodyGyro-correlation()-X,Y         |correlation coefficient of two signals  |
|159   |tBodyGyro-correlation()-X,Z         |correlation coefficient of two signals  |
|160   |tBodyGyro-correlation()-Y,Z         |correlation coefficient of two signals  |
|161   |tBodyGyroJerk-mean()-X              |Mean value                              |
|162   |tBodyGyroJerk-mean()-Y              |Mean value                              |
|163   |tBodyGyroJerk-mean()-Z              |Mean value                              |
|164   |tBodyGyroJerk-std()-X               |Standard deviation                      |
|165   |tBodyGyroJerk-std()-Y               |Standard deviation                      |
|166   |tBodyGyroJerk-std()-Z               |Standard deviation                      |
|167   |tBodyGyroJerk-mad()-X               |Median absolute deviation               |
|168   |tBodyGyroJerk-mad()-Y               |Median absolute deviation               |
|169   |tBodyGyroJerk-mad()-Z               |Median absolute deviation               |
|170   |tBodyGyroJerk-max()-X               |Largest value in array                  |
|171   |tBodyGyroJerk-max()-Y               |Largest value in array                  |
|172   |tBodyGyroJerk-max()-Z               |Largest value in array                  |
|173   |tBodyGyroJerk-min()-X               |Smallest value in array                 |
|174   |tBodyGyroJerk-min()-Y               |Smallest value in array                 |
|175   |tBodyGyroJerk-min()-Z               |Smallest value in array                 |
|176   |tBodyGyroJerk-sma()                 |Signal magnitude area                   |
|177   |tBodyGyroJerk-energy()-X            |Sum of squares / number of values.      |
|178   |tBodyGyroJerk-energy()-Y            |Sum of squares / number of values.      |
|179   |tBodyGyroJerk-energy()-Z            |Sum of squares / number of values.      |
|180   |tBodyGyroJerk-iqr()-X               |Interquartile range                     |
|181   |tBodyGyroJerk-iqr()-Y               |Interquartile range                     |
|182   |tBodyGyroJerk-iqr()-Z               |Interquartile range                     |
|183   |tBodyGyroJerk-entropy()-X           |Signal entropy                          |
|184   |tBodyGyroJerk-entropy()-Y           |Signal entropy                          |
|185   |tBodyGyroJerk-entropy()-Z           |Signal entropy                          |
|186   |tBodyGyroJerk-arCoeff()-X,1         |Autorregresion coefficients             |
|187   |tBodyGyroJerk-arCoeff()-X,2         |Autorregresion coefficients             |
|188   |tBodyGyroJerk-arCoeff()-X,3         |Autorregresion coefficients             |
|189   |tBodyGyroJerk-arCoeff()-X,4         |Autorregresion coefficients             |
|190   |tBodyGyroJerk-arCoeff()-Y,1         |Autorregresion coefficients             |
|191   |tBodyGyroJerk-arCoeff()-Y,2         |Autorregresion coefficients             |
|192   |tBodyGyroJerk-arCoeff()-Y,3         |Autorregresion coefficients             |
|193   |tBodyGyroJerk-arCoeff()-Y,4         |Autorregresion coefficients             |
|194   |tBodyGyroJerk-arCoeff()-Z,1         |Autorregresion coefficients             |
|195   |tBodyGyroJerk-arCoeff()-Z,2         |Autorregresion coefficients             |
|196   |tBodyGyroJerk-arCoeff()-Z,3         |Autorregresion coefficients             |
|197   |tBodyGyroJerk-arCoeff()-Z,4         |Autorregresion coefficients             |
|198   |tBodyGyroJerk-correlation()-X,Y     |correlation coefficient of two signals  |
|199   |tBodyGyroJerk-correlation()-X,Z     |correlation coefficient of two signals  |
|200   |tBodyGyroJerk-correlation()-Y,Z     |correlation coefficient of two signals  |
|201   |tBodyAccMag-mean()                  |Mean value                              |
|202   |tBodyAccMag-std()                   |Standard deviation                      |
|203   |tBodyAccMag-mad()                   |Median absolute deviation               |
|204   |tBodyAccMag-max()                   |Largest value in array                  |
|205   |tBodyAccMag-min()                   |Smallest value in array                 |
|206   |tBodyAccMag-sma()                   |Signal magnitude area                   |
|207   |tBodyAccMag-energy()                |Sum of squares / number of values.      |
|208   |tBodyAccMag-iqr()                   |Interquartile range                     |
|209   |tBodyAccMag-entropy()               |Signal entropy                          |
|210   |tBodyAccMag-arCoeff()1              |Autorregresion coefficients             |
|211   |tBodyAccMag-arCoeff()2              |Autorregresion coefficients             |
|212   |tBodyAccMag-arCoeff()3              |Autorregresion coefficients             |
|213   |tBodyAccMag-arCoeff()4              |Autorregresion coefficients             |
|214   |tGravityAccMag-mean()               |Mean value                              |
|215   |tGravityAccMag-std()                |Standard deviation                      |
|216   |tGravityAccMag-mad()                |Median absolute deviation               |
|217   |tGravityAccMag-max()                |Largest value in array                  |
|218   |tGravityAccMag-min()                |Smallest value in array                 |
|219   |tGravityAccMag-sma()                |Signal magnitude area                   |
|220   |tGravityAccMag-energy()             |Sum of squares / number of values.      |
|221   |tGravityAccMag-iqr()                |Interquartile range                     |
|222   |tGravityAccMag-entropy()            |Signal entropy                          |
|223   |tGravityAccMag-arCoeff()1           |Autorregresion coefficients             |
|224   |tGravityAccMag-arCoeff()2           |Autorregresion coefficients             |
|225   |tGravityAccMag-arCoeff()3           |Autorregresion coefficients             |
|226   |tGravityAccMag-arCoeff()4           |Autorregresion coefficients             |
|227   |tBodyAccJerkMag-mean()              |Mean value                              |
|228   |tBodyAccJerkMag-std()               |Standard deviation                      |
|229   |tBodyAccJerkMag-mad()               |Median absolute deviation               |
|230   |tBodyAccJerkMag-max()               |Largest value in array                  |
|231   |tBodyAccJerkMag-min()               |Smallest value in array                 |
|232   |tBodyAccJerkMag-sma()               |Signal magnitude area                   |
|233   |tBodyAccJerkMag-energy()            |Sum of squares / number of values.      |
|234   |tBodyAccJerkMag-iqr()               |Interquartile range                     |
|235   |tBodyAccJerkMag-entropy()           |Signal entropy                          |
|236   |tBodyAccJerkMag-arCoeff()1          |Autorregresion coefficients             |
|237   |tBodyAccJerkMag-arCoeff()2          |Autorregresion coefficients             |
|238   |tBodyAccJerkMag-arCoeff()3          |Autorregresion coefficients             |
|239   |tBodyAccJerkMag-arCoeff()4          |Autorregresion coefficients             |
|240   |tBodyGyroMag-mean()                 |Mean value                              |
|241   |tBodyGyroMag-std()                  |Standard deviation                      |
|242   |tBodyGyroMag-mad()                  |Median absolute deviation               |
|243   |tBodyGyroMag-max()                  |Largest value in array                  |
|244   |tBodyGyroMag-min()                  |Smallest value in array                 |
|245   |tBodyGyroMag-sma()                  |Signal magnitude area                   |
|246   |tBodyGyroMag-energy()               |Sum of squares / number of values.      |
|247   |tBodyGyroMag-iqr()                  |Interquartile range                     |
|248   |tBodyGyroMag-entropy()              |Signal entropy                          |
|249   |tBodyGyroMag-arCoeff()1             |Autorregresion coefficients             |
|250   |tBodyGyroMag-arCoeff()2             |Autorregresion coefficients             |
|251   |tBodyGyroMag-arCoeff()3             |Autorregresion coefficients             |
|252   |tBodyGyroMag-arCoeff()4             |Autorregresion coefficients             |
|253   |tBodyGyroJerkMag-mean()             |Mean value                              |
|254   |tBodyGyroJerkMag-std()              |Standard deviation                      |
|255   |tBodyGyroJerkMag-mad()              |Median absolute deviation               |
|256   |tBodyGyroJerkMag-max()              |Largest value in array                  |
|257   |tBodyGyroJerkMag-min()              |Smallest value in array                 |
|258   |tBodyGyroJerkMag-sma()              |Signal magnitude area                   |
|259   |tBodyGyroJerkMag-energy()           |Sum of squares / number of values.      |
|260   |tBodyGyroJerkMag-iqr()              |Interquartile range                     |
|261   |tBodyGyroJerkMag-entropy()          |Signal entropy                          |
|262   |tBodyGyroJerkMag-arCoeff()1         |Autorregresion coefficients             |
|263   |tBodyGyroJerkMag-arCoeff()2         |Autorregresion coefficients             |
|264   |tBodyGyroJerkMag-arCoeff()3         |Autorregresion coefficients             |
|265   |tBodyGyroJerkMag-arCoeff()4         |Autorregresion coefficients             |
|266   |fBodyAcc-mean()-X                   |Mean value                              |
|267   |fBodyAcc-mean()-Y                   |Mean value                              |
|268   |fBodyAcc-mean()-Z                   |Mean value                              |
|269   |fBodyAcc-std()-X                    |Standard deviation                      |
|270   |fBodyAcc-std()-Y                    |Standard deviation                      |
|271   |fBodyAcc-std()-Z                    |Standard deviation                      |
|272   |fBodyAcc-mad()-X                    |Median absolute deviation               |
|273   |fBodyAcc-mad()-Y                    |Median absolute deviation               |
|274   |fBodyAcc-mad()-Z                    |Median absolute deviation               |
|275   |fBodyAcc-max()-X                    |Largest value in array                  |
|276   |fBodyAcc-max()-Y                    |Largest value in array                  |
|277   |fBodyAcc-max()-Z                    |Largest value in array                  |
|278   |fBodyAcc-min()-X                    |Smallest value in array                 |
|279   |fBodyAcc-min()-Y                    |Smallest value in array                 |
|280   |fBodyAcc-min()-Z                    |Smallest value in array                 |
|281   |fBodyAcc-sma()                      |Signal magnitude area                   |
|282   |fBodyAcc-energy()-X                 |Sum of squares / number of values.      |
|283   |fBodyAcc-energy()-Y                 |Sum of squares / number of values.      |
|284   |fBodyAcc-energy()-Z                 |Sum of squares / number of values.      |
|285   |fBodyAcc-iqr()-X                    |Interquartile range                     |
|286   |fBodyAcc-iqr()-Y                    |Interquartile range                     |
|287   |fBodyAcc-iqr()-Z                    |Interquartile range                     |
|288   |fBodyAcc-entropy()-X                |Signal entropy                          |
|289   |fBodyAcc-entropy()-Y                |Signal entropy                          |
|290   |fBodyAcc-entropy()-Z                |Signal entropy                          |
|291   |fBodyAcc-maxInds-X                  |index of freq. comp. w largest magnitude|
|292   |fBodyAcc-maxInds-Y                  |index of freq. comp. w largest magnitude|
|293   |fBodyAcc-maxInds-Z                  |index of freq. comp. w largest magnitude|
|294   |fBodyAcc-meanFreq()-X               |Weighted avg of freq. components        |
|295   |fBodyAcc-meanFreq()-Y               |Weighted avg of freq. components        |
|296   |fBodyAcc-meanFreq()-Z               |Weighted avg of freq. components        |
|297   |fBodyAcc-skewness()-X               |skewness of freq. domain signal         |
|298   |fBodyAcc-kurtosis()-X               |kurtosis of freq. domain signal         |
|299   |fBodyAcc-skewness()-Y               |skewness of freq. domain signal         |
|300   |fBodyAcc-kurtosis()-Y               |kurtosis of freq. domain signal         |
|301   |fBodyAcc-skewness()-Z               |skewness of freq. domain signal         |
|302   |fBodyAcc-kurtosis()-Z               |kurtosis of freq. domain signal         |
|303   |fBodyAcc-bandsEnergy()-1,8          |Energy of freq interval-64 bins of FFT  |
|304   |fBodyAcc-bandsEnergy()-9,16         |Energy of freq interval-64 bins of FFT  |
|305   |fBodyAcc-bandsEnergy()-17,24        |Energy of freq interval-64 bins of FFT  |
|306   |fBodyAcc-bandsEnergy()-25,32        |Energy of freq interval-64 bins of FFT  |
|307   |fBodyAcc-bandsEnergy()-33,40        |Energy of freq interval-64 bins of FFT  |
|308   |fBodyAcc-bandsEnergy()-41,48        |Energy of freq interval-64 bins of FFT  |
|309   |fBodyAcc-bandsEnergy()-49,56        |Energy of freq interval-64 bins of FFT  |
|310   |fBodyAcc-bandsEnergy()-57,64        |Energy of freq interval-64 bins of FFT  |
|311   |fBodyAcc-bandsEnergy()-1,16         |Energy of freq interval-64 bins of FFT  |
|312   |fBodyAcc-bandsEnergy()-17,32        |Energy of freq interval-64 bins of FFT  |
|313   |fBodyAcc-bandsEnergy()-33,48        |Energy of freq interval-64 bins of FFT  |
|314   |fBodyAcc-bandsEnergy()-49,64        |Energy of freq interval-64 bins of FFT  |
|315   |fBodyAcc-bandsEnergy()-1,24         |Energy of freq interval-64 bins of FFT  |
|316   |fBodyAcc-bandsEnergy()-25,48        |Energy of freq interval-64 bins of FFT  |
|317   |fBodyAcc-bandsEnergy()-1,8          |Energy of freq interval-64 bins of FFT  |
|318   |fBodyAcc-bandsEnergy()-9,16         |Energy of freq interval-64 bins of FFT  |
|319   |fBodyAcc-bandsEnergy()-17,24        |Energy of freq interval-64 bins of FFT  |
|320   |fBodyAcc-bandsEnergy()-25,32        |Energy of freq interval-64 bins of FFT  |
|321   |fBodyAcc-bandsEnergy()-33,40        |Energy of freq interval-64 bins of FFT  |
|322   |fBodyAcc-bandsEnergy()-41,48        |Energy of freq interval-64 bins of FFT  |
|323   |fBodyAcc-bandsEnergy()-49,56        |Energy of freq interval-64 bins of FFT  |
|324   |fBodyAcc-bandsEnergy()-57,64        |Energy of freq interval-64 bins of FFT  |
|325   |fBodyAcc-bandsEnergy()-1,16         |Energy of freq interval-64 bins of FFT  |
|326   |fBodyAcc-bandsEnergy()-17,32        |Energy of freq interval-64 bins of FFT  |
|327   |fBodyAcc-bandsEnergy()-33,48        |Energy of freq interval-64 bins of FFT  |
|328   |fBodyAcc-bandsEnergy()-49,64        |Energy of freq interval-64 bins of FFT  |
|329   |fBodyAcc-bandsEnergy()-1,24         |Energy of freq interval-64 bins of FFT  |
|330   |fBodyAcc-bandsEnergy()-25,48        |Energy of freq interval-64 bins of FFT  |
|331   |fBodyAcc-bandsEnergy()-1,8          |Energy of freq interval-64 bins of FFT  |
|332   |fBodyAcc-bandsEnergy()-9,16         |Energy of freq interval-64 bins of FFT  |
|333   |fBodyAcc-bandsEnergy()-17,24        |Energy of freq interval-64 bins of FFT  |
|334   |fBodyAcc-bandsEnergy()-25,32        |Energy of freq interval-64 bins of FFT  |
|335   |fBodyAcc-bandsEnergy()-33,40        |Energy of freq interval-64 bins of FFT  |
|336   |fBodyAcc-bandsEnergy()-41,48        |Energy of freq interval-64 bins of FFT  |
|337   |fBodyAcc-bandsEnergy()-49,56        |Energy of freq interval-64 bins of FFT  |
|338   |fBodyAcc-bandsEnergy()-57,64        |Energy of freq interval-64 bins of FFT  |
|339   |fBodyAcc-bandsEnergy()-1,16         |Energy of freq interval-64 bins of FFT  |
|340   |fBodyAcc-bandsEnergy()-17,32        |Energy of freq interval-64 bins of FFT  |
|341   |fBodyAcc-bandsEnergy()-33,48        |Energy of freq interval-64 bins of FFT  |
|342   |fBodyAcc-bandsEnergy()-49,64        |Energy of freq interval-64 bins of FFT  |
|343   |fBodyAcc-bandsEnergy()-1,24         |Energy of freq interval-64 bins of FFT  |
|344   |fBodyAcc-bandsEnergy()-25,48        |Energy of freq interval-64 bins of FFT  |
|345   |fBodyAccJerk-mean()-X               |Mean value                              |
|346   |fBodyAccJerk-mean()-Y               |Mean value                              |
|347   |fBodyAccJerk-mean()-Z               |Mean value                              |
|348   |fBodyAccJerk-std()-X                |Standard deviation                      |
|349   |fBodyAccJerk-std()-Y                |Standard deviation                      |
|350   |fBodyAccJerk-std()-Z                |Standard deviation                      |
|351   |fBodyAccJerk-mad()-X                |Median absolute deviation               |
|352   |fBodyAccJerk-mad()-Y                |Median absolute deviation               |
|353   |fBodyAccJerk-mad()-Z                |Median absolute deviation               |
|354   |fBodyAccJerk-max()-X                |Largest value in array                  |
|355   |fBodyAccJerk-max()-Y                |Largest value in array                  |
|356   |fBodyAccJerk-max()-Z                |Largest value in array                  |
|357   |fBodyAccJerk-min()-X                |Smallest value in array                 |
|358   |fBodyAccJerk-min()-Y                |Smallest value in array                 |
|359   |fBodyAccJerk-min()-Z                |Smallest value in array                 |
|360   |fBodyAccJerk-sma()                  |Signal magnitude area                   |
|361   |fBodyAccJerk-energy()-X             |Sum of squares / number of values.      |
|362   |fBodyAccJerk-energy()-Y             |Sum of squares / number of values.      |
|363   |fBodyAccJerk-energy()-Z             |Sum of squares / number of values.      |
|364   |fBodyAccJerk-iqr()-X                |Interquartile range                     |
|365   |fBodyAccJerk-iqr()-Y                |Interquartile range                     |
|366   |fBodyAccJerk-iqr()-Z                |Interquartile range                     |
|367   |fBodyAccJerk-entropy()-X            |Signal entropy                          |
|368   |fBodyAccJerk-entropy()-Y            |Signal entropy                          |
|369   |fBodyAccJerk-entropy()-Z            |Signal entropy                          |
|370   |fBodyAccJerk-maxInds-X              |index of freq. comp. w largest magnitude|
|371   |fBodyAccJerk-maxInds-Y              |index of freq. comp. w largest magnitude|
|372   |fBodyAccJerk-maxInds-Z              |index of freq. comp. w largest magnitude|
|373   |fBodyAccJerk-meanFreq()-X           |Weighted avg of freq. components        |
|374   |fBodyAccJerk-meanFreq()-Y           |Weighted avg of freq. components        |
|375   |fBodyAccJerk-meanFreq()-Z           |Weighted avg of freq. components        |
|376   |fBodyAccJerk-skewness()-X           |skewness of freq. domain signal         |
|377   |fBodyAccJerk-kurtosis()-X           |kurtosis of freq. domain signal         |
|378   |fBodyAccJerk-skewness()-Y           |skewness of freq. domain signal         |
|379   |fBodyAccJerk-kurtosis()-Y           |kurtosis of freq. domain signal         |
|380   |fBodyAccJerk-skewness()-Z           |skewness of freq. domain signal         |
|381   |fBodyAccJerk-kurtosis()-Z           |kurtosis of freq. domain signal         |
|382   |fBodyAccJerk-bandsEnergy()-1,8      |Energy of freq interval-64 bins of FFT  |
|383   |fBodyAccJerk-bandsEnergy()-9,16     |Energy of freq interval-64 bins of FFT  |
|384   |fBodyAccJerk-bandsEnergy()-17,24    |Energy of freq interval-64 bins of FFT  |
|385   |fBodyAccJerk-bandsEnergy()-25,32    |Energy of freq interval-64 bins of FFT  |
|386   |fBodyAccJerk-bandsEnergy()-33,40    |Energy of freq interval-64 bins of FFT  |
|387   |fBodyAccJerk-bandsEnergy()-41,48    |Energy of freq interval-64 bins of FFT  |
|388   |fBodyAccJerk-bandsEnergy()-49,56    |Energy of freq interval-64 bins of FFT  |
|389   |fBodyAccJerk-bandsEnergy()-57,64    |Energy of freq interval-64 bins of FFT  |
|390   |fBodyAccJerk-bandsEnergy()-1,16     |Energy of freq interval-64 bins of FFT  |
|391   |fBodyAccJerk-bandsEnergy()-17,32    |Energy of freq interval-64 bins of FFT  |
|392   |fBodyAccJerk-bandsEnergy()-33,48    |Energy of freq interval-64 bins of FFT  |
|393   |fBodyAccJerk-bandsEnergy()-49,64    |Energy of freq interval-64 bins of FFT  |
|394   |fBodyAccJerk-bandsEnergy()-1,24     |Energy of freq interval-64 bins of FFT  |
|395   |fBodyAccJerk-bandsEnergy()-25,48    |Energy of freq interval-64 bins of FFT  |
|396   |fBodyAccJerk-bandsEnergy()-1,8      |Energy of freq interval-64 bins of FFT  |
|397   |fBodyAccJerk-bandsEnergy()-9,16     |Energy of freq interval-64 bins of FFT  |
|398   |fBodyAccJerk-bandsEnergy()-17,24    |Energy of freq interval-64 bins of FFT  |
|399   |fBodyAccJerk-bandsEnergy()-25,32    |Energy of freq interval-64 bins of FFT  |
|400   |fBodyAccJerk-bandsEnergy()-33,40    |Energy of freq interval-64 bins of FFT  |
|401   |fBodyAccJerk-bandsEnergy()-41,48    |Energy of freq interval-64 bins of FFT  |
|402   |fBodyAccJerk-bandsEnergy()-49,56    |Energy of freq interval-64 bins of FFT  |
|403   |fBodyAccJerk-bandsEnergy()-57,64    |Energy of freq interval-64 bins of FFT  |
|404   |fBodyAccJerk-bandsEnergy()-1,16     |Energy of freq interval-64 bins of FFT  |
|405   |fBodyAccJerk-bandsEnergy()-17,32    |Energy of freq interval-64 bins of FFT  |
|406   |fBodyAccJerk-bandsEnergy()-33,48    |Energy of freq interval-64 bins of FFT  |
|407   |fBodyAccJerk-bandsEnergy()-49,64    |Energy of freq interval-64 bins of FFT  |
|408   |fBodyAccJerk-bandsEnergy()-1,24     |Energy of freq interval-64 bins of FFT  |
|409   |fBodyAccJerk-bandsEnergy()-25,48    |Energy of freq interval-64 bins of FFT  |
|410   |fBodyAccJerk-bandsEnergy()-1,8      |Energy of freq interval-64 bins of FFT  |
|411   |fBodyAccJerk-bandsEnergy()-9,16     |Energy of freq interval-64 bins of FFT  |
|412   |fBodyAccJerk-bandsEnergy()-17,24    |Energy of freq interval-64 bins of FFT  |
|413   |fBodyAccJerk-bandsEnergy()-25,32    |Energy of freq interval-64 bins of FFT  |
|414   |fBodyAccJerk-bandsEnergy()-33,40    |Energy of freq interval-64 bins of FFT  |
|415   |fBodyAccJerk-bandsEnergy()-41,48    |Energy of freq interval-64 bins of FFT  |
|416   |fBodyAccJerk-bandsEnergy()-49,56    |Energy of freq interval-64 bins of FFT  |
|417   |fBodyAccJerk-bandsEnergy()-57,64    |Energy of freq interval-64 bins of FFT  |
|418   |fBodyAccJerk-bandsEnergy()-1,16     |Energy of freq interval-64 bins of FFT  |
|419   |fBodyAccJerk-bandsEnergy()-17,32    |Energy of freq interval-64 bins of FFT  |
|420   |fBodyAccJerk-bandsEnergy()-33,48    |Energy of freq interval-64 bins of FFT  |
|421   |fBodyAccJerk-bandsEnergy()-49,64    |Energy of freq interval-64 bins of FFT  |
|422   |fBodyAccJerk-bandsEnergy()-1,24     |Energy of freq interval-64 bins of FFT  |
|423   |fBodyAccJerk-bandsEnergy()-25,48    |Energy of freq interval-64 bins of FFT  |
|424   |fBodyGyro-mean()-X                  |Mean value                              |
|425   |fBodyGyro-mean()-Y                  |Mean value                              |
|426   |fBodyGyro-mean()-Z                  |Mean value                              |
|427   |fBodyGyro-std()-X                   |Standard deviation                      |
|428   |fBodyGyro-std()-Y                   |Standard deviation                      |
|429   |fBodyGyro-std()-Z                   |Standard deviation                      |
|430   |fBodyGyro-mad()-X                   |Median absolute deviation               |
|431   |fBodyGyro-mad()-Y                   |Median absolute deviation               |
|432   |fBodyGyro-mad()-Z                   |Median absolute deviation               |
|433   |fBodyGyro-max()-X                   |Largest value in array                  |
|434   |fBodyGyro-max()-Y                   |Largest value in array                  |
|435   |fBodyGyro-max()-Z                   |Largest value in array                  |
|436   |fBodyGyro-min()-X                   |Smallest value in array                 |
|437   |fBodyGyro-min()-Y                   |Smallest value in array                 |
|438   |fBodyGyro-min()-Z                   |Smallest value in array                 |
|439   |fBodyGyro-sma()                     |Signal magnitude area                   |
|440   |fBodyGyro-energy()-X                |Sum of squares / number of values.      |
|441   |fBodyGyro-energy()-Y                |Sum of squares / number of values.      |
|442   |fBodyGyro-energy()-Z                |Sum of squares / number of values.      |
|443   |fBodyGyro-iqr()-X                   |Interquartile range                     |
|444   |fBodyGyro-iqr()-Y                   |Interquartile range                     |
|445   |fBodyGyro-iqr()-Z                   |Interquartile range                     |
|446   |fBodyGyro-entropy()-X               |Signal entropy                          |
|447   |fBodyGyro-entropy()-Y               |Signal entropy                          |
|448   |fBodyGyro-entropy()-Z               |Signal entropy                          |
|449   |fBodyGyro-maxInds-X                 |index of freq. comp. w largest magnitude|
|450   |fBodyGyro-maxInds-Y                 |index of freq. comp. w largest magnitude|
|451   |fBodyGyro-maxInds-Z                 |index of freq. comp. w largest magnitude|
|452   |fBodyGyro-meanFreq()-X              |Weighted avg of freq. components        |
|453   |fBodyGyro-meanFreq()-Y              |Weighted avg of freq. components        |
|454   |fBodyGyro-meanFreq()-Z              |Weighted avg of freq. components        |
|455   |fBodyGyro-skewness()-X              |skewness of freq. domain signal         |
|456   |fBodyGyro-kurtosis()-X              |kurtosis of freq. domain signal         |
|457   |fBodyGyro-skewness()-Y              |skewness of freq. domain signal         |
|458   |fBodyGyro-kurtosis()-Y              |kurtosis of freq. domain signal         |
|459   |fBodyGyro-skewness()-Z              |skewness of freq. domain signal         |
|460   |fBodyGyro-kurtosis()-Z              |kurtosis of freq. domain signal         |
|461   |fBodyGyro-bandsEnergy()-1,8         |Energy of freq interval-64 bins of FFT  |
|462   |fBodyGyro-bandsEnergy()-9,16        |Energy of freq interval-64 bins of FFT  |
|463   |fBodyGyro-bandsEnergy()-17,24       |Energy of freq interval-64 bins of FFT  |
|464   |fBodyGyro-bandsEnergy()-25,32       |Energy of freq interval-64 bins of FFT  |
|465   |fBodyGyro-bandsEnergy()-33,40       |Energy of freq interval-64 bins of FFT  |
|466   |fBodyGyro-bandsEnergy()-41,48       |Energy of freq interval-64 bins of FFT  |
|467   |fBodyGyro-bandsEnergy()-49,56       |Energy of freq interval-64 bins of FFT  |
|468   |fBodyGyro-bandsEnergy()-57,64       |Energy of freq interval-64 bins of FFT  |
|469   |fBodyGyro-bandsEnergy()-1,16        |Energy of freq interval-64 bins of FFT  |
|470   |fBodyGyro-bandsEnergy()-17,32       |Energy of freq interval-64 bins of FFT  |
|471   |fBodyGyro-bandsEnergy()-33,48       |Energy of freq interval-64 bins of FFT  |
|472   |fBodyGyro-bandsEnergy()-49,64       |Energy of freq interval-64 bins of FFT  |
|473   |fBodyGyro-bandsEnergy()-1,24        |Energy of freq interval-64 bins of FFT  |
|474   |fBodyGyro-bandsEnergy()-25,48       |Energy of freq interval-64 bins of FFT  |
|475   |fBodyGyro-bandsEnergy()-1,8         |Energy of freq interval-64 bins of FFT  |
|476   |fBodyGyro-bandsEnergy()-9,16        |Energy of freq interval-64 bins of FFT  |
|477   |fBodyGyro-bandsEnergy()-17,24       |Energy of freq interval-64 bins of FFT  |
|478   |fBodyGyro-bandsEnergy()-25,32       |Energy of freq interval-64 bins of FFT  |
|479   |fBodyGyro-bandsEnergy()-33,40       |Energy of freq interval-64 bins of FFT  |
|480   |fBodyGyro-bandsEnergy()-41,48       |Energy of freq interval-64 bins of FFT  |
|481   |fBodyGyro-bandsEnergy()-49,56       |Energy of freq interval-64 bins of FFT  |
|482   |fBodyGyro-bandsEnergy()-57,64       |Energy of freq interval-64 bins of FFT  |
|483   |fBodyGyro-bandsEnergy()-1,16        |Energy of freq interval-64 bins of FFT  |
|484   |fBodyGyro-bandsEnergy()-17,32       |Energy of freq interval-64 bins of FFT  |
|485   |fBodyGyro-bandsEnergy()-33,48       |Energy of freq interval-64 bins of FFT  |
|486   |fBodyGyro-bandsEnergy()-49,64       |Energy of freq interval-64 bins of FFT  |
|487   |fBodyGyro-bandsEnergy()-1,24        |Energy of freq interval-64 bins of FFT  |
|488   |fBodyGyro-bandsEnergy()-25,48       |Energy of freq interval-64 bins of FFT  |
|489   |fBodyGyro-bandsEnergy()-1,8         |Energy of freq interval-64 bins of FFT  |
|490   |fBodyGyro-bandsEnergy()-9,16        |Energy of freq interval-64 bins of FFT  |
|491   |fBodyGyro-bandsEnergy()-17,24       |Energy of freq interval-64 bins of FFT  |
|492   |fBodyGyro-bandsEnergy()-25,32       |Energy of freq interval-64 bins of FFT  |
|493   |fBodyGyro-bandsEnergy()-33,40       |Energy of freq interval-64 bins of FFT  |
|494   |fBodyGyro-bandsEnergy()-41,48       |Energy of freq interval-64 bins of FFT  |
|495   |fBodyGyro-bandsEnergy()-49,56       |Energy of freq interval-64 bins of FFT  |
|496   |fBodyGyro-bandsEnergy()-57,64       |Energy of freq interval-64 bins of FFT  |
|497   |fBodyGyro-bandsEnergy()-1,16        |Energy of freq interval-64 bins of FFT  |
|498   |fBodyGyro-bandsEnergy()-17,32       |Energy of freq interval-64 bins of FFT  |
|499   |fBodyGyro-bandsEnergy()-33,48       |Energy of freq interval-64 bins of FFT  |
|500   |fBodyGyro-bandsEnergy()-49,64       |Energy of freq interval-64 bins of FFT  |
|501   |fBodyGyro-bandsEnergy()-1,24        |Energy of freq interval-64 bins of FFT  |
|502   |fBodyGyro-bandsEnergy()-25,48       |Energy of freq interval-64 bins of FFT  |
|503   |fBodyAccMag-mean()                  |Mean value                              |
|504   |fBodyAccMag-std()                   |Standard deviation                      |
|505   |fBodyAccMag-mad()                   |Median absolute deviation               |
|506   |fBodyAccMag-max()                   |Largest value in array                  |
|507   |fBodyAccMag-min()                   |Smallest value in array                 |
|508   |fBodyAccMag-sma()                   |Signal magnitude area                   |
|509   |fBodyAccMag-energy()                |Sum of squares / number of values.      |
|510   |fBodyAccMag-iqr()                   |Interquartile range                     |
|511   |fBodyAccMag-entropy()               |Signal entropy                          |
|512   |fBodyAccMag-maxInds                 |index of freq. comp. w largest magnitude|
|513   |fBodyAccMag-meanFreq()              |Weighted avg of freq. components        |
|514   |fBodyAccMag-skewness()              |skewness of freq. domain signal         |
|515   |fBodyAccMag-kurtosis()              |kurtosis of freq. domain signal         |
|516   |fBodyBodyAccJerkMag-mean()          |Mean value                              |
|517   |fBodyBodyAccJerkMag-std()           |Standard deviation                      |
|518   |fBodyBodyAccJerkMag-mad()           |Median absolute deviation               |
|519   |fBodyBodyAccJerkMag-max()           |Largest value in array                  |
|520   |fBodyBodyAccJerkMag-min()           |Smallest value in array                 |
|521   |fBodyBodyAccJerkMag-sma()           |Signal magnitude area                   |
|522   |fBodyBodyAccJerkMag-energy()        |Sum of squares / number of values.      |
|523   |fBodyBodyAccJerkMag-iqr()           |Interquartile range                     |
|524   |fBodyBodyAccJerkMag-entropy()       |Signal entropy                          |
|525   |fBodyBodyAccJerkMag-maxInds         |index of freq. comp. w largest magnitude|
|526   |fBodyBodyAccJerkMag-meanFreq()      |Weighted avg of freq. components        |
|527   |fBodyBodyAccJerkMag-skewness()      |skewness of freq. domain signal         |
|528   |fBodyBodyAccJerkMag-kurtosis()      |kurtosis of freq. domain signal         |
|529   |fBodyBodyGyroMag-mean()             |Mean value                              |
|530   |fBodyBodyGyroMag-std()              |Standard deviation                      |
|531   |fBodyBodyGyroMag-mad()              |Median absolute deviation               |
|532   |fBodyBodyGyroMag-max()              |Largest value in array                  |
|533   |fBodyBodyGyroMag-min()              |Smallest value in array                 |
|534   |fBodyBodyGyroMag-sma()              |Signal magnitude area                   |
|535   |fBodyBodyGyroMag-energy()           |Sum of squares / number of values.      |
|536   |fBodyBodyGyroMag-iqr()              |Interquartile range                     |
|537   |fBodyBodyGyroMag-entropy()          |Signal entropy                          |
|538   |fBodyBodyGyroMag-maxInds            |index of freq. comp. w largest magnitude|
|539   |fBodyBodyGyroMag-meanFreq()         |Weighted avg of freq. components        |
|540   |fBodyBodyGyroMag-skewness()         |skewness of freq. domain signal         |
|541   |fBodyBodyGyroMag-kurtosis()         |kurtosis of freq. domain signal         |
|542   |fBodyBodyGyroJerkMag-mean()         |Mean value                              |
|543   |fBodyBodyGyroJerkMag-std()          |Standard deviation                      |
|544   |fBodyBodyGyroJerkMag-mad()          |Median absolute deviation               |
|545   |fBodyBodyGyroJerkMag-max()          |Largest value in array                  |
|546   |fBodyBodyGyroJerkMag-min()          |Smallest value in array                 |
|547   |fBodyBodyGyroJerkMag-sma()          |Signal magnitude area                   |
|548   |fBodyBodyGyroJerkMag-energy()       |Sum of squares / number of values.      |
|549   |fBodyBodyGyroJerkMag-iqr()          |Interquartile range                     |
|550   |fBodyBodyGyroJerkMag-entropy()      |Signal entropy                          |
|551   |fBodyBodyGyroJerkMag-maxInds        |index of freq. comp. w largest magnitude|
|552   |fBodyBodyGyroJerkMag-meanFreq()     |Weighted avg of freq. components        |
|553   |fBodyBodyGyroJerkMag-skewness()     |skewness of freq. domain signal         |
|554   |fBodyBodyGyroJerkMag-kurtosis()     |kurtosis of freq. domain signal         |
|555   |angle(tBodyAccMean,gravity)         |Mean value                              |
|556   |angle(tBodyAccJerkMean),gravityMean)|Mean value                              |
|557   |angle(tBodyGyroMean,gravityMean)    |Mean value                              |
|558   |angle(tBodyGyroJerkMean,gravityMean)|Mean value                              |
|559   |angle(X,gravityMean)                |Mean value                              |
|560   |angle(Y,gravityMean)                |Mean value                              |
|561   |angle(Z,gravityMean)                |Mean value                              |
