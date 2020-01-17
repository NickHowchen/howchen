
#Read in files
#-check directory to count files and get their names 
#-loop through files reading each into temp array
#- remove metadata, <0 length, s/as columns
#-add remaining column to main array
#-add one column of lengths somehow

#End with Matrix of 
#[X, T1, T2, Tn]
#[Y, T1B	Tn]
#[Z		  ]
#
#plot each T column against X
#
#
#
#
#
#
#
#==stretch goals==
# statistics on values max/min/std dev/variance
# points3d

points3d

a <- c(1,2,3,4,4,3,2,1) # a => filein
# process file to remove rows until [n,1] > 0
# process file to remove stokes and stokes colums

https://stat.ethz.ch/R-manual/R-devel/library/base/html/list.files.html


Z <- matrix(a, c(2,2,2))
# process into a(X,Y,M)
#read in next file and repeat for a(X,Y,M+1)

p <- plot_ly(z = Matrixin) %>% add_surface()
p

# must be matrix to work with plot ly

setwd("/my/new/path)



filein <- read.delim("channel 1 20181015 001 00294.ddf", sep = "\t", header=TRUE, quote = "", dec = ".",comment.char = "", col.names = paste0("V",seq_len(4)), fill = TRUE)

filein <- read.delim("channel 1 20181015 001 00772.ddf", sep = "\t", header=TRUE, quote = "", dec = ".",comment.char = "", col.names = paste0("V",seq_len(4)), fill = TRUE)

filein <- read.delim("channel 1 20180815 006 00001.ddf", sep = "\t", header=TRUE, quote = "", dec = ".",comment.char = "", col.names = paste0("V",seq_len(4)), fill = TRUE)



Matrix2in <- apply(as.matrix.noquote(filein),2,as.numeric)

 Matrix2in<-Matrix2in[,-c(3,4)]#cut off stokes/astokes
 Matrix2in<-Matrix2in[-(1:25),]  #cut off metadata at start of file
#loop through first column values until >0



zp<- Position(function(x) x > 0, Matrix2in) #zeropoint is first value >0
Matrix2in <- Matrix2in[-(1:zp),] #remove up to zero point

Matrix2in <- Matrix2in[-(5882:29424),] #remove up to zero point

Matrix3D = array(



3d axes

plot_ly(x=Matrixin[,1],y=Matrixin[,2],type='scatter',mode='lines')
layout(title = "DDF Plot",scene = list(xaxis = list(title = "Distance (m)"),yaxis = list(title = "Temperature (C)"))

2d axes

library(plotly)
f <- list(
  family = "Courier New, monospace",
  size = 18,
  color = "#000000"
)
x <- list(
  title = "Distance (m)",
  titlefont = f
)
y <- list(
  title = "Temperature (c)",
  titlefont = f
)
plot_ly(x=Matrixin[,1],y=Matrixin[,2],type='scatter',mode='lines')%>%
  layout(xaxis = x, yaxis=y)
add_trace(y=[Matrixin[,3], name='ddf2',mode='lines+markers')

yaxis = y,


library(plotly)

trace_0 <- Matrix3D[,2]
trace_1 <- Matrix2in[,2]

x <- Matrix3D[,1]

data <- data.frame(x, trace_0, trace_1)

plot_ly(data, x = ~x) %>%
  add_trace(y = ~trace_0, name = 'trace 0',mode = 'lines') %>%
  add_trace(y = ~trace_1, name = 'trace 1', mode = 'lines') 




library(plotly)

for (n in 0:FileCount){}


trace_[n] <- Matrix[,n]

x <- Matrix3D[,1]

data <- data.frame(x, trace_[n])

plot_ly(data, x = ~x) %>%
  add_trace(y = ~trace_[n],mode = 'lines') %>%

  








> Matrixin[1]
[1] NA
> Matrixin[50]
[1] -291.64
> Matrixin[200]
[1] -138.644
> Matrixin[300]
[1] -36.646
> Matrixin[350]
[1] 14.353
> Matrixin[336]
[1] 0.074
> Matrixin[336,1,1,1]
Error in Matrixin[336, 1, 1, 1] : incorrect number of dimensions
> Matrixin[336,1]
V1 
0.074 
> Matrixin[2,336]
Error in Matrixin[2, 336] : subscript out of bounds
> Matrixin[336,2]
V2 
21.669 
> Matrixin[336,4]
V4 
2149.442 
> 
  