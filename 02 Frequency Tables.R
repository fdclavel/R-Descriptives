#################################
#R descriptive statistics script#
#################################

#----------------------------------------------------
#this script will allow the following basic analyses:
#----------------------------------------------------
#Frequency Tables for Categorical (Nominal/Ordinal) Variables


########## MOUNTING STEPS ##########

#use the haven package to load whichever SAS/SPSS/.dat 
#data set you need to use in R.
library("haven")

#set working directory and import your data set.
setwd("C:/Users/fdclavel/Documents/Dissertation/Data/(Working Data Sets)")
CDS <- read_sav("Couples Diary Study v10.sav")

#mount the plyr package to run frequency table.
library("plyr")
#mount the gmodels package  to run crosstabs.
library("gmodels")

########## END MOUNTING STEPS ######


##Frequency Statistics for Single Variable
freq <- count(CDS, 'bYEARschool')
write.csv(freq, file="freq.csv")

##CrossTabs
#Need a variables with labeled values for each level. Created below.
CDS$bYEAR.names <-factor(CDS$bYEARschool,
                         levels = c(1,2,3,4,5,6,7),
                         labels = c("Freshman","Sophomore","Junior","Senior",
                                    "5th Year Undergrad or More", 
                                    "Graduate or Professional Student",
                                    "Other"))

CDS$bFemale.names <- factor(CDS$bFemale,
                            levels = c(0,1),
                            labels = c("Male", "Female"))

#Create the Crosstab table and save as a csv file in working dir.
cross <- table(CDS$bYEAR.names, CDS$bFemale.names)
write.csv(cross, file="crosstab.csv")

