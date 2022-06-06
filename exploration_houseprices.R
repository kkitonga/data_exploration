 
#===================AFFIRMATIONS AND PLAYSLIST==========----
 
 #UNATHAMINIKA! 
 #YOU ARE PRECIOUS!
 #Playlist:ROKIA TRAORE
 #https://www.youtube.com/watch?v=GdfXY3h1CHs
 
 #====================INTRODUCTION======================----
 
#Script details----

#Prepared by: kkitonga
#script content :Data exploration
#Date prepared:05/06/2022

#I discovered this through this site:
#https://towardsdatascience.com/four-r-packages-for-automated-exploratory-data-analysis-you-might-have-missed-c38b03d4ee16

 
 #==============PACKAGE INSTALLATION=====================----
 
 #1.ONLY Install packages if you have not----
 install.packages("DataExplorer")

 #====================LOAD LIBRARIES===================----
 
 #2.load libraries
 library(DataExplorer)
 library(AER)                     #load HousePrices data

 #======================LOAD DATA========================----
 
#3.Data to use
data(HousePrices)
 
#====================HTML FULL REPORT===================----
 
#4.creating a data report
create_report(HousePrices)
 
#================5.Specific operations==================----
 
#Understanding data structure
 plot_str(HousePrices)
 
#bar chart each discrete feature
 plot_bar(HousePrices)
 
#plot qq plots for continuous variables
 plot_qq(HousePrices)
 
#plot density plots
 plot_density(HousePrices)
 
#plotting correlation
 plot_correlation(HousePrices)
 
#Principal component annalysis
plot_prcomp(HousePrices) 
 
#========================END===========================----