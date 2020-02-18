##
## lab_03_02.R : SCperf function
##
## update: 20.02.18

## 연간 수요량(Demand) d = 8000 EA
## 주문당 고정 비용(Setup Cost) k = 12000 USD
## 제품당 보유비용(Holding Cost) h =  0.3 USD
## 단위당 페널티 비용(Penalty Cost) b = 0

# install.packages("SCperf")
library("SCperf")

## EOQ: Economic Order Quantity model
## T = Q/D
## TVC = 
EOQ(8000, 12000, 0.3)

EOQ(8000, 12000, 0.3, 1.1)

EOQ(60000, 200, 0.96)

## EPQ:Economic Production Quantity model
EPQ(d=200,p=1000,k=100,h=5)


## Newsboy: The newsboy model
Newsboy(100,30,4,1)

Newsboy(100,20,4,1)

## RDP: Reorder Point
ROP(0.9,2500,500,6)

## SS: Safety Stock
SS(0.95,0.7,2)

## WW: The Wagner-Whitin algorithm
x <- c(3,2,3,2)
a <- 2
h <- 0.2
WW(x,a,h,method="backward")


WW(x,a,h,method="forward")

## END ##
