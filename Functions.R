##################################################
# FUNCTION: genData
# Create Mock Dataset
# input: Sample size (size), numeric, and Standard Deviation (sd), numeric
# output: Mock Dataset Dataframe
#------------------------------------------------- 
genData <- function(size) {
  scp<-rnorm(size, mean=-26,sd = 5)
  size<-seq(1,20, length.out=size)
  df<-data.frame(size=size, scp=scp)
  df$scp[which(df$size<4)]<-rnorm(n = nrow(df[df$size<4,]), mean=-15, sd=5)
  df$scp[which(df$size>15)]<-rnorm( nrow(df[df$size>15,]),mean=-30, sd=5)
  
  return(df)
}

##################################################
# FUNCTION: CalculateStuff
# Regression Analysis for Dataset
# input: x
# output: x 
#------------------------------------------------- 
CalculateStuff <- function(df=df) {
mod<-lm(df$scp~df$size,  data=df)
return(summary(mod))
}


##################################################
# FUNCTION: PlotResults
# Plotting for Dataset
# input: x
# output: x 
#------------------------------------------------- 
PlotResults <- function(df) {
  plot<-plot(x=df$size,y=df$scp)
  mod<-lm(scp~size,  data=df)
  mod1<-summary(mod)
  abline(mod)
  mod1$r.squared
  return(plot)
  
}

##################################################
# FUNCTION: Histogram
# Plotting for Dataset
# input: x
# output: x 
#------------------------------------------------- 
Histogram <- function(df) {
  plot<-hist(df$scp)
  return(plot)
}

