
# set working directory
setwd("/home/martin/CloudStation/Schule/Msc/3Semester/Medical_Image_Analysis_Lab/work/MIALab_Doc/result")

# import data
df1 <- read.csv("results-reference.csv", header = TRUE, sep = ";")
df2 <- read.csv("results-zcore.csv", header = TRUE, sep = ";")
df3 <- read.csv("results-medianR1.csv", header = TRUE, sep = ";")
df4 <- read.csv("results-medianR2.csv", header = TRUE, sep = ";")
df5 <- read.csv("results-medianR3.csv", header = TRUE, sep = ";")
df6 <- read.csv("results-medianR3_Zscore.csv", header = TRUE, sep = ";")
df7 <- read.csv("results-medianR1_Zscore.csv", header = TRUE, sep = ";")

df1["ALgorithm"] <- "0 Ref"
df2["ALgorithm"] <- "ZScore"
df3["ALgorithm"] <- "MedianR1"
df4["ALgorithm"] <- "MedianR2"
df5["ALgorithm"] <- "MedianR3"
df6["ALgorithm"] <- "MedianR3-Zscore"
df7["ALgorithm"] <- "MedianR1-Zscore"


total <- rbind(df1,df2,df3,df4,df5,df6,df7)

#colnames(df1)[colnames(df1)=="DICE"] <- "DICE_REF"
#colnames(df2)[colnames(df2)=="DICE"] <- "DICE_ZSCORE"
#colnames(df3)[colnames(df3)=="DICE"] <- "DICE_MEDIAN"

#mytempdata = merge(df1, df2, by=c("ID","LABEL"), all=TRUE)
#mytempdata = merge(df1, df2, all=TRUE)
#dat_merge <- merge(mytempdata,df3)


# Summary per Label
by(dat_merge, dat_merge$LABEL, summary)


spt1 <- split(total, total$LABEL) 

#png('boxplot_Ventricles.png')
postscript('boxplot_Ventricles.ps')
boxplot(DICE ~ ALgorithm,data=spt1[["Ventricles"]],main="Ventricles")
grid(nx=NA, ny=NULL) #grid over boxplot
dev.off()

png('boxplot_GreyMatter.png', width = 800, height =500 , units = 'px')
#postscript('boxplot_GreyMatter.ps')
boxplot(DICE ~ ALgorithm,data=spt1[["GreyMatter"]],main="GreyMatter")
grid(nx=NA, ny=NULL) #grid over boxplot
dev.off()

#png('boxplot_WhithMatter.png')
postscript('boxplot_WhithMatter.ps')
boxplot(DICE ~ ALgorithm,data=spt1[["WhiteMatter"]],main="WhiteMatter")
grid(nx=NA, ny=NULL) #grid over boxplot
dev.off()