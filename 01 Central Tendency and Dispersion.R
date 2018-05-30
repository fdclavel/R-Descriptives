#################################
#R descriptive statistics script#
#################################

#----------------------------------------------------
#this script will allow the following basic analyses:
#----------------------------------------------------
#Descriptive Statistics (means, SD, etc)


########## MOUNTING STEPS ##########

#use the haven package to load whichever SAS/SPSS/.dat 
#data set you need to use in R.
library("haven")

#set working directory and import your data set.
setwd("C:/Users/fdclavel/Documents/Dissertation/Data/(Working Data Sets)")
CDS <- read_sav("Couples Diary Study v10.sav")

#mount the psych package to run descriptives.4
library("psych")

########## END MOUNTING STEPS ######


##INDIVIDUAL DESCRIPTIVES for K variables (writing to an object and csv export)
#describe(dataset [c("var1","var2",..."var_k")])
desc <- describe(CDS[c("dSUPprovTOT","pdSuppSatTOT")])
write.csv(desc, file="desc.csv")
