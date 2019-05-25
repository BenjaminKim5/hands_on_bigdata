## [Quiz 2]
##
##  YMD, ID, IN, OUT
##


# install.packages("readxl")
# install.packages("reshape")
library(readxl)
library(reshape)

getwd()
setwd("C:/500_Lab/Lab190522/Lab")
getwd()

## Step 2:
m3_data <- read_excel("data/m3_data.xlsx")
m3_data <- rename(m3_data, M3_IN_QTY = IN, M3_OT_QTY = OUT)
View(m3_data)

## Step 3:
m4_data <- read_excel("data/m4_data.xlsx")
m4_data <- rename(m4_data, M4_IN_QTY = IN, M4_OT_QTY = OUT)
View(m4_data)

## Step 4:
library(dplyr)
total_data <- inner_join(m3_data, m4_data, by = "ID")
View(total_data)

## Step 5:
total_data$IN_AVG <- (total_data$M3_IN_QTY + total_data$M3_IN_QTY)/2
total_data$OT_AVG <- (total_data$M4_OT_QTY + total_data$M4_OT_QTY)/2
View(total_data)

## Step 6:
total_data$TOT_AVG <- (total_data$M3_IN_QTY + total_data$M4_IN_QTY + total_data$M4_OT_QTY + total_data$M4_OT_QTY)/4

## Step 7:
mean(total_data$IN_AVG)
mean(total_data$OT_AVG)

## Step 8:
total_data %>% filter(IN_AVG >= 80 & OT_AVG >= 90)

## Step 8:
boxplot(total_data$IN_AVG, total_data$OT_AVG)
