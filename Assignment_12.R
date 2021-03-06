library(dplyr)
library(tidyr)
library(stringr)
library(ggplot2)

jhill34<-read.csv("JMHILL.3.4.csv")
jhill2010<-read.csv("JMHILL.5.2.csv")
jhill2018<-read.csv("MBW_for_KNB_2010_to_2018.csv")

full_set<-left_join(jhill2010, jhill2018)


jhill<-jhill2018%>%
  filter(State=="VT")

is.na(jhill$CountGreaterThan50meters)<-which(jhill$CountGreaterThan50meters=="-999")
is.na(jhill$CountLessThanEqual50meters)<-which(jhill$CountLessThanEqual50meters=="-999")
jhill[is.na(jhill)]<-0
is.na(jhill$CountGreaterThan50meters)<-which(jhill$CountGreaterThan50meters=="N/A")
is.na(jhill$CountLessThanEqual50meters)<-which(jhill$CountLessThanEqual50meters=="N/A")
jhill$CountGreaterThan50meters<-as.numeric(jhill$CountGreaterThan50meters)
jhill$CountLessThanEqual50meters<-as.numeric(jhill$CountLessThanEqual50meters)


#Treat NA's and -999 as 0's for now, but might even need to filter them from the data depending on significance. 
#Data_summary: Input: Data File, variable name (usually Count), and grouping variables. 

data_summary <- function(data, varname, groupnames){
  require(plyr)
  summary_func <- function(x, col){
    c(mean = mean(x[[col]], na.rm=TRUE),
      sd = sd(x[[col]], na.rm=TRUE))
  }
  data_sum<-ddply(data, groupnames, .fun=summary_func,
                  varname)
  data_sum <- rename(data_sum, c("mean" = varname))
  return(data_sum)
}

plot<-jhill%>%
  drop_na()%>%
  group_by(Year,SpeciesCode, PointCountPeriodCode)%>%
  dplyr::summarize(Count=sum(CountLessThanEqual50meters, CountGreaterThan50meters))

df<-data_summary(plot, varname="Count", groupnames=c("Year", "SpeciesCode"))


ggplot(data= df, mapping=aes(x=Year, y=Count))+geom_point(aes(color=SpeciesCode))+geom_line(linetype=2)+facet_wrap(~SpeciesCode, ncol=4, scales = "free")+theme_light()+geom_errorbar(aes(ymin=Count-sd, ymax=Count+sd),width=.4, position=position_dodge(0.05))+ylab("Mean Bird Counts Per Point")+theme(axis.text.x=element_text(angle=45, hjust=1))
