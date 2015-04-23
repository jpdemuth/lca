setwd("~/Desktop/Dropbox/papers/LCA")
library(devtools)
library(plotrix)
install("SAGA")
library(SAGA)
setwd("~/Desktop/Dropbox/papers/LCA/analyses")
cmat <- read.csv("Cmatrix.mp.csv")

#these are the 8 lines for which we will make data
lines <- c(3, 6, 9, 12, 30, 33, 39, 48)

#these are the composite effects that we will have producing the line means
#  Aa, Ad, Mea, AaAa, AaAd, AdAd
comp.eff <- c(4, 5, 10, 12, 13, 14)
gen.mat <- cmat[lines, comp.eff]
cohorts.me <- list()
cohorts.se <- list()
true.vals <- matrix(0,250,11)
#######
####### Change the value in rep to .25, .5, 1, 2
#######
eff.size <- rep(1, times=250)
for(i in 1:250){
  foo <- foo2 <- vector()
  true.vals[i, 1:7] <- c(4.58, eff.size[i], eff.size[i], eff.size[i], 
                                eff.size[i], eff.size[i], eff.size[i])
  for(j in 1:8){
    true.val <- 4.58 + sum(gen.mat[j, ] * c(eff.size[i], eff.size[i], 
                                            eff.size[i], eff.size[i], 
                                            eff.size[i], eff.size[i]))
    # here we draw the cohort mean from a normal distribution with a mean
    # equal to the true value and a sd = .087 which is the average across 
    # all line means in the miller 2003 paper.
    cohort.sample <- rnorm(30, mean=true.val, sd=.087)
    foo[j] <- mean(cohort.sample)
    foo2[j] <- sd(cohort.sample)/sqrt(30)
  }
  cohorts.me[[i]] <- foo
  cohorts.se[[i]] <- foo2
}
# plot the cohorts to make sure the look as expected
plot(x=1,y=1,col="white", ylim=c(0, 10), xlim=c(0,250))
for(i in 1:250){
  points(x=rep(i, times=8), y=cohorts.me[[i]], col="red", pch= 19, cex=.3)
}

# now lets evaluate these datasets
est.par <- se.est <- matrix(,250,11)
max.waic <- names <- true.waic.record <- vector()
variable.imp <- list()
for(i in 1:250){
  #here we introduce noise = to ± 5% of mean = to emp. data spl
  obs <- cohorts.me[[i]]
  se <- cohorts.se[[i]]
  #construct the data matrix for analysis
  data <- matrix(c(lines, obs, se), 8, 3)
  #fit the models
  run <- AnalyzeCrossesMM(data, model.sum=.95, even.sex=F, graph=F)
  ## these are the par estimates used to calculate % error
  est.par[i, 1:11] <- run[[2]][1,]
  se.est[i,1:11] <- run[[2]][2,]
  true.waic <- run[[3]][names(run[[3]]) == "Aa, Mea, AaAd"]
  true.waic.record[i] <- true.waic
  max.waic[i] <- run[[3]][which.max(run[[3]])]
  names[i] <- names(run[[3]][which.max(run[[3]])])
  variable.imp[[i]] <- run[[4]]
}
setwd("~/Desktop/Dropbox/papers/LCA/results/simulation.results")
write.csv(est.par, file="6par.est.csv")
write.csv(se.est, file="6par.se.est.csv")
var.results <- matrix(,10,251)
var.results[,1] <- variable.imp[[1]][,1]
for(i in 2:251){
  var.results[,i] <- variable.imp[[(i-1)]][,2]
}
write.csv(var.results, file="6par.var.imp.csv")


########################################












true.var.est <- as.numeric(est.par[, c(2, 5, 8)])
null.var.est <- as.numeric(est.par[, c(3,4,6,7,9,10,11)])
true.mean.est <- as.numeric(est.par[, 1])
plot(density(true.var.est),xlim=c(-.5,6), lwd=3)
lines(density(null.var.est))
lines(density(true.mean.est))
lines(x=c(0,0), y=c(0,30), col="red", lwd=2)
lines(x=c(.5,.5), y=c(0,30), col="red", lwd=2)
lines(x=c(4.58,4.58), y=c(0,30), col="red", lwd=2)
setwd("~/Desktop/Dropbox/papers/LCA/analyses/sim.results")
write.csv(est.par, file="data5.1.csv")
write.csv(names, file="data5.1.names.csv")
write.csv()


glm(data[,2] ~ as.matrix(test.mat))->foobar
