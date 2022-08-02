# radius = 1, Equilateral triangle side = sqrt(3)

simulate <- function(hypotenuse_selection_method){
	number_of_trials <-10000
	trials <- 1:number_of_trials
	side_length <- sqrt(3)
	trials <- sapply(trials, function(x) hypotenuse_selection_method() >= side_length)
	return(length(trials[trials == TRUE])/length(trials))
}

method_1 <- function(){
	p1 <- runif(1, 0, 2*pi)
	p2 <- runif(1, 0, 2*pi)
	angle <- min(abs(p1-p2), 2*pi - abs(p1-p2))
	return(2 * sin(angle/2))
}

method_2 <- function(){
  angle <- runif(1, 0, 2*pi) # not used, in case you believe in karma
  r <- runif(1, 0, 1)
	return(2*sqrt(1-r^2))
}

method_3 <- function(){
  area_scaled <- runif(1, 0, 1)
  r <- sqrt(area_scaled)
  angle <- runif(1, 0, 2*pi)
  return(2*sqrt(1-r^2))
}

cat('probabitly calculated by simulation for method1: ', simulate(method_1))
# in theory = 1/3

cat('probabitly calculated by simulation for method2: ', simulate(method_2))
# in theory = 1/2

cat('probabitly calculated by simulation for method3: ', simulate(method_3))
# in theory = 1/4
