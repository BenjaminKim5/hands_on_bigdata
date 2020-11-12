##
## mini Project 02 : 간단한 숫자 맞추기 게임
##      1회 맞추기
## update: 19.12.11
## update: 20.05.12
## update: 20.11.12

## =====================================================
## 01. 환경정보 초기화
## =====================================================

  ## enviroment clean: 환경데이터 제거하기
  rm(list=ls())
  ## Plots clean: Plot  제거하기
  #dev.off()
  if(!is.null(dev.list())) dev.off()

  ## Check 한글 모드 
  Sys.getlocale()
  ## [1] "LC_COLLATE=English_United States.1252;LC_CTYPE=English_United States.1252;LC_MONETARY=English_United States.1252;LC_NUMERIC=C;LC_TIME=English_United States.1252"
  Sys.setlocale("LC_ALL", "korean")
  ## [1] "LC_COLLATE=Korean_Korea.949;LC_CTYPE=Korean_Korea.949;LC_MONETARY=Korean_Korea.949;LC_NUMERIC=C;LC_TIME=Korean_Korea.949"

## =====================================================
## 02. Main
## =====================================================

# 프로그램 답 지정
  target_num <- 123

# 숫자 추측 게임 시작
  print("+++ 숫자 맞추기 게임(Guessing Game) +++ ")
  print("숫자를 맞춰보세요 ")
  
# 게이머 답 입력
  guess_num <- scan(n=1)
    
# 프로그램 답과 게이머 답 비교 후 겨로가 메세지 출력
  if(guess_num == target_num) {
    print("출하합니다. 정답니다.")
  } else {
    print("아쉽지만 답이 아닙니다.")
  }

## END
# ====<< 조건문 정리 >>============
# if (조건1) {
#   조건1을만족할때 실행 코드  
# } else if (조건2) {
#   조건2을 만족할때 실행 코드 
# } else {
#   조건1, 2를 모두 만족하지 않았때 실행 코드 
# }
# 
#
# ===============================

# other ...
 tt <- ifelse(guess_num == target_num, 
              "출하합니다. 정답니다." , 
              "아쉽지만 답이 아닙니다." )  
  print(tt)
  