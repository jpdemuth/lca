setwd("~/Desktop/Dropbox/papers/LCA")
library(devtools)
install("SAGA")
library(SAGA)

setwd("~/Desktop/Dropbox/papers/LCA/datasets")
spl <- read.csv("miller.sp.lng.csv", row.names=1)
srl <- read.csv("miller.rcpt.lng.csv", row.names=1)


foo2 <- AnalyzeCrossesMM(spl, Cmatrix = "MP", model.sum = 0.95, even.sex = T, graph=T, max.models = 70000)
foo2 <- AnalyzeCrossesMM(spl, Cmatrix = "MP", model.sum = 0.57, even.sex = T, graph=T, max.models = 70000)
res.spl <- foo2[[2]]
setwd("~/Desktop/Dropbox/papers/LCA/results/miller")
write.csv(res.spl, file="res.spl.60.csv")
write.csv(foo2[[3]], file="daicc.spl.csv")
rm(foo2)


foo <- AnalyzeCrossesMM(srl, Cmatrix = "MP", model.sum = 0.99, even.sex = T, graph=T)
res.srl <- foo[[2]]
setwd("~/Desktop/Dropbox/papers/LCA/results/miller")
write.csv(res.srl, file="res.srl.csv")
write.csv(foo[[3]], file="daicc.sprl.csv")
rm(foo2)


# experimenting
colors <- rainbow(100, start=0, end=.8)
plot(1:100,1:100, col=colors, pch=19, cex=.3)

install("SAGA")
VisModelSpace(foo, cex.u = .9)

install("SAGA")
VisModelSpace(foo2, cex.u = .4)

Cmatrix = "MP"
model.sum = .95
max.models = 25000
even.sex = T