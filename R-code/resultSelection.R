#selecting the correct columns for the results
library(MASS)

setwd("C:/Users/David Dupuis/Desktop/School/ESILV/Semestre 9/PI2-A5")

#integer. A penalty to be applied when deciding to print numeric values in fixed or exponential notation. Positive values bias 
#towards fixed and negative towards scientific notation: fixed notation will be prefered unless it is more tan scipen digits wider.
#This allows us to ad Id column without scientific notation as Id. 
options(scipen = 999)

#GET ARE CURRENT PREDICTIONS
df.predictions <- read.csv("models/model5-/results.csv",check.names=FALSE);

#REMOVE Prediction COLUMN
df.results <- df.predictions[,-1];

#ADD Id COLUMN TO DATAFRAME
Id <- seq.int(nrow(df.results))-1;
df.results <- cbind(Id,df.results);

#WRITE CSV FILE BUT REMOVE QUOTES AND ROW VALUES
write.csv(file="models/model5-/resultsCorrected.csv",df.results,quote=FALSE,row.names = FALSE);

