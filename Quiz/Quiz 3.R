## [Quiz 3]
##
##  YMD, ID, IN, OUT
##


# install.packages("readxl")
# install.packages("reshape2")
library(readxl)

getwd()
setwd("C:/500_Lab/Lab190522/Lab")
getwd()

## Step 2:
m5_data <- read_excel("data/m5_data.xlsx")
View(m5_data)

## Step 3:
library(dplyr)
library(reshape2)

in_data <- m5_data %>% select (YMD, ID, IN_QTY)
in_data <- dcast(in_data, ID ~ YMD)

ot_data <- m5_data %>% select (YMD, ID, OUT_QTY)
ot_data <- dcast(ot_data, ID ~ YMD)

## Step 4:
m5_data %>% group_by(YMD) %>% 
  summarise(OT_MEAN = mean(OUT_QTY), OT_SUM=sum(OUT_QTY))

m5_data %>% group_by(YMD) %>% 
  summarise(IN_MEAN = mean(IN_QTY), IN_SUM=sum(IN_QTY))


## Step 5:
# library(dplyr)
filter(in_data, 20190405 >= 80) %>% summarise(n())

## Step 6:
arrange(m5_data, desc(IN_QTY), OUT_QTY)

## Step 7:
m5_data %>% filter(IN_QTY > 80 & OUT_QTY >= 85) %>% summarise(n())

## (END)