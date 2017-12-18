
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
df8 <- read.csv("results-Zscore_medianR2.csv", header = TRUE, sep = ";")
df9 <- read.csv("results_mni_biasfieldcorr.csv", header = TRUE, sep = ";")
df10 <- read.csv("results_nmi.csv", header = TRUE, sep = ";")
df11 <- read.csv("results_gaussian_S1.csv", header = TRUE, sep = ";")
df12 <- read.csv("results_gaussian_S3.csv", header = TRUE, sep = ";")
df13 <- read.csv("results_bilateral_ds4_rs50_with_skull.csv", header = TRUE, sep = ";")
df14 <- read.csv("results_bilateral_ds4_rs50.csv", header = TRUE, sep = ";")

df1["ALgorithm"] <-  "00 Ref"
df2["ALgorithm"] <-  "02 ZScore"
df3["ALgorithm"] <-  "01 MedianR1"
df4["ALgorithm"] <-  "01 MedianR2"
df5["ALgorithm"] <-  "01 MedianR3"
df6["ALgorithm"] <-  "03 MedianR3-Zscore"
df7["ALgorithm"] <-  "03 MedianR1-Zscore"
df8["ALgorithm"] <-  "04 Zscore-MedianR2"
df9["ALgorithm"] <-  "01 only biasfieldcorr"
df10["ALgorithm"] <- "00 raw"
df11["ALgorithm"] <- "05 GaussianS1"
df12["ALgorithm"] <- "05 GaussianS3"
df13["ALgorithm"] <- "09 Bilateral_skull"
df14["ALgorithm"] <- "09 Bilateral"

total <- rbind(df1,df2,df3,df4,df5,df6,df7,df8,df9,df10,df11,df12,df13,df14)

#colnames(df1)[colnames(df1)=="DICE"] <- "DICE_REF"
#colnames(df2)[colnames(df2)=="DICE"] <- "DICE_ZSCORE"
#colnames(df3)[colnames(df3)=="DICE"] <- "DICE_MEDIAN"

#mytempdata = merge(df1, df2, by=c("ID","LABEL"), all=TRUE)
#mytempdata = merge(df1, df2, all=TRUE)
#dat_merge <- merge(mytempdata,df3)


# Summary per Label
#by(dat_merge, dat_merge$LABEL, summary)


spt1 <- split(total, total$LABEL) 

png('boxplot_Ventricles.png', width = 1500, height =800 , units = 'px')
#postscript('boxplot_Ventricles.ps')
boxplot(DICE ~ ALgorithm,data=spt1[["Ventricles"]],main="Ventricles")
grid(nx=NA, ny=NULL) #grid over boxplot
dev.off()

png('boxplot_GreyMatter.png', width = 1500, height =800 , units = 'px')
#postscript('boxplot_GreyMatter.ps')
boxplot(DICE ~ ALgorithm,data=spt1[["GreyMatter"]],main="GreyMatter")
grid(nx=NA, ny=NULL) #grid over boxplot
dev.off()

png('boxplot_WhithMatter.png', width = 1500, height =800 , units = 'px')
#postscript('boxplot_WhithMatter.ps')
boxplot(DICE ~ ALgorithm,data=spt1[["WhiteMatter"]],main="WhiteMatter")
grid(nx=NA, ny=NULL) #grid over boxplot
dev.off()

