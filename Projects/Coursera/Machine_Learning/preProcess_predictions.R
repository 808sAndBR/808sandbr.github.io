training2 <- training[,grep('^(IL)',names(training))]
training2<- cbind(training2,training$diagnosis)

preProc <- preProcess(training2,method = 'pca', pcaComp = 7)
trainPC <- predict(preProc,training2)
modelFit <- train(training$diagnosis ~., method='pca',data=trainPC)

testing2 <- testing[,grep('^(IL)',names(testing))]
testing2<- cbind(testing2,testing$diagnosis)

testPC <- predict(preProc,testing2)
confusionMatrix(testing$diagnosis,predict(modelFit,testPC))