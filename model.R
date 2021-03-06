# fit some models
library(caret)
library(doParallel)


cl <- makeCluster(3)
registerDoParallel(cl)

train.set2 <- train.set[,-(1:7)]
model1 <- train(classe~.,data=train.set2,
                preProcess=c("center","scale"),
                method="knn",
                trControl=trainControl(method="cv"),
                tuneLength=7)

model2 <- train(classe~.,data=train.set2,
                preProcess=c("center","scale"),
                method="rf",
                trControl=trainControl(method="cv"),
                tuneLength=7)

stopCluster(cl)

pred1 <- predict(model1,newdata=val.set)
cm1 <- confusionMatrix(pred1,val.set$classe)

pred2 <- predict(model2,newdata=val.set)
cm2 <- confusionMatrix(pred2,val.set$classe)
