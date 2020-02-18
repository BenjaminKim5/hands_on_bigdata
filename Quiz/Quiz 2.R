##
## Quiz 2.R : Quiz 2
##
## update: 20.02.18

##
##  YMD, ID, IN, OUT
##

## Step 1:
## 기본환경 설정
getwd()
setwd("D:/500_Lab/Lab200219/Lab")
getwd()


# install.packages("readxl")
# install.packages("reshape")
# install.packages("dplyr")
library(readxl)
library(reshape)
library(dplyr)

## Step 2:
m3_data <- read_excel("data/m3_data.xlsx")
View(m3_data)

m3_data <- rename(m3_data, M3_IN_QTY=IN, M3_OT_QTY=OUT)
View(m3_data)

## Step 3:
m4_data <- read_excel("data/m4_data.xlsx")
View(m4_data)

m4_data <- rename(m4_data, M4_IN_QTY = IN, M4_OT_QTY = OUT)
View(m4_data)

## Step 4:
#library(dplyr)
total_data <- inner_join(m3_data, m4_data, by = "ID")
View(total_data)

## Step 5:
total_data$IN_AVG <- (total_data$M3_IN_QTY + total_data$M3_IN_QTY)/2
total_data$OT_AVG <- (total_data$M4_OT_QTY + total_data$M4_OT_QTY)/2
View(total_data)

## Step 6:
total_data$TOT_AVG <- (total_data$M3_IN_QTY + total_data$M4_IN_QTY + total_data$M4_OT_QTY + total_data$M4_OT_QTY)/4
View(total_data)

## Step 7: 평균
mean(total_data$IN_AVG)
mean(total_data$OT_AVG)

## Step 8: 필터
total_data %>% filter(IN_AVG >= 80 & OT_AVG >= 90)

## Step 9: 상자도표
boxplot(total_data$IN_AVG, total_data$OT_AVG) 
        
boxplot(total_data$IN_AVG, total_data$OT_AVG, 
        col=c("yellow","green"),        #그룹별 색상 지정
        ylim=c(30,100),
        main="Box plot(예시)",          #제목(라벨) 지정
        xlab="업무구분",
        ylab="평균량",
        names=c("입고","출고"))         #names= 범주 이름


## END ##
