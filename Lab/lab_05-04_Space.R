##
## 공간 가시화
## 
##

# Sys.setlocale("LC_ALL", "korean")
# install.packages("ggplot2")

library(readxl)
library(ggplot2)

getwd()
setwd("C:/500_Lab/Lab190522/Lab")
getwd()


## Step 1: 원본 데이터 가져오기
psi_master <- read_excel("data/PSI_master.xlsx", sheet="Sheet1")
View(psi_master)

psi_data <- read_excel("data/PSI_data.xlsx")
View(psi_data)

## If 데이터에 NA 값을 0 로 수정
# psi_data[is.na(psi_data)] <- 0

library(dplyr)
tmp <- inner_join(psi_data, psi_master)
tmp$V_보관장 <- tmp$재고량 * tmp$보관장체적


# install.packages("treemap")
library(treemap)

## 생산량기준 공간
treemap(tmp, index = "품목명", vSize = "생산량", vColor = "생산량", type = "value")

## 보관장체적
treemap(tmp, index = "품목명", vSize = "보관장체적", vColor = "보관장체적", type = "value")

## 보관장내의 상품
treemap(tmp, index = "품목명", vSize = "보관장", vColor = "V_보관장", type = "value")

## --End--

