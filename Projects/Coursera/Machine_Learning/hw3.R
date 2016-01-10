library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)

hw_train <- segmentationOriginal[segmentationOriginal$Case=="Train",]
hw_test <- segmentationOriginal[!segmentationOriginal$Case=="Train",]

set.seed(125)
modfit <- train(Class~., method='rpart', data = hw_train)

fancyRpartPlot(modfit$finalModel)

predict(modfit, newdata = data.frame(TotalIntench2 = 23000, FiberWidthCh1 = 10, PerimStatusCh1=2 ))

#PS
#WS
#PS
#Not possible

################################
install.packages('pgmm')
library(pgmm)
data(olive)
olive = olive[,-1]

modfit_olive <- train(factor(Area)~., method='rpart', data=olive)
fancyRpartPlot(modfit_olive$finalModel)

predict(modfit_olive, newdata = as.data.frame(t(colMeans(olive))))

##################################

library(ElemStatLearn)
data(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]

set.seed(13234)

modfit_heart <- train(sbp~c(age, alcohol, obesity, tobacco, typea, ldl), method = 'glm', family='binomial', data = trainSA)

modfit_heart2 <- train(chd~age+alcohol+obesity+tobacco+typea+ldl, method="glm", family="binomial", data = trainSA)

missClass = function(values,prediction){sum(((prediction > 0.5)*1) != values)/length(values)}

heart_pred <- predict(modfit_heart2, newdata = testSA)
heart_pred2 <- predict(modfit_heart2, newdata = trainSA)

missClass(testSA$chd,heart_pred)
missClass(trainSA$chd,heart_pred2)

#############

library(ElemStatLearn)
data(vowel.train)
data(vowel.test) 

vowel.test$y <- factor(vowel.test$y)
vowel.train$y <- factor(vowel.train$y)

set.seed(33833)

vowel_pred <- train(y ~., method='rf', data=vowel.train)
?train
varImp(vowel_pred)

?vowel.train


















