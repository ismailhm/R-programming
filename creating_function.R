

myplot <- function(){
  data <- MinutesPlayed[1,, drop=F]
  matplot(t(data), type="b", pch=15:18, col=c(1:4, 6))
  legend("bottomleft", inset = 0.01, legend = Players[1], pch=15:18, col=c(1:4, 6), horiz = F)
}

myplot()


myplot <- function(){
  data <- MinutesPlayed[2:3,, drop=F]
  matplot(t(data), type="b", pch=15:18, col=c(1:4, 6))
  legend("bottomleft", inset = 0.01, legend = Players[2:3], pch=15:18, col=c(1:4, 6), horiz = F)
}

myplot()


myplot <- function(rows){
  data <- MinutesPlayed[rows,, drop=F]
  matplot(t(data), type="b", pch=15:18, col=c(1:4, 6))
  legend("bottomleft", inset = 0.01, legend = Players[rows], pch=15:18, col=c(1:4, 6), horiz = F)
}

myplot(1:5)

myplot(1:10)

myplot1 <- function(rows){
  
  data <- Games[rows,, drop=F]
  matplot(t(data), type="b", pch=15:18, col=c(1:4, 6))
  legend("bottomleft", inset = 0.01, legend = Players[rows], pch=15:18, col=c(1:4, 6), horiz = F)
  
}

myplot1(1:10)


myplot2 <- function(data, rows){
  
  data <- data[rows,, drop=F]
  matplot(t(data), type="b", pch=15:18, col=c(1:4, 6))
  legend("bottomleft", inset = 0.01, legend = Players[rows], pch=15:18, col=c(1:4, 6), horiz = F)
  
}

myplot2(Salary, 1:10)


myplot2 <- function(data, rows=1:10){
  
  data <- data[rows,, drop=F]
  matplot(t(data), type="b", pch=15:18, col=c(1:4, 6))
  legend("bottomleft", inset = 0.01, legend = Players[rows], pch=15:18, col=c(1:4, 6), horiz = F)
  
}

myplot2(Games)



f <- function(vector=1:3){
  
  vector*5
}

f(c(1,1,1))

f()

f()+f(c(1,1,1))
