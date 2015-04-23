#single par analysis
setwd("~/Desktop/Dropbox/papers/LCA/results/simulation.results")
mw.avg <- read.csv("mw.avg.single.par.csv", row.names=1)
hit.avg <- read.csv("match.single.par.csv", row.names=1)
colSums(hit.avg, na.rm = T)
boxplot(mw.avg, names=colnames(hit.avg), outline=F)
plot(1,1, xlim=c(1,10), ylim=c(0,11), col="white", ylab="Parameter Estimate", 
     xlab="Composite Effects",xaxt="n")
mtext(text=colnames(hit.avg), side=1, at=1:10)
for(i in 1:10){
  foo <- jitter(rep(1,100), factor=12)
  foo <- foo + i - 1
  points(x=foo, y=jitter(mw.avg[,i]), pch=19, cex=.2)
}
mtext(text=colSums(hit.avg, na.rm = T), side = 3, at=1:10)
lines(x=c(0,12),y=c(10,10), col="red", lty=2)
est.means <- colMeans(mw.avg)
points(x=1:10,y=est.means, pch=15)
#three par analysis
setwd("~/Desktop/Dropbox/papers/LCA/results/simulation.results")
mw.avg <- read.csv("3-mw.avg.csv", row.names=1)
se.mw.avg <- read.csv("3-se.est.csv", row.names=1)
gen.val <- read.csv("3-gen.val.csv", row.names=1)

results.h <- list()
for(i in 1:10){
  results.h[[i]] <- mw.avg[gen.val[,i] == 5, i]
}
results.l <- list()
for(i in 1:10){
  results.l[[i]] <- mw.avg[gen.val[,i] == -5, i]
}

plot(1,1, xlim=c(1,10), ylim=c(-11,11), col="white", ylab="Parameter Estimate", 
     xlab="Composite Effects",xaxt="n")
mtext(text=colnames(gen.val), side=1, at=1:10)

for(i in 1:10){
  foo <- jitter(rep(1,length(results.h[[i]])), factor=12)
  foo <- foo + i - 1
  points(x=foo, y=jitter(results.h[[i]]), pch=19, cex=.1, col="blue")
}
for(i in 1:10){
  foo <- jitter(rep(1,length(results.l[[i]])), factor=12)
  foo <- foo + i - 1
  points(x=foo, y=jitter(results.l[[i]]), pch=19, cex=.1, col="red")
}
boxplot(results.h, outline=F, add=T, col="red")
boxplot(results.l, outline=F, add=T, col="blue")
lines(x=c(0,12),y=c(5,5), col="red", lty=1)
lines(x=c(0,12),y=c(-5,-5), col="blue", lty=1)



#miller data
#how correlated are the male and femal traits
spl <- c(1.847,1.868,1.875,1.822,1.844,1.833,1.832,1.812,1.853,1.766)
sprl <- c(4.768,4.591,4.723,4.618,4.572,4.417,4.508,4.495,4.250,4.101)
plot(x=spl, y=sprl)
