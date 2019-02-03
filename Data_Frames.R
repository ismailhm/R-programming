
# Importing Data set in R

# method-01: select the file manually

stats <- read.csv(file.choose())
stats

# method-02: Set working directory and then read the data

getwd()

setwd("D:\\STUDY\\Certifications\\R-for-DataAnalysis") 

stats <- read.csv("DemographicData.csv")
stats


# ----------------------------Exploring Data

stats
nrow(stats)
ncol(stats)
head(stats)
tail(stats)
head(stats, n=10)
tail(stats, n= 7)
str(stats)

# "str()" stands for structure, "runif()" stands for random variables uniformly distributed

summary(stats)

getwd()

stats <- read.csv("DemographicData.csv")
stats

stats
nrow(stats)
ncol(stats)
head(stats)
tail(stats)
head(stats, n=5)
tail(stats, n= 5)
str(stats)



# ---------------------------- Using $ sign to access information in data frame. 

# $ works in data frame but not in matrices

stats
head(stats)
stats[3,3]
stats[5,4]
stats[3, "Birth.rate"]
stats$Internet.users
stats$Internet.users[4]
stats[,"Internet.users"] # same as "stats$Internet.users"
str(stats)
levels(stats$Income.Group)




# ---------------------------- Basic operations with a data frame

stats[1:10,]  #subsetting
stats[3:9,]
stats[c(4,99),]

# remember how the [] works

stats[1,]
is.data.frame(stats[1,])

stats[,1]
is.data.frame(stats[,1])

stats[,1,drop=F]
is.data.frame(stats[,1,drop=F])

# math operations

head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users


# Add a column

head(stats)

stats$product <- stats$Birth.rate * stats$Internet.users # thats how you add a column


# testing my knowledge

stats$xyz <- 1:5 # this number has to be a multiple of the number of rows in the data
head(stats)
head(stats,12)
head(stats, n=12)

# remove a column

stats$product <- NULL
head(stats)
stats$xyz <- NULL



#------------------------ Filtering data frames

# Filtering is more about rows


head(stats)
fil <- stats$Internet.users < 2
stats[fil,]

stats[stats$Internet.users < 2, ]
stats[stats$Birth.rate > 40, ]

stats[stats$Internet.users < 2 & stats$Birth.rate > 40, ]

stats[stats$Income.Group == "Low income",]
stats[stats$Country.Code == "MLT", ]
stats[stats$Country.Name == "Malta", ]

stats[stats$Country.Name == "Bangladesh", ]
stats[stats$Country.Name == "India", ]
stats[stats$Country.Name == "Pakistan", ]
stats[stats$Country.Name == "Nepal", ]
stats[stats$Country.Name == "Srilanka", ]
stats
stats[stats$Country.Name == "Ghana", ]

#------------------------ Introduction to qplot()



?qplot

library(ggplot2)
?qplot
install.packages("ggplot2")

qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=3)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3))
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(10))
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(5),
      color=I("green"))

qplot(data=stats, x=Income.Group, y=Birth.rate, geom = "boxplot")



#----------------------Visualizing what we need


qplot(data=stats, x=Internet.users, y=Birth.rate)

qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(4))

qplot(data=stats, x=Internet.users, y=Birth.rate, 
      color= I("red"), size=I(4))

qplot(data=stats, x=Internet.users, y=Birth.rate, 
      color= Income.Group, size=I(4))





#-----------------------Creating Data Frames


mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset,
                   Regions_2012_Dataset)

head(mydf)

colnames(mydf) <- c("Country", "Code", "Region")
head(mydf)


rm(mydf)

mydf <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset,
                   Region=Regions_2012_Dataset)
mydf
head(mydf)
tail(mydf)
summary(mydf)



#---------------------- Merging Data Frames


head(stats)
head(mydf)

merged <- merge(stats, mydf, by.x="Country.Code", by.y = "Code")

head(merged)

merged$Country <- NULL
head(merged)

str(merged)

tail(merged)



#---------------------- Visualizing with new split

qplot(data=merged, x=Region, y=Birth.rate)

qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Region, size=I(5))

# 1. shapes

qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Region, size=I(5), shape=I(17))


qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Region, size=I(5), shape=I(25))

qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Region, size=I(5), shape=I(20))

# 2. Transperancy

qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Region, size=I(5), shape=I(20),
      alpha = 0.6)

# 3. Title


qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Region, size=I(5), shape=I(19),
      alpha = 0.7,
      main="Birth rate vs Internet users")


qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Region, size=I(5), shape=I(19),
      alpha = 0.5,
      main="Birth rate vs Internet users")


qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Region, size=I(5), shape=I(19),
      alpha = 0.1,
      main="Birth rate vs Internet users")


qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Region, size=I(5), shape=I(19),
      alpha = 0.6,
      main="Birth rate vs Internet users")


qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Region, size=I(5), shape=I(19),
      alpha = 0.2,
      main="Birth Rate vs Internet Users")

rmarkdown::render("Data_Frames.R","pdf_document")
