#Advanced Quantitative Methods
#Homework 1 Part 2
#Justine Keller

source("http://www.openintro.org/stat/data/cdc.R")

#Q1

plot(cdc$weight,cdc$wtdesire)
## There is a slight positive association between weight and desired weight.

#Q2

wdiff <- cdc$wtdesire - cdc$weight

#Q3

##wdiff is a numerical and discrete variable.
##If wdiff is 0 this means that a persons desired weight is equal to a persons weight.
##If wdiff is positive, then that person wants to gain weight. If wdiff is negative that person wants to lose weight.

#Q4

hist(wdiff, breaks = 50)
boxplot(wdiff)
summary(wdiff)
dim(subset(cdc, cdc$weight> cdc$wtdesire))

##wdiff has a median of -10 and a mean of -14.5891
## wdiff is semetrical in shape
## wdiff has a spread of 800, but the majority of cases falling close to -10 lbs
## The majority of people want to lose weight (14.59 lbs on average and 50% want to lose 0 to 21 lbs)
## 12764 people would like to lose weight


#Q5

womenweight <- cdc[cdc$gender == "f",6]
menweight <- cdc[cdc$gender == "m",6]
womenwtdesire <-cdc[cdc$gender == "f",7]
menwtdesire <-cdc[cdc$gender == "m",7]
womenwdiff <- womenwtdesire - womenweight
menwdiff <- menwtdesire - menweight
summary(womenwdiff)
summary(menwdiff)

##men on average want to lose 10.71lbs and have a median of -5lbs.
##women on average want to lose 18.15 lbs and have a median of -10lbs.

boxplot(wdiff ~ cdc$gender)

##There are a large amount of outliers.
##If you look at the data within the wiskers, women have a slgihtly larger spread than the men and lower.
##Women on average have a large range of amount they would like to lose and tend to want to lose more weight than men.

#Q6
mean(cdc$weight)
#mean = 169.683
meanweight <- mean(cdc$weight)

sd(cdc$weight)
#standard Deviation = 40.08097
sdweight <- sd(cdc$weight)

upperlimit <- sdweight + meanweight
lowerlimit <- meanweight - sdweight
weight1sd <- subset(cdc, upperlimit > cdc$weight & cdc$weight > lowerlimit)
nrow(weight1sd)/ nrow(cdc)
#0.7076 is the proportion of people who fall within one standard devation of the mean (70.76%).