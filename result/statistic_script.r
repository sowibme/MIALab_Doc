
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

df1["ALgorithm"] <-  "02 Ref"
df2["ALgorithm"] <-  "04 ZScore"
df3["ALgorithm"] <-  "03 MedianR1"
df4["ALgorithm"] <-  "03 MedianR2"
df5["ALgorithm"] <-  "03 MedianR3"
df6["ALgorithm"] <-  "03 MedianR3-Zscore"
df7["ALgorithm"] <-  "03 MedianR1-Zscore"
df8["ALgorithm"] <-  "05 Zscore-MedianR2"
df9["ALgorithm"] <-  "01 only biasfieldcorr"
df10["ALgorithm"] <- "00 raw"
df11["ALgorithm"] <- "06 GaussianS1"
df12["ALgorithm"] <- "06 GaussianS3"
df13["ALgorithm"] <- "09 Bilateral_wskull"
df14["ALgorithm"] <- "09 Bilateral"

total <- rbind(df1,df2,df3,df7,df8,df9,df10,df12,df14)

#colnames(df1)[colnames(df1)=="DICE"] <- "DICE_REF"
#colnames(df2)[colnames(df2)=="DICE"] <- "DICE_ZSCORE"
#colnames(df3)[colnames(df3)=="DICE"] <- "DICE_MEDIAN"

#mytempdata = merge(df1, df2, by=c("ID","LABEL"), all=TRUE)
#mytempdata = merge(df1, df2, all=TRUE)
#dat_merge <- merge(mytempdata,df3)


# Summary per Label
#by(dat_merge, dat_merge$LABEL, summary)


spt1 <- split(total, total$LABEL) 

png('plot/boxplot_Ventricles.png', width = 1500, height =800 , units = 'px')
#postscript('boxplot_Ventricles.ps')
boxplot(DICE ~ ALgorithm,data=spt1[["Ventricles"]],main="Ventricles")
grid(nx=NA, ny=NULL) #grid over boxplot
dev.off()

png('plot/boxplot_GreyMatter.png', width = 1500, height =800 , units = 'px')
#postscript('boxplot_GreyMatter.ps')
boxplot(DICE ~ ALgorithm,data=spt1[["GreyMatter"]],main="GreyMatter")
grid(nx=NA, ny=NULL) #grid over boxplot
dev.off()

png('plot/boxplot_WhithMatter.png', width = 1500, height =800 , units = 'px')
#postscript('boxplot_WhithMatter.ps')
boxplot(DICE ~ ALgorithm,data=spt1[["WhiteMatter"]],main="WhiteMatter")
grid(nx=NA, ny=NULL) #grid over boxplot
dev.off()




## Median Plot
total_median <- rbind(df3,df4,df5)
spt_median <- split(total_median, total_median$LABEL) 

png('plot/median_boxplot_Ventricles.png', width = 1500, height =800 , units = 'px')
#postscript('boxplot_Ventricles.ps')
boxplot(DICE ~ ALgorithm,data=spt_median[["Ventricles"]],main="Ventricles Median")
grid(nx=NA, ny=NULL) #grid over boxplot
dev.off()

png('plot/median_boxplot_GreyMatter.png', width = 1500, height =800 , units = 'px')
#postscript('boxplot_GreyMatter.ps')
boxplot(DICE ~ ALgorithm,data=spt_median[["GreyMatter"]],main="GreyMatter Median")
grid(nx=NA, ny=NULL) #grid over boxplot
dev.off()

png('plot/median_boxplot_WhithMatter.png', width = 1500, height =800 , units = 'px')
#postscript('boxplot_WhithMatter.ps')
boxplot(DICE ~ ALgorithm,data=spt_median[["WhiteMatter"]],main="WhiteMatter Median")
grid(nx=NA, ny=NULL) #grid over boxplot
dev.off()



## Gaussian

total_sgaussian<- rbind(df11,df12)
spt_sgaussian <- split(total_sgaussian, total_sgaussian$LABEL) 

png('plot/gaussian_boxplot_Ventricles.png', width = 1500, height =800 , units = 'px')
#postscript('boxplot_Ventricles.ps')
boxplot(DICE ~ ALgorithm,data=spt_sgaussian[["Ventricles"]],main="Ventricles Gaussian")
grid(nx=NA, ny=NULL) #grid over boxplot
dev.off()

png('plot/gaussian_boxplot_GreyMatter.png', width = 1500, height =800 , units = 'px')
#postscript('boxplot_GreyMatter.ps')
boxplot(DICE ~ ALgorithm,data=spt_sgaussian[["GreyMatter"]],main="GreyMatter Gaussian")
grid(nx=NA, ny=NULL) #grid over boxplot
dev.off()

png('plot/gaussian_boxplot_WhithMatter.png', width = 1500, height =800 , units = 'px')
#postscript('boxplot_WhithMatter.ps')
boxplot(DICE ~ ALgorithm,data=spt_sgaussian[["WhiteMatter"]],main="WhiteMatter Gaussian")
grid(nx=NA, ny=NULL) #grid over boxplot
dev.off()





## With Skull
total_skull <- rbind(df10,df9,df13)
spt_skull <- split(total_skull, total_skull$LABEL) 

png('plot/WSkull_boxplot_Ventricles.png', width = 1500, height =800 , units = 'px')
#postscript('boxplot_Ventricles.ps')
boxplot(DICE ~ ALgorithm,data=spt_skull[["Ventricles"]],main="Ventricles with Skull")
grid(nx=NA, ny=NULL) #grid over boxplot
dev.off()

png('plot/WSkull_boxplot_GreyMatter.png', width = 1500, height =800 , units = 'px')
#postscript('boxplot_GreyMatter.ps')
boxplot(DICE ~ ALgorithm,data=spt_skull[["GreyMatter"]],main="GreyMatterwith Skull")
grid(nx=NA, ny=NULL) #grid over boxplot
dev.off()

png('plot/WSkull_boxplot_WhithMatter.png', width = 1500, height =800 , units = 'px')
#postscript('boxplot_WhithMatter.ps')
boxplot(DICE ~ ALgorithm,data=spt_skull[["WhiteMatter"]],main="WhiteMatter with Skull")
grid(nx=NA, ny=NULL) #grid over boxplot
dev.off()


## All used this
total_std <- rbind(df10,df9,df2,df1)
spt_std <- split(total_std, total_std$LABEL) 

png('plot/default_boxplot_Ventricles.png', width = 1500, height =800 , units = 'px')
#postscript('boxplot_Ventricles.ps')
boxplot(DICE ~ ALgorithm,data=spt_std[["Ventricles"]],main="Ventricles default")
grid(nx=NA, ny=NULL) #grid over boxplot
dev.off()

png('plot/default_boxplot_GreyMatter.png', width = 1500, height =800 , units = 'px')
#postscript('boxplot_GreyMatter.ps')
boxplot(DICE ~ ALgorithm,data=spt_std[["GreyMatter"]],main="GreyMatter default")
grid(nx=NA, ny=NULL) #grid over boxplot
dev.off()

png('plot/default_boxplot_WhithMatter.png', width = 1500, height =800 , units = 'px')
#postscript('boxplot_WhithMatter.ps')
boxplot(DICE ~ ALgorithm,data=spt_std[["WhiteMatter"]],main="WhiteMatter default")
grid(nx=NA, ny=NULL) #grid over boxplot
dev.off()





