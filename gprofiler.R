# Load packages
library(gprofiler2)
library(ggplot2)
library(plyr) 

# Import data and attach
attach(HC)
HC<-as.list(HC)

# Run G:Profiler, including all transcripts and p-values
# The organism referenced here is Aedes aegypti, change to suit your needs
HCgost <- gost(HC, organism = "aalvpagwg", significant = FALSE, evcodes = TRUE)
head(HCgost$result)

# Generate and export G:Profiler graph
p <- gostplot(HCgost, capped = TRUE, interactive = FALSE)
p
ggsave(filename="HC.png",units=c("in"),width=12.5,height=3.75,plot=p)

# To export csv of results
HCgost.df <- apply(HCgost$result,2,as.character)
write.csv(HCgost.df,"HCgost.csv")

# To get the color coded list (if desired)
publish_gosttable(HCgost, filename = "HCgost.png")
