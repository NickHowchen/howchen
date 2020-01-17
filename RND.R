library(plotly)
library(scatterplot3d)


Matrix<-matrix(c(4,5,7,8,9,10,11,12),2,4)


plot(Matrix[1,1], Matrix[2,3])
for (n in 1:4){
points(Matrix[2,n], 3)
}



scatterplot3d(Matrix)





# Data generation
x  <- seq(-2, 2, 0.05)
y1 <- pnorm(x)
y2 <- pnorm(x,1,1)
df <- data.frame(x,y1,y2)

require(ggplot2)

ggplot(df, aes(x)) +                    # basic graphical object
  geom_line(aes(y=y1), colour="red") +  # first layer
  geom_line(aes(y=y2), colour="green")  # second layer

g <- ggplot(df, aes(x))
g <- g + geom_line(aes(y=y1), colour="red")
g <- g + geom_line(aes(y=y2), colour="green")
g

