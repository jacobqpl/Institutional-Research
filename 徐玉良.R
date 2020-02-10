counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- gl(3,1,9)
treatment <- gl(3,3)
print(d.AD <- data.frame(treatment, outcome, counts))
glm.D93 <- glm(counts ~ outcome + treatment, family = poisson())
anova(glm.D93)
summary(glm.D93)



?tidyverse
install.packages("tidyverse")
library(tidyverse)

getwd()
setwd("D:/R")
normalized_counts <- read.table(file = "normalized_counts.txt")
res_tableOE <- read.table(file = "Mov10oe_DE_results.txt", row.names = 1)
head(normalized_counts)


#Use R to solve Stata problems
install.packages("foreign")
library(foreign)
IowaData = read.dta("D:/EDUC 799/Lab/Lab1/Iowa Data File.dta")
dim(IowaData)
NewIowaData <- IowaData[,sort(names(IowaData))]




cname = c("aaa", "bab", "acd")
sort(cname)
vec = data.frame(1,2,3)
names(vec) = cname
vec
vec[,sort(cname)]
