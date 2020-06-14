##
## 수배송 데이터 분석 
## 
## update: 20.06.14
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
dv_data[is.na(dv_data)] <- 0

# 운행시간 및 거리의 데이터 값의 분포현황 
plot(dv_data$운행거리)
plot(dv_data$운행시간)

#  
ggplot(data=dv_data, aes(x=운행거리,y=운행시간)) +
  geom_point(size=1.5, color="blue") +
  geom_abline()

# 경사도(slope) 조정
ggplot(data=dv_data, aes(x=운행거리,y=운행시간)) +
  geom_point(size=1.5, color="blue") +
  geom_abline(slope=1.2)

# 세로선(geom_vline) 추가: 운행거리 범위 표시=100,200,300 Km 
ggplot(data=dv_data, aes(x=운행거리,y=운행시간)) +
  geom_point(size=1.5, color="blue") +
  geom_vline(xintercept=100, colour="grey", lty="dashed", size=1) +
  geom_vline(xintercept=200, colour="grey", lty="dashed", size=1) +
  geom_vline(xintercept=300, colour="red", lty="dashed", size=1) +
  geom_abline(slope=1.2)

# 가로선(geom_hline) 추가: 운행시간 범위 표시=120, 240, 480 분 
ggplot(data=dv_data, aes(x=운행거리,y=운행시간)) +
  geom_point(size=1.5, color="blue") +
  geom_hline(yintercept=120, colour="grey", lty="dashed", size=1) +
  geom_hline(yintercept=240, colour="grey", lty="dashed", size=1) +
  geom_hline(yintercept=480, colour="red", lty="dashed", size=1) +
  geom_abline(slope=1.2)

# 운행거리 및 시간을 동시 표시
ggplot(data=dv_data, aes(x=운행거리,y=운행시간)) +
  geom_point(size=1.5, color="blue") +
  geom_hline(yintercept=120, colour="grey", lty="dashed", size=1) +
  geom_hline(yintercept=240, colour="grey", lty="dashed", size=1) +
  geom_hline(yintercept=480, colour="red", lty="dashed", size=1) +
  geom_vline(xintercept=100, colour="grey", lty="dashed", size=1) +
  geom_vline(xintercept=200, colour="grey", lty="dashed", size=1) +
  geom_vline(xintercept=300, colour="red", lty="dashed", size=1) +
  geom_abline(slope=1.25, color='deepskyblue2', size=1) +
  annotate("rect", xmin = 0, xmax = 50, ymin = 0, ymax = 120,
           alpha = .2) +
  ggtitle('Delivery distance data: Delivery time')+       # 제목
  theme_bw()+                                             # 배경색
  theme(plot.title=element_text(size=17, hjust = 0.5, color='violetred'),
        axis.title=element_text(size=13),
        axis.title.y=element_text(angle=0),
        axis.text.x=element_text(angle=90, size=13))      # 테마

# 최대 운행거리의 배송처 찾기
tIdx <- which.max(dv_data$운행거리)
tIdx
tDevDis01 <- dv_data$운행거리[tIdx]
tDevTime01 <- dv_data$운행시간[tIdx]
tDevCode01 <- dv_data$배송처코드[tIdx]

ggplot(data=dv_data, aes(x=운행거리,y=운행시간)) +
  geom_point(size=1.5, color="blue") +
  geom_hline(yintercept=120, colour="grey", lty="dashed", size=1) +
  geom_hline(yintercept=240, colour="grey", lty="dashed", size=1) +
  geom_hline(yintercept=480, colour="red", lty="dashed", size=1) +
  geom_vline(xintercept=100, colour="grey", lty="dashed", size=1) +
  geom_vline(xintercept=200, colour="grey", lty="dashed", size=1) +
  geom_vline(xintercept=300, colour="red", lty="dashed", size=1) +
  geom_abline(slope=1.25, color='deepskyblue2', size=1) +
  annotate("segment", x=tDevDis01-15, xend=tDevDis01-1, 
           y=tDevTime01-110, yend=tDevTime01-5, size=1.5, colour="red", arrow=arrow()) +
  annotate("text", x=tDevDis01-15, y=tDevTime01-120, 
           size=6, colour="red", label=tDevCode01) +
  ggtitle('Delivery distance data: Delivery time')+       # 제목
  theme_bw()+                                             # 배경색
  theme(plot.title=element_text(size=17, hjust = 0.5, color='violetred'),
        axis.title=element_text(size=13),
        axis.title.y=element_text(angle=0),
        axis.text.x=element_text(angle=90, size=13))      # 테마


## --End--

