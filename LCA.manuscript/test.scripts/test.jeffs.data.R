# just a testing script

setwd("~/Desktop/Dropbox/papers/LCA")
library(devtools)
install("SAGA")
library(SAGA)

setwd("~/Desktop/Dropbox/papers/LCA/datasets/jeffs.data")
identities <- c(3, 6, 9, 12, 15, 21, 18, 24, 27, 30, 33, 36, 45, 48, 39, 42)
# Jeff's 29C cohorts
data1 <- cbind(identities, read.csv("ban.osa.csv", row.names = 1, header = F)[, 1:2])
data2 <- cbind(identities, read.csv("col.ban.csv", row.names = 1, header = F)[, 1:2])
data3 <- cbind(identities, read.csv("dar.bho.csv", row.names = 1, header = F)[, 1:2])
data4 <- cbind(identities, read.csv("nig.sing.csv", row.names = 1, header = F)[, 1:2])
data5 <- cbind(identities, read.csv("pm.sin.csv", row.names = 1, header = F)[, 1:2])
data6 <- cbind(identities, read.csv("nig.cro.csv", row.names = 1, header = F)[, 1:2])
data7 <- cbind(identities, read.csv("per.inf.csv", row.names = 1, header = F)[, 1:2])
data8 <- cbind(identities, read.csv("osa.col.csv", row.names = 1, header = F)[, 1:2])
data9 <- cbind(identities, read.csv("cro.inf.csv", row.names = 1, header = F)[, 1:2])
data10 <- cbind(identities, read.csv("per.sq.csv", row.names = 1, header = F)[, 1:2])
data11 <- cbind(identities, read.csv("sin.cro.csv", row.names = 1, header = F)[, 1:2])
data12 <- cbind(identities, read.csv("ba.sq.csv", row.names = 1, header = F)[, 1:2])
data13 <- cbind(identities, read.csv("bh.sq.csv", row.names = 1, header = F)[, 1:2])
data14 <- cbind(identities, read.csv("da.sq.csv", row.names = 1, header = F)[, 1:2])
data15 <- cbind(identities, read.csv("ban.inf.csv", row.names = 1, header = F)[, 1:2])
setwd("~/Desktop/Dropbox/papers/LCA/results/jeff")

for(i in 1:15){
  print(i)
  foo <- AnalyzeCrossesMM(get(paste("data", i, sep="")), Cmatrix = "MP", 
                          model.sum = 0.95, even.sex = F, 
                          graph=T, max.models = 70000)

  VisModelSpace(foo)
}
i <- 9
foo <- AnalyzeCrossesMM(get(paste("data", i, sep="")), Cmatrix = "MP", 
                        model.sum = 0.95, even.sex = F, 
                        graph=T, max.models = 70000)


i <- 11
foo <- AnalyzeCrossesMM(get(paste("data", i, sep="")), Cmatrix = "MP", 
                        model.sum = 0.95, even.sex = F, 
                        graph=T, max.models = 70000)
