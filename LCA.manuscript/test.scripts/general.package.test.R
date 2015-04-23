# Heath Blackmon
# Testing script to share with Jeff

install.packages("devtools")
library(devtools)

# only run one of these vignettes require about one minute to compile
  install_github("coleoguy/SAGA", build_vignettes = TRUE)
  install_github("coleoguy/SAGA", build_vignettes = FALSE)

library(SAGA)

## First try loading data sets
data(PH) #Lynch and Walsh Nicotina plant height
data(SL) #Miller sperm length
data(SR) # Miller sperm receptacle length
data(ban.osa) # Demuth 2004 productivity ecuador x japan
data(dar.bho) # Demuth 2004 productivity tanzania x india
data(per.inf) # Demuth 2004 productivity peru x portugal
data(sin.cro) # Demuth 2004 productivity malaysia x croatia

## Primary analysis function with various argument options and datasets
results <- AnalyzeCrossesMM(PH, model.sum = .95, graph=T) # small conf set of models
results <- AnalyzeCrossesMM(PH, model.sum = .9999, graph=T) # large conf set of models
results <- AnalyzeCrossesMM(PH, model.sum = .99, max.models = 10, graph=T) # restrict number of mod to store
results <- AnalyzeCrossesMM(PH, model.sum = .05, graph=T) # single model result
## now larger model spaces
results <- AnalyzeCrossesMM(PH, even.sex=T, graph=F) # equal sex ratio
results <- AnalyzeCrossesMM(ban.osa, even.sex=F, graph=T) 
results <- AnalyzeCrossesMM(dar.bho, even.sex=F, graph=T) 
results <- AnalyzeCrossesMM(per.inf, even.sex=F, graph=T) 
results <- AnalyzeCrossesMM(sin.cro, even.sex=F, graph=T) 
results <- AnalyzeCrossesMM(SR, even.sex=T, graph=T) 

# Function to return the cmatrix being used
cmat <- DisplayCmatrix("MP")

# Function to display the result of a specific model
EvaluateModel(data=results, model=sample(1:length(results[[1]]),1))

# Function to display model space
VisModelSpace(data=results, cex.u=2)

# Check help files for functions
help(AnalyzeCrossesMM)
help(DisplayCmatrix)
help(EvaluateModel)
help(VisModelSpace)
# Check help files for data
help(PH)
help(SL)
help(SR)
help(ban.osa)
help(dar.bho)
help(per.inf)
help(sin.cro)
# The package info page
help(SAGA)
# Open the vignette
# Probably want to precompile this and include cached as
# different operating systems seem to compile it differently
# doesnt effect anything material but does impact how "pretty"
# everything looks
vignette("model-averaged-analysis", package="SAGA")

