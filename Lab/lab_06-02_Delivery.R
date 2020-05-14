##
## 수배송 데이터 분석 
## 
## update: 20.05.14

getwd()
setwd("D:/500_Lab/Lab200515/Lab")
getwd()

Sys.setlocale("LC_ALL", "korean")

# install.packages("readxl")
# install.packages("ggplot2")
# install.packages("dplyr")

library(readxl)
library(ggplot2)
library(dplyr)

## Step 1: 원본 데이터 가져오기
dv_data <- read_excel("data/lab_06-02_delivery_data.xlsx", sheet="Sheet2")
View(dv_data)

## If 데이터에 NA 값을 0 로 수정
dv_data[is.na(dv_date)] <- 0

plot(dv_data$운행거리)
plot(dv_data$운행시간)

ggplot(data=dv_data, aes(x=운행거리,y=운행시간)) +
  geom_point(size=1.5, color="blue") +
  geom_abline()

## --End--

