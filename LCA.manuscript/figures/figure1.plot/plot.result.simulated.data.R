#############################################
## First we plot the results of datasets 1-4
#############################################
setwd("~/Desktop/Dropbox/papers/LCA/analyses/sim.results")
# column location for true values
# mean = 1
# Aa = 2
# Mea = 5
# AaAd = 8
#
# In datasets 1-4 the composite effects had values of .25, .5, 1, and 2
# the mean was 4.58 sd was .087 and 30 draws were done to calculate the
# cohort means
data1 <-  read.csv("data1.25.csv", row.names=1)
names1 <- read.csv("data1.25.names.csv", row.names=1)
data2 <-  read.csv("data2.5.csv", row.names=1)
names2 <- read.csv("data2.5.names.csv", row.names=1)
data3 <-  read.csv("data3.1.csv", row.names=1)
names3 <- read.csv("data3.1.names.csv", row.names=1)
data4 <-  read.csv("data4.2.csv", row.names=1)
names4 <- read.csv("data4.2.names.csv", row.names=1)
data5 <-  read.csv("data5.1.csv", row.names=1)
names5 <- read.csv("data5.1.names.csv", row.names=1)


# lets get percent of right models in each
table(names1) #183/250 73%
table(names2) #177/250 71%
table(names3) #183/250 73%
table(names4) #174/250 69%
table(names5) #174/250 69%






par(mfcol=c(3,2))
par(mar=c(3,5,3,3))
# now lets make plots of the parameter estimates dataset 1
included1 <- as.numeric(as.matrix(data1[,c(2,5,8)]))
excluded1 <- as.numeric(as.matrix(data1[,c(3,4,6,7,9,10,11)]))
mean1 <- as.numeric(as.matrix(data1[,1]))
plot(density(mean1),xlim=c(-.5,5), lwd=3, xaxt="n", main="", yaxt="n", xlab="", ylab="")
par(new=T)
plot(density(included1),xlim=c(-.5,5), lwd=3, xaxt="n", main="", yaxt="n", xlab="", ylab="")
par(new=T)
plot(density(excluded1),xlim=c(-.5,5), lwd=3, main="", yaxt="n", xlab="", ylab="Density")
locs <- par("usr") #b,r,l,t
lines(x=c(0,0), y=c(locs[1],locs[4]), col="red", lwd=3, lty=3)
lines(x=c(.25,.25), y=c(locs[1],locs[4]), col="red", lwd=3, lty=3)
lines(x=c(4.58,4.58), y=c(locs[1],locs[4]), col="red", lwd=3, lty=3)
text(0,locs[4], label=1,pos=3)
text(.25,locs[4], label=2,pos=3)
text(4.58,locs[4], label=3,pos=3)
par(xpd = TRUE)
text(-1,locs[4],label="A", cex=1.3,font=2, pos=3)




# now lets make plots of the parameter estimates dataset 3
included1 <- as.numeric(as.matrix(data3[,c(2,5,8)]))
excluded1 <- as.numeric(as.matrix(data3[,c(3,4,6,7,9,10,11)]))
mean1 <- as.numeric(as.matrix(data3[,1]))
plot(density(mean1),xlim=c(-.5,5), lwd=3, xaxt="n", main="", yaxt="n", xlab="", ylab="")
par(new=T)
plot(density(included1),xlim=c(-.5,5), lwd=3, xaxt="n", main="", yaxt="n", xlab="", ylab="")
par(new=T)
plot(density(excluded1),xlim=c(-.5,5), lwd=3, main="", yaxt="n", xlab="Parameter Estimate", ylab="Density")
locs <- par("usr") #b,r,l,t
lines(x=c(0,0), y=c(locs[1],locs[4]), col="red", lwd=3, lty=3)
lines(x=c(1,1), y=c(locs[1],locs[4]), col="red", lwd=3, lty=3)
lines(x=c(4.58,4.58), y=c(locs[1],locs[4]), col="red", lwd=3, lty=3)
text(0,locs[4], label=1,pos=3)
text(1,locs[4], label=2,pos=3)
text(4.58,locs[4], label=3,pos=3)
par(xpd = TRUE)
text(-1,locs[4],label="C", cex=1.3,font=2, pos=3)

# dataset 4 lets parse results by right or wrong model
par(mar=c(5,5,3,3))
corid <- data4[names4 == "Aa, Mea, AaAd",]
included1 <- as.numeric(as.matrix(corid[,c(2,5,8)]))
excluded1 <- as.numeric(as.matrix(corid[,c(3,4,6,7,9,10,11)]))
mean1 <- as.numeric(as.matrix(corid[,1]))
plot(density(mean1),xlim=c(-.5,5), lwd=3, xaxt="n", main="", yaxt="n", xlab="", ylab="")
par(new=T)
plot(density(included1),xlim=c(-.5,5), lwd=3, xaxt="n", main="", yaxt="n", xlab="", ylab="")
par(new=T)
plot(density(excluded1),xlim=c(-.5,5), lwd=3, main="", yaxt="n", xlab="Parameter Estimate", ylab="Density")
locs <- par("usr") #b,r,l,t
lines(x=c(0,0), y=c(locs[1],locs[4]), col="red", lwd=3, lty=3)
lines(x=c(2,2), y=c(locs[1],locs[4]), col="red", lwd=3, lty=3)
lines(x=c(4.58,4.58), y=c(locs[1],locs[4]), col="red", lwd=3, lty=3)
text(0,locs[4], label=1,pos=3)
text(2,locs[4], label=2,pos=3)
text(4.58,locs[4], label=3,pos=3)
par(xpd = TRUE)
text(-1,locs[4],label="E", cex=1.3,font=2, pos=3)

