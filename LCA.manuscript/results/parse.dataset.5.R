#parsing data set 5
setwd("~/Desktop/Dropbox/papers/LCA/results/simulation.results")
data <- read.csv("6par.var.imp.csv", as.is=T)

row.names(data) <- data[,2]
data <- data[,3:252]
rowMeans(data)
tdata <- t(data)
boxplot(tdata)
plot(density(tdata[,1]))
par(mfcol=c(5,2))
a <- c(1,1,0,1,0,1,1,1,0,0)
for(i in 1:10){
  par(mar=c(1, 1, 1, 1))
  plot(density(tdata[,i]), main="", xlab="", xlim=c(-.5,1.2), lwd=2)
  foo <- par("usr")
  lines(x=c(a[i],a[i]), y = c(foo[3], foo[4]), col="red", lty=2)
}


data <- read.csv("6par.var.imp.csv", as.is=T)[,2]
names<- data
data <- read.csv("6par.est.csv", row.names=1)
colnames(data) <- c("mean", names)

colMeans(data)
data2 <- read.csv("6par.se.est.csv", row.names=1)
colnames(data2) <- colnames(data)
