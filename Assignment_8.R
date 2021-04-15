#Fake Dataset for Cold Tolerance Study 

#Create new dataset for super cooling point-should be a normal distribution centered around SCP. 

#SCP I already know should be centered around probably -26 Degrees Celsius
#SCP predicted by larval body size?

#Vector for samples

library(dplyr)
library(tidyr)

scp<-rnorm(100, mean=-26,sd = 10)
size<-seq(1,20, length.out=100)
df<-data.frame(size=size, scp=scp)
df$scp[which(df$size<4)]<-rnorm(n = nrow(df[df$size<4,]), mean=-15, sd=10)
df$scp[which(df$size>15)]<-rnorm( nrow(df[df$size>15,]),mean=-30, sd=10)


hist(df$scp,breaks = 5)

#Analyze the Data (ANOVA or regression analyses)
plot(x=df$size,y=df$scp)
mod<-lm(scp~size,  data=df)
mod1<-summary(mod)
abline(mod)
mod1$r.squared

summary(mod)


