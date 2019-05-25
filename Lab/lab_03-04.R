##
## 공공 데이터 활용 가이드 
##
##

## https://www.data.go.kr/

# Sys.setlocale("LC_ALL", "korean")

## CSV 데이터
## 검색: 건강검진정보
##

library(readr)
data1 <- read_csv("data/NHIS_OPEN_GJ_2017.CSV", 
                              locale = locale(encoding = "euc-kr"))
View(data1)
plot(data1$시도코드)

## 엑셀 데이터
## 검색: 국토교통부_우수물류기업인증정보 
##
library(readxl)
data <- read_excel("data/종합물류기업인증_190522.xls")
View(data)


