##
## mini Project 03d : 랜덤 숫자 맞추기 게임
##    (1) function 만들기
##    (2) 10회에 오류 => 오류 메세지 표시
##    (3) 함수에 난수 생성 범위 설정 (인수 추가)
##    (4) readline 이용해서 종료여부 추가
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
# GuessGame(램덤수 시작값(st), 램덤수 종료값(ed))
GuessGame <- function(st, ed) {
  # 프로그램 답을 1~100의 숫자 중 랜덤 지점
  target_num <- sample(st:ed, 1)
  
  # 숫자 추측 게임 시작
  print("+++ 숫자 맞추기 게임 (Guessing Game) +++")
  
  # 답을 맞추거나 반벅회수가 5회가 넘지 않을 때까지 반복
  idx <- 0
  while(TRUE){
    idx <- idx + 1
    
    #print("숫자를 맞춰보세요")
    cat("숫자를 맞춰보세요(", idx,")")
    
    # 게이머 답 입력
    guess_num <- scan(n=1)

    # 프로그램 답과 게이머 답 비교 후 겨로가 메세지 출력
    if(guess_num == target_num) {
      cat("출하합니다. 정답니다.", idx, "번 만에 맞첬습니다.")
      break
    } else if (guess_num < target_num) {
      print("답은 더 큰 숫자입니다.")
    } else  {
      print("답은 더 작은 숫자입니다.")
    }
    
    yn <- readline(prompt = '게임을 종료할 것인가(y/n) ')

    if (toupper(yn) == 'Y') {
      cat("==> 아쉽지만 정답은 ", target_num, "입니다")
      break
    }
  }
}

## 02-2 실행
GuessGame(1, 5)

## END