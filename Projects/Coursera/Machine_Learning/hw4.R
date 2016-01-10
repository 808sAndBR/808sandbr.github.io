# Q1
library(caret)
library(ElemStatLearn)
library(doMC)
data(vowel.train)
vowel.train$y <- factor(vowel.train$y) 
data(vowel.test) 
vowel.test$y <- factor(vowel.test$y) 

set.seed(33833)
registerDoMC(cores = 4)

names(vowel.train)
rfModFit <- train(y ~ ., method = "rf", data = vowel.train)
rfPredict <- predict(rfModFit, vowel.test)
table(rfPredict == vowel.test$y)
276/462

gbmModFit <- train(y ~ ., method = "gbm", data = vowel.train)
gbmPredict <- predict(gbmModFit, vowel.test)
table(gbmPredict == vowel.test$y)
239/462

combined <- data.frame(rfPredict, gbmPredict, vowel.test$y)

agreeing <- subset(combined, rfPredict == gbmPredict)
table(agreeing$rfPredict==agreeing$vowel.test.y)
201/(201+123)

# Q2
library(caret)
library(gbm)
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

names(adData)
rfModFit <- train(diagnosis ~ ., data = training, method = "rf")
gbmModFit <- train(diagnosis ~ ., data = training, method = "gbm")
ldaModFit <- train(diagnosis ~ ., data = training, method = "lda")

rfPredict <- predict(rfModFit, testing)
gbmPredict <- predict(gbmModFit, testing)
ldaPredict <- predict(ldaModFit, testing)

rfTrPredict <- predict(rfModFit, training)
gbmTrPredict <- predict(gbmModFit, training)
ldaTrPredict <- predict(ldaModFit, training)

table(rfPredict == testing$diagnosis)
table(gbmPredict == testing$diagnosis)
table(ldaPredict == testing$diagnosis)

set.seed(62433)

predDF <- data.frame(rfPredict=rfTrPredict, gbmPredict=gbmTrPredict, ldaPredict=ldaTrPredict, diagnosis = training$diagnosis)
combModFit <- train(diagnosis~., predDF, method = "rf")
combPred <- predict(combModFit, predDF)

head(predDF)
combModFit
testDF <- data.frame(rfPredict, gbmPredict, ldaPredict, diagnosis = testing$diagnosis)
combTest <- predict(combModFit, newdata =  testDF)
dim(predDF)
table(combTest == testing$diagnosis)
68/(68+14)

65/(65+17)
66/(66+16)
63/(19+63)
# I guess this is the closest?
# Stacked Accuracy: 0.80 is better than random forests and lda and the same as boosting.

# Q3

set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

set.seed(233)
names(training)
modFit <- train(CompressiveStrength ~ ., data = training, method="lasso")

plot.enet(modFit$finalModel,xvar='penalty')

#if Cement is wrong I must be reading it backwards and it should be CoarseAggregate
library(lubridate)
library(forecast)
dat = read.csv("~/Downloads/gaData.csv")
training = dat[year(dat$date) < 2012,]
testing = dat[(year(dat$date)) > 2011,]
tstrain = ts(training$visitsTumblr)

head(training)
batsFit <- bats(tstrain)
predBat <- forecast(batsFit, h=235)
accuracy(predBat, testing$visitsTumblr)

tsdf <- data.frame(predBat$upper[,2],predBat$lower[,2],testing$visitsTumblr)
table(tsdf$testing.visitsTumblr > tsdf$predBat.lower...2.& tsdf$testing.visitsTumblr < tsdf$predBat.upper...2.)
226/(226+9)

# Q5

set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

set.seed(325)

library(e1071)
svmModFit <- svm(CompressiveStrength~., data= training)

svmPred <- predict(svmModFit, testing)

RMSE(svmPred, testing$CompressiveStrength)

