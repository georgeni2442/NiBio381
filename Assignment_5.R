# Problem 1 
x<-1.1
a<-2.2
b<-3.3
z<-c(x,a,b)
z

z<-x^a^b
z
z<-(x^a)^b
z
z<-3*x^3+2*x^2+1
z

#Problem 2
#a
x<-seq(from=1, to=8)
x
z<-seq(from=7, to =1)
z
c(x,z)
#b
x<-seq(1:5)
rep<-rep(x, x)
rep
#c
x<-seq(1:5)
z<-seq(from=5, to=1)
rep<-rep(z,x)
rep


#Problem 3 
vec<-runif(2)
vec
theta<-atan(vec[1]/vec[2])
r<-vec[2]/asin(theta)
polar<-c(theta,r)

#Problem 4
queue <- c("sheep", "fox", "owl", "ant")
queue <-c(queue, "serpent")
queue <-queue[-1]
queue
queue <-append(queue, "donkey", after=0)
queue
queue <-queue[-5]
queue
queue <-queue[-3]
queue <-append(queue, "aphid", after = 2)
queue
position<-which(queue=="aphid")
position


#Problem 5
#Values that are not divisible by any of these 
x<-seq(1:100)
vec<-which(x%%2==!0 & x%%3==!0 & x%%7==!0)

