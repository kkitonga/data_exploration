
#===================AFFIRMATIONS AND PLAYSLIST==========----

#UNATHAMINIKA! 
#YOU ARE PRECIOUS!
#Playlist:ROKIA TRAORE
#https://www.youtube.com/watch?v=GdfXY3h1CHs

#====================INTRODUCTION======================----

#Script details----

#Prepared by: kkitonga
#script content :Dplyr
#link to DPLYR handbook:https://cloud.r-project.org/web/packages/dplyr/dplyr.pdf
#Date prepared:13/06/2022

#=====================LOAD LIBRARIES====================----
#load library
library(dplyr)
library(DataExplorer)
library(ggplot2)

#==================1.DATA EXPLORATION==================----

#Data
data(storms)
#About
?storms

#Base R
View(storms)
head(storms)
tail(storms)
str(storms)
summary(storms)

#DataExplorer package
create_report(storms)                        #full report


#==========2.FILTER:SUBSETTING AND SORTING DATA=========----

             #Filter function:page 6
             #Arrange function:page 8

#1.Filter rows based on string variable criteria
storms %>% 
 filter(name=="Amy")

#2.Filter rows based on a categorical variable criteria
storms %>%
 filter(category==-1)

#3.Filter rows based on more than one condition

storms%>%
 filter(status=="tropical storm" &  year<1990)


#4.Filter then arrange:data wrangling----

storms %>%
 filter(name %in% c("Amy","Chris","Barry"))%>%
 arrange(desc(pressure))


#=====3:FILTER:SUBSETTING AND SUMMARY STATISTICS===========#

#filter: status==tropical storm and year less than 1990
#summary statistics:mean and sd for variable pressure

storms %>%
 filter(status=="tropical storm" &  year<1990)%>%
 summarize(across(c(pressure),list(mean=mean,sd=sd)))

#filter:only rows where year is less than 1995
#group by:variable category
#summary statistics based on variable pressure

storms%>%
 filter(year<1995)%>%
 group_by(category)%>%
 summarize(across(pressure,list(mean=mean,sd=sd)))

#===========4.FILTER:DATA VISUALIZATION================----

#convert data to tibble
#create time variable and join it to dataset
#subset rows where DAX>2000
#plot graph of DAX AND SMI against time

#data 
data(EuStockMarkets)

EuStockMarkets%>%
 as_tibble()%>%
 mutate(time=1:1860)%>%
 filter(DAX>2000)%>%
 ggplot(aes(time))+
 geom_line(aes(y = DAX), color = "blue") +
 geom_line(aes(y = SMI), color = "green") +  
 labs(x="time in years",title="Time series plot")

#=====================PG 11 :BINDING ===============================#

           #===========BIND COLUMNS===============#

#setting working directory
setwd("C:/Users/Karengi/Desktop/r work/rdata")

#loading data to environment and assigning names----
demography_1 <- read.csv("demography_1_50.csv")
demography_2 <- read.csv("demography_51_100.csv")
social_capital <- read.csv("social_capital_1_50.csv")

#Binding columns----
#Same households but additional variable information
#bind on ID
demography_merge <- bind_cols(demography_1,social_capital,id="HHID")


#Bind rows----
#different observations but same variables----
 
demography_row_merge <- bind_rows(demography_1,demography_2)

#===================================================================#
