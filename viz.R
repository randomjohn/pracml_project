# visualize the training data
library(ggplot2)
library(caret)

# look at the classes, I guess as a sanity check
qplot(classe,data=train.set,geom=c("bar"))

# a lot of these variables are useless, having only a few nonmissing rows
nearZeroVar(train.set,saveMetrics=T)

# start to look at feature plots, but first group vars
roll.vars <- grep("^roll",names(train.set),value=T)
pitch.vars <- grep("^pitch",names(train.set),value=T)
yaw.vars <- grep("^yaw",names(train.set),value=T)
accel.vars <- grep("^total_accel_",names(train.set),value=T)


arm.vars <- grep("_arm$",names(train.set),value=T)
belt.vars <- grep("_belt$",names(train.set),value=T)
dumbbell.vars <- grep("_dumbbell$",names(train.set),value=T)
forearm.vars <- grep("_forearm$",names(train.set),value=T)

featurePlot(train.set[,roll.vars],train.set$classe,"pairs")
featurePlot(train.set[,pitch.vars],train.set$classe,"pairs")
featurePlot(train.set[,yaw.vars],train.set$classe,"pairs")
featurePlot(train.set[,accel.vars],train.set$classe,"pairs")

featurePlot(train.set[,arm.vars],train.set$classe,"pairs")
featurePlot(train.set[,belt.vars],train.set$classe,"pairs")
featurePlot(train.set[,dumbbell.vars],train.set$classe,"pairs")
featurePlot(train.set[,forearm.vars],train.set$classe,"pairs")
