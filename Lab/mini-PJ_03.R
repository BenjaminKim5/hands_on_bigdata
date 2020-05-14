##
## mini Project 03 : 랜덤 숫자 맞추기 게임
##    (1) function 만들기
##  R-3.6.3 (OK), R-4.0.0 (Error)   
## update: 19.12.11
## update: 20.05.12

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

# 02-1 숫자 추측 게임을 GuessGame() 함수 구현
GuessGame <- function() {
  # 프로그램 답을 1~100의 숫자 중 랜덤 지점
  target_num <- sample(1:100, 1)
  
  # 숫자 추측 게임 시작
  print("+++ 숫자 맞추기 게임 (Guessing Game) +++")
  
  # 답을 맞추거나 반복 횟수가 10회가 넘지 않을 때까지 반복
  for(loop in 1: 10){
    #print("숫자를 맞춰보세요")
    cat("숫자를 맞춰보세요(", loop,")")
    
    # 게이머 답 입력
    guess_num <- scan(n=1)

    # 프로그램 답과 게이머 답 비교 후 겨로가 메세지 출력
    if(guess_num == target_num) {
      cat("출하합니다. 정답니다.", loop, "번만에 맞첬습니다.")
      break
    } else if (guess_num < target_num) {
      print("답은 더 큰 숫자입니다.")
    } else  {
      print("답은 더 작은 숫자입니다.")
    }
  }
}

## 02-2 실행
GuessGame()
  
## END