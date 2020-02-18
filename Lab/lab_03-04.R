##
## lab_03_04.R : 공공 데이터 활용 가이드 
##
## update: 20.02.18

## 기본환경 설정
getwd()
setwd("D:/500_Lab/Lab200219/Lab")
getwd()

## enviroment clean: 환경데이터 제거하기
rm(list=ls())
## Plots clean: Plot  제거하기
#dev.off()
if(!is.null(dev.list())) dev.off()

## https://www.data.go.kr/

# Sys.setlocale("LC_ALL", "korean")

## CSV 데이터
## 검색: 건강검진정보
##
library(readr)
library(dplyr)
data1 <- read_csv("data/NHIS_OPEN_GJ_2017.CSV", 
            locale = locale(encoding = "euc-kr"))
View(data1)
tmp <- data1 %>% group_by(시도코드) %>% summarise(건수 = n())

plot(tmp$시도코드, tmp$건수)

## 엑셀 데이터
## 검색: 국토교통부_우수물류기업인증정보 
##
library(readxl)
data <- read_excel("data/종합물류기업인증_190522.xls")
View(data)

## END ##
