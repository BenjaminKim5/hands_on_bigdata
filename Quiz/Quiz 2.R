##
## Quiz 2.R : Quiz 2
##
## update: 20.02.18
## update: 20.05.14

##
##  YMD, ID, IN, OUT
##

## Step 1:
## 기본환경 설정
getwd()
setwd("D:/500_Lab/Lab200515/Lab")
getwd()

## enviroment clean: 환경데이터 제거하기
rm(list=ls())
## Plots clean: Plot  제거하기
#dev.off()
if(!is.null(dev.list())) dev.off()

# install.packages("readxl")
# install.packages("reshape")
# install.packages("dplyr")
library(readxl)
library(reshape)
library(dplyr)

## Step 2: read 3월 수불
m3_data <- read_excel("data/m3_data.xlsx")
View(m3_data)

m3_data <- rename(m3_data, M3_IN_QTY=IN, M3_OT_QTY=OUT)
View(m3_data)

## Step 3: read 4월 수불
m4_data <- read_excel("data/m4_data.xlsx")
View(m4_data)

m4_data <- rename(m4_data, M4_IN_QTY = IN, M4_OT_QTY = OUT)
View(m4_data)

## Step 4: 3월 + 4월 수불 통합
#library(dplyr)
total_data <- inner_join(m3_data, m4_data, by = "ID")
View(total_data)

## Step 5: 통합데이터에서 입고, 출고 평균 만들기
total_data$IN_AVG <- (total_data$M3_IN_QTY + total_data$M3_IN_QTY)/2
total_data$OT_AVG <- (total_data$M4_OT_QTY + total_data$M4_OT_QTY)/2
View(total_data)

## Step 6: 통합데이터에서 입출고평균 만들기
total_data$TOT_AVG <- (total_data$M3_IN_QTY + total_data$M4_IN_QTY + total_data$M4_OT_QTY + total_data$M4_OT_QTY)/4
View(total_data)

## Step 7: 평균
mean(total_data$IN_AVG)
mean(total_data$OT_AVG)

## Step 8: 필터 : 입고평균 >= 80 and 출고평균 >= 90 데이터 추출
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
