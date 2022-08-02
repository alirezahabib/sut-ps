data("mtcars")
cars = mtcars
cars

#### A ####
cars$cyl <- sapply(cars$cyl, function(x) 2*x)

#### B ####
aggregate(cars,by=list(cars$disp),FUN=median)

#### C ####
random_shuffle <- function(df) df[sample(1:nrow(df)), ]
get_top_rows_variance <- function(df, n, col) var(df[1:n, col])

sapply(1:nrow(cars), function(i) 
  get_top_rows_variance(cars <- random_shuffle(cars), i, "disp"))

# setwd("~/SUT/Probability_Statistics/HW1-Practical/")
df <- read.csv("data.csv")

#### D ####
Sweeties_Source <- subset(df, Sweet > 2.5)$Source

#### E ####
print(ifelse("Pioneer" %in% Sweeties_Source, "yes", "no"))