# now lets make plots of the parameter estimates dataset 2
par(mar=c(3,3,3,3))
included1 <- as.numeric(as.matrix(data2[,c(2,5,8)]))
excluded1 <- as.numeric(as.matrix(data2[,c(3,4,6,7,9,10,11)]))
mean1 <- as.numeric(as.matrix(data2[,1]))
plot(density(mean1),xlim=c(-.5,5), lwd=3, xaxt="n", main="", yaxt="n", xlab="", ylab="")
par(new=T)
plot(density(included1),xlim=c(-.5,5), lwd=3, xaxt="n", main="", yaxt="n", xlab="", ylab="")
par(new=T)
plot(density(excluded1),xlim=c(-.5,5), lwd=3, main="", yaxt="n", xlab="Parameter Estimate", ylab="Density")
locs <- par("usr") #b,r,l,t
lines(x=c(0,0), y=c(locs[1],locs[4]), col="red", lwd=3, lty=3)
lines(x=c(.5,.5), y=c(locs[1],locs[4]), col="red", lwd=3, lty=3)
lines(x=c(4.58,4.58), y=c(locs[1],locs[4]), col="red", lwd=3, lty=3)
text(0,locs[4], label=1,pos=3)
text(.5,locs[4], label=2,pos=3)
text(4.58,locs[4], label=3,pos=3)
par(xpd = TRUE)
text(-1,locs[4],label="B", cex=1.3,font=2, pos=3)


# now lets make plots of the parameter estimates dataset 4
included1 <- as.numeric(as.matrix(data4[,c(2,5,8)]))
excluded1 <- as.numeric(as.matrix(data4[,c(3,4,6,7,9,10,11)]))
mean1 <- as.numeric(as.matrix(data4[,1]))
plot(density(mean1),xlim=c(-.5,5), lwd=3, xaxt="n", main="", yaxt="n", xlab="", ylab="")
par(new=T)
plot(density(included1),xlim=c(-.5,5), lwd=3, xaxt="n", main="", yaxt="n", xlab="", ylab="")
par(new=T)
plot(density(excluded1),xlim=c(-.5,5), lwd=3, main="", yaxt="n", xlab="Parameter Estimate", ylab="Density")
locs <- par("usr") #b,r,l,t
lines(x=c(0,0), y=c(locs[1],locs[4]), col="red", lwd=3, lty=3)
lines(x=c(2,2), y=c(locs[1],locs[4]), col="red", lwd=3, lty=3)
lines(x=c(4.58,4.58), y=c(locs[1],locs[4]), col="red", lwd=3, lty=3)
text(0,locs[4], label=1,pos=3)
text(2,locs[4], label=2,pos=3)
text(4.58,locs[4], label=3,pos=3)
par(xpd = TRUE)
text(-1,locs[4],label="D", cex=1.3,font=2, pos=3)





# dataset 4 lets parse results by right or wrong model
par(mar=c(5,3,3,3))
misid <- data4[names4 != "Aa, Mea, AaAd",]
included1 <- as.numeric(as.matrix(misid[,c(2,5,8)]))
excluded1 <- as.numeric(as.matrix(misid[,c(3,4,6,7,9,10,11)]))
mean1 <- as.numeric(as.matrix(misid[,1]))
plot(density(mean1),xlim=c(-.6,5), lwd=3, xaxt="n", main="", yaxt="n", xlab="", ylab="")
par(new=T)
plot(density(included1),xlim=c(-.6,5), lwd=3, xaxt="n", main="", yaxt="n", xlab="", ylab="")
par(new=T)
plot(density(excluded1),xlim=c(-.6,5), lwd=3, main="", yaxt="n", xlab="Parameter Estimate", ylab="Density")
locs <- par("usr") #b,r,l,t
lines(x=c(0,0), y=c(0,locs[4]), col="red", lwd=3, lty=3)
lines(x=c(2,2), y=c(0,locs[4]), col="red", lwd=3, lty=3)
lines(x=c(4.58,4.58), y=c(0,locs[4]), col="red", lwd=3, lty=3)
text(0,locs[4], label=1,pos=3)
text(2,locs[4], label=2,pos=3)
text(4.58,locs[4], label=3,pos=3)
par(xpd = TRUE)
text(-1,locs[4],label="F", cex=1.3,font=2, pos=3)










setwd("~/Desktop/Dropbox/papers/LCA/figures")

###########################################
## Now lets plot the results of datasets 5
###########################################

setwd("~/Desktop/Dropbox/papers/LCA/results/simulation.results")
par.est <- read.csv("6par.est.csv", row.names=1)
se.est <- read.csv("6par.se.est.csv", row.names=1)
var.imp <- read.csv("6par.var.imp.csv", row.names=2)[,-1]

#Aa, Ad, Mea, AaAa, AaAd, AdAd
included1 <- as.numeric(as.matrix(par.est[,c(2,3,5,7,8,9)]))
excluded1 <- as.numeric(as.matrix(par.est[,c(4,6,10,11)]))
mean1 <- as.numeric(as.matrix(par.est[,1]))
