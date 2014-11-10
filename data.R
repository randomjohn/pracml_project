# data loading and munging
library(caret)

# extract features --------------------------------------------------------

extract.features <- function(df) {
  # remove variables with few values
  for (pre in c("max_","min_","avg_","skewness_","kurtosis_",
                "avg_","var_","stddev_","amplitude")) {
    varnames <- grep(paste0("^",pre),names(df),value=T)
    for (thisvar in varnames) {
      df[,thisvar] <- NULL
    }
  }
  
  return(df)
}

# load and process training data ------------------------------------------
lift.train <- read.csv("pml-training.csv")

# process training data here
lift.train <- extract.features(lift.train)


# create a hold-out set
set.seed(3878)
intrain <- createDataPartition(lift.train$classe,p=0.6)[[1]]
train.set <- lift.train[intrain,]
val.set <- lift.train[-intrain,]

# load and process test data ----------------------------------------------
lift.test <- read.csv("pml-testing.csv")
lift.test <- extract.features(lift.test)
