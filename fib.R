# naive solution #

fib_recursive <- function(n){
  if (n <= 1){
    return (n)
  }
  return (fib_recursive(n-1) + fib_recursive(n-2))
}

fib_efficient <-function(n){
  if(n < 2 ){
    return(n)
  }
  a <- 0
  b <- 1
  range <- n-1
  for( i in 1:range) {
    a <- b
    b <- a + b
  }
  return (a)
}

some <- fib_efficient(3)

horse1 <- replicate(1000, unname(system.time( fib_recursive(10) ))[1])
horse2 <- replicate(1000, unname(system.time( fib_efficient(10) ))[1])
mean(horse1)
mean (horse2)

horse1_av <- cumsum(horse1) / seq_along(horse1)
horse2_av <- cumsum(horse2) / seq_along(horse2)

topY <- max(horse1_av, horse2_av)
lowY <- min(horse1_av, horse2_av)

plot(horse1_av, type = "l", col = "red", ylim = c(lowY, topY), 
     xlab = "distance", ylab = "average time")
lines(horse2_av, col = "blue")




