library(ggplot2)


#Question 1

counter<-0

count<-function(n, size, prob){
x<-rbinom(n = n, size = size, prob = prob)
for(i in 1:n){
  if (x[i]==0) {
    counter<-counter+1
  }
}
return(counter)
}

count(1000, 3, 0.5)


#Question 2
count<-function(n, size, prob){
  x<-rbinom(n = n, size = size, prob = prob)
 counter<-NROW(x[which(x[1:n]==0)])
 return(counter)
}

count(2000, 4, 0.5)


#Question 3 
matfunc<-function(row, col){
mat<-matrix(nrow = row, ncol=col)
for(i in 1:row){
  for(j in 1:col){
    mat[i,j]<-i*j
  }
}
return(mat)
}

matfunc(2, 4)

# Question 4
set.seed(0)
fiola<-read.csv("fiola.csv")
fiola$ID<-fiola$plotname
fiola$ID<-1:53

####### ###########################################
# function: readData
# read in (or generate) data set for analysis
# input: file name (or nothing, for this demo)
# output: 3 column data frame of observed data (ID,x,y)
#------------------------------------------------- 
readData <- function(z=NULL) {
  if(is.null(z)){
    xObs <- 1:20
    yObs <- xObs + 10*rnorm(20)
    dF <- data.frame(ID=seq_along(xObs),xObs,yObs)} # set up data frame                 
  #  dF <-read.table(file=z,row.names=1,header=TRUE,sep=",",stringsAsFactors=FALSE)
  # print(qplot(x=xObs,y=yObs)) # peek at input data
  return(dF)
}


##################################################
# function: getMetric
# calculate metric for randomization test
# input: 2-column data frame for regression
# output: regression slope
#------------------------------------------------- 
getMetric <- function(z=NULL) {
  if(is.null(z)){
    xObs <- 1:20
    yObs <-  xObs + 10*rnorm(20)
    z <- data.frame(ID=seq_along(xObs),xObs,yObs)} # set up data frame                 
  . <- lm(z[,3]~z[,2])
  . <- summary(.)
  . <- .$coefficients[2,1]
  
  slope <- .
  return(slope)
}


##################################################
# function: shuffleData
# randomize data for regression analysis
# input: 3-column data frame (ID,xVar,yVar)
# output: 3-column data frame (ID,xVar,yVar)
#------------------------------------------------- 
shuffleData <- function(z=NULL) {
  if(is.null(z)){
    xObs <- 1:20
    yObs <- xObs + 3*rnorm(20)
    z <- data.frame(ID=seq_along(xObs),xObs,yObs)} # set up data frame                 
  z[,3] <- sample(z[,3]) # use sample function with defaults to reshuffle column
  
  return(z)
}

##################################################
# function: getPVal
# calculate p value from simulation
# input: list of observed metric, and vector of simulated metrics
# output: lower, upper tail probability values
#------------------------------------------------- 
getPVal <- function(z=NULL) {
  if(is.null(z)){
    z <- list(xObs=runif(1),xSim=runif(1000))}
  pLower <- mean(z[[2]]<=z[[1]])
  pUpper <- mean(z[[2]]>=z[[1]])
  return(c(pL=pLower,pU=pUpper))
}


##################################################
# function: plotRanTest
# create ggplot of histogram of simulated values
# input: list of observed metric and vector of simulated metrics
# output: saved ggplot graph
#------------------------------------------------- 
plotRanTest <- function(z=NULL) {
  if(is.null(z)){
    z <- list(rnorm(1),rnorm(1000)) }
  dF <- data.frame(ID=seq_along(z[[2]]),simX=z[[2]])
  p1 <- ggplot(data=dF,mapping=aes(x=simX))
  p1 + geom_histogram(mapping=aes(fill=I("goldenrod"),color=I("black"))) +
    geom_vline(aes(xintercept=z[[1]],col="blue")) 
  
}


