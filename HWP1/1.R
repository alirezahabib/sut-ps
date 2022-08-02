data("iris")
library("dplyr")

#### A ####
filtered_iris <- filter(iris, 
                        Sepal.Length > 5 &
                        Petal.Length > 3.5 &
                        Species == "virginica")

#### B ####
Rectangularity <- abs(iris[, "Sepal.Width"] - iris[,"Sepal.Length"])
Rectangularity2 <- abs(filtered_iris[, "Sepal.Width"] - filtered_iris[,"Sepal.Length"])

#### C ####
filtered_iris <- cbind(filtered_iris, Rectangularity2)
filtered_iris <-  rename(filtered_iris, Sepal.Rectangularity = Rectangularity2)

# alternatively
filtered_iris$Sepal.Rectangularity <- Rectangularity2


iris$Sepal.Rectangularity <- Rectangularity

#### D ####
filtered_iris <- filtered_iris[order(-filtered_iris$Sepal.Rectangularity),] 
# alternatively  filtered_iris[order(filtered_iris$Sepal.Rectangularity, decreasing = T),]

print(head(filtered_iris, n = 7L))

#### E ####
iris$X <- rowMeans(iris[,c("Sepal.Rectangularity", "Petal.Length", "Petal.Width")]) < 5

#### F ####
options(max.print=999999)
print(data.matrix(iris))
