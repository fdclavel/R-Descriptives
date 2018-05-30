#################################
#R descriptive statistics script#
#################################

#----------------------------------------------------
#this script will allow the following basic analyses:
#----------------------------------------------------
#Univariate Histograms
#Univariate Histograms by Group
#Multivariate Histograms


########## MOUNTING STEPS ##########

#use the haven package to load whichever SAS/SPSS/.dat 
#data set you need to use in R.
library("haven")

#set working directory and import your data set.
setwd("C:/Users/fdclavel/Documents/Dissertation/Data/(Working Data Sets)")
CDS <- read_sav("Couples Diary Study v10.sav")

########## END MOUNTING STEPS ######


##BASIC UNIVARIATE HISTOGRAM (and export to jpeg)

#hist(var1)
jpeg('hist_basic.jpg')
hist(CDS$dSUPprovTOT)
dev.off()



##RICH UNIVARIATE HISTOGRAM (and export to jpeg)

jpeg('hist_rich.jpg')
hist(CDS$dSUPprovTOT, freq=TRUE, 
     xlab="Daily Support Provided",                 #label X axis
     ylab = "Number of Responses",                #label Y axis
     col = "darkblue",                            #bar color
     main="Distribution of Daily Support Provision")#Graph title
dev.off()



##BASIC MULTIVARIATE HISTOGRAM (and export to jpeg)

#hist(var1)
jpeg('hist_basic_multi.jpg')
par(mfrow=c(2,2))
hist(CDS$dSUPprovTOT)
hist(CDS$dNEGMOODp)
hist(CDS$dNEGMOODs)
hist(CDS$pdSuppSatTOT)
dev.off()


##RICH MULTIVARIATE PANEL HISTOGRAMS for K variables (and export to jpeg).
### MUST RUN LINES 61 to 89 in entirety to generate panel histogram.

jpeg('hist_rich_multi.jpg')
par(mfrow=c(2,2))                          #define rXc size for plot

hist(CDS$dSUPprovTOT, freq=TRUE,           #histogram for variable 1
     xlab="Daily Support Provided",                 #label X axis
     ylab = "Number of Responses",                #label Y axis
     col = "blue",                            #bar color
     main="Distribution of Daily Support Provision")#Graph title

hist(CDS$dNEGMOODp, freq=TRUE,           #histogram for variable 2
     xlab="Daily Partner Negative Mood",                 #label X axis
     ylab = "Number of Responses",                #label Y axis
     col = "yellow",                            #bar color
     main="Distribution of Daily Partner Negative Mood")#Graph title

hist(CDS$dNEGMOODs, freq=TRUE,           #histogram for variable 3
     xlab="Daily Provider Negative Mood",                 #label X axis
     ylab = "Number of Responses",                #label Y axis
     col = "red",                            #bar color
     main="Distribution of Daily Provider Negative Mood")#Graph title

hist(CDS$pdSuppSatTOT, freq=TRUE,           #histogram for variable k
     xlab="Daily Recipient Satisfaction with Support",     #label X axis
     ylab = "Number of Responses",                #label Y axis
     col = "green",                            #bar color
     main="Distribution of Daily Partner Satisfaction w Support")#Graph title

par(mfrow=c(1,1))                          #reset rXc size to 1 for future plots
dev.off()


