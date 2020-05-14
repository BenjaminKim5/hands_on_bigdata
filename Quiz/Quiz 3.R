##
## Quiz 3.R : Quiz 3
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
# install.packages("reshape2")
# install.packages("dplyr")
library(readxl)
library(reshape2)
library(dplyr)

## Step 2: read 5월 수불
m5_data <- read_excel("data/m5_data.xlsx")
View(m5_data)

## Step 3: 입출고수불 추출, 데이터구조 변경 (X=ID, Y=YMD)
in_data <- m5_data %>% select (YMD, ID, IN_QTY)
head(in_data)
in_data <- dcast(in_data, ID ~ YMD)
head(in_data)

ot_data <- m5_data %>% select (YMD, ID, OUT_QTY)
head(ot_data)
ot_data <- dcast(ot_data, ID ~ YMD)
head(ot_data)

## Step 4: YMD Grouping => 입출고 평균, 합계  
m5_data %>% group_by(YMD) %>% 
  summarise(OT_MEAN = mean(OUT_QTY), OT_SUM=sum(OUT_QTY))

m5_data %>% group_by(YMD) %>% 
  summarise(IN_MEAN = mean(IN_QTY), IN_SUM=sum(IN_QTY))


## Step 5: 필터:
# library(dplyr)
filter(in_data, 20190405 >= 80) %>% summarise(n())

## Step 6: 정렬
## arrange(데이터명, 정렬할 변수명1, 정렬할 변수명2)
## desc(x) 내림차수, X 오름차순
head(m5_data)
head(arrange(m5_data, desc(IN_QTY), OUT_QTY))
# arrange(m5_data, desc(IN_QTY), OUT_QTY)

## Step 7:
## summarise(dataframe, mean, sd, ...) : 수치형 값에 대한 요약 통계량 계산
## n()은 데이터가 몇 행으로 되어 있는지 ’빈도’를 구하는 기능
m5_data %>% filter(IN_QTY > 80 & OUT_QTY >= 85) %>% summarise(n())

## END ##