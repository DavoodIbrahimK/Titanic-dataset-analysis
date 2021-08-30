#1) Load data 
df = read.csv("Titanic.csv")

#2)print first 10 row
head(df,10)
#print last 10 row
tail(df,10)

#3)print all columns

colnames(df)

#4)shape of tha data
ncol(df)
nrow(df)
dim(df)

#5)information and summary
summary(df)

#6) data type
str(df)

#7)Count Survived and show on pie chart

a=table(df$Survived)
pct=round(a/sum(a)*100)
z=c("Not Survived","Survived")
lbs=paste(z,":= ",pct,"%")
pie(a,labels = lbs)

library(ggplot2)

ggplot(df,aes(x=Survived))+geom_bar(fill=c("red","green"))+coord_polar()

#8)Find out how many female passengers and travelled in first class and show in pie chart
library(plotrix)
n=subset(df,Sex=="female")
a=table(n$Pclass)

pct=round(a/sum(a)*100)
z=c("1st","2nd","3rd")
lbs=paste(z,":= ",pct,"%")
pie3D(a,labels = lbs,radius = 2,shade = TRUE,explode = 0.5)

#9) Find out how many female passengers had Survived and her age <30, show on pie chart and bar graph

f=subset(df,Sex=="female"& Age<30)

count=table(f$Survived)
count=c(42,105)
ggplot(f,aes(Survived))+geom_bar(fill=c("red","green"))+
  geom_text(stat="count",aes(label=stat(count),vjust=-0.5))

#10) Find out how many male passengers had Survived and his age >40, show on pie chart
m=subset(df,Sex=="male" & Age>40)
ggplot(m,aes(Survived))+geom_bar(fill=c("red","green"))+
  geom_text(stat="count",aes(label=stat(count),vjust=-0.5))

#11)null values
#is.null(df)
#is.na(df)

sum(is.na(df))

#12) Show Bar graph for Survived with male, female, class
ggplot(subset(df,Survived==1),aes(x=Pclass,fill=Sex))+geom_bar()+
  labs(title="Survived Passengers")
ggplot(subset(df,Survived==0),aes(x=Pclass,fill=Sex))+geom_bar(position = "dodge")+
  labs(title="Not Survived Passengers")+geom_text(stat="count",aes(label=stat(count),vjust=-0.5))

#13) Show Bar graph for Survived with 3rd class male, 1st class female
ggplot(subset(df,Survived==1),aes(x=Pclass,fill=Sex))+geom_bar()+
  labs(title="Survived Passengers")+
  geom_text(stat="count",aes(label=stat(count),vjust=-0.5))

#15) Replace Null value to Median value

sum(is.na(df$Age))

mean(df$Age,na.rm = TRUE)
sum(df$Age,na.rm = TRUE)

n_Age=subset(df,is.na(Age))

df[is.na(df$Age),]$Age<-26.5



