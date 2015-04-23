results <- list()
results2 <- results3 <- vector()
for(i in 1:15){
  daicc <- read.csv(paste("dataset", i, ".waics.csv", sep=""))[,1]
  waics <- (exp(-.5 * daicc)) / (sum(exp(-.5 * daicc)))
  results[[i]] <- waics
  results2[i] <- max(waics)
  results3[i] <- sort(waics, decreasing=T)[1]/sort(waics, decreasing=T)[2]
}
plot(log(results[[1]]))
