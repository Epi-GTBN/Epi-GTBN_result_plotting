rm(list=ls())
library(reshape2)
library(ggplot2)

filename="abc" # abc.csv
Heritability="2.5%" # for my own use, indicates heritability in epistasis test data set

# reading result set
dataset=read.csv(paste(filename,".csv",sep=""),header=T)
# set custom column name
colnames(dataset)=c("Method","MAF = 0.1","MAF = 0.2","MAF = 0.3","MAF = 0.4")
# transform into Convert an object into a molten data frame, e.g. 2 columns
dataset_long=melt(dataset,id.vars="Method",variable.name="MAF",value.name="Accuracy")
# set display order for methods that are to be compared in barplot
dataset_long$Method=factor(dataset_long$Method,level=c("AntEpiSeeker","BEAM","BOOST","hill-climbing","MDR","SNPRuler","Epi-GTBN"))
# set color for bars
# palette = c("#000000", "#E69F00", "#CC99FF", "#009E73", "#F0E442", "#0072B2", "#D55E00")
palette = c("#000000", "#E69F00", "#CC99FF", "#D55E00", "#F0E442", "#0072B2", "#009E73")
# since I will be comparing results in 4 circumstances, I need to replicate color palette 4 times in order to plot
color=c(palette,palette,palette,palette)
# plot's title
bar_title=paste("Heritability = ",Heritability,sep="")

# save plot to .png in default directory
# set filename for .png
png(paste(filename,"Accuracy.png",sep="")) 

# ggplot plot
p = ggplot(dataset_long,aes(x=Method,y=Accuracy))+
  facet_grid(.~MAF)+
  geom_bar(stat="identity",position="dodge",fill=color)+ # bar color
  theme_bw()+ # change background color to white
  labs(title = bar_title) # set plot's title

# legend is removed, minor grid line and vertical major grid line are also removed
# labels at axis x are set to vertical, fontsize 10, lineheight 0.8, bold
# plot's title is centered
p + theme(axis.text.x = element_text(size = 10, lineheight=.8, face = "bold", angle = 90))+
  theme(legend.position='none')+
  theme(panel.grid.minor = element_blank(),panel.grid.major.x = element_blank())+
  theme(plot.title = element_text(size = 10, hjust = 0.5))

dev.off()