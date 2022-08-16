# Simple plotting of example yield data #
# ------------------------------------- #
# 
###### Setup ######

library(tidyverse)
library(ggplot2)
library(patchwork)

rm(list=ls())


###### Load data ######

indir = 'data/'

fname_1 = 'Sep2021_Liaoning_data.csv'
fname_2 = 'Sep2021_Jilin_data.csv'
fname_3 = 'Sep2021_Heilongjiang_data.csv'

provs = c("Liaoning", "Jilin", "Heilongjiang")

yield_1 = read.csv(paste(indir,fname_1, sep=""), header = TRUE,sep = ",", stringsAsFactors = FALSE)
yield_2 = read.csv(paste(indir,fname_2, sep=""), header = TRUE,sep = ",", stringsAsFactors = FALSE)
yield_3 = read.csv(paste(indir,fname_3, sep=""), header = TRUE,sep = ",", stringsAsFactors = FALSE)


###### Process data ######

#create long table with |year|province|yield|jun.T|jul.T|aug.T|jun.P|jul.P|aug.P|
#then plot with ggplt(data=long.table, x=jun.T, y=yield) + geom_point(color=province)


###### Plot data ######

scatter_trend_plot = function(data, x, y, title, xlab="var", ylab="Normalised maize yield", method=lm) {
  plot = ggplot(data=data, aes(x={{x}}, y={{y}})) +
    geom_point() +
    geom_smooth(method={{method}}) +
    labs(title=title, x=xlab, y=ylab)
  return(plot)
}

ljun = scatter_trend_plot(data=yield_1, 
                          x=Jun.T, 
                          y=Maize.yield.anomaly, 
                          title=provs[1], 
                          xlab="June Temperature / degrees C",)
ljul = scatter_trend_plot(data=yield_1, 
                          x=Jul.T, 
                          y=Maize.yield.anomaly, 
                          title=provs[1], 
                          xlab="July Temperature / degrees C",)
laug = scatter_trend_plot(data=yield_1, 
                          x=Aug.T, 
                          y=Maize.yield.anomaly, 
                          title=provs[1], 
                          xlab="August Temperature / degrees C",)
jjun = scatter_trend_plot(data=yield_2, 
                          x=Jun.T, 
                          y=Maize.yield.anomaly, 
                          title=provs[2], 
                          xlab="June Temperature / degrees C",)
jjul = scatter_trend_plot(data=yield_2, 
                          x=Jul.T, 
                          y=Maize.yield.anomaly, 
                          title=provs[2], 
                          xlab="July Temperature / degrees C",)
jaug = scatter_trend_plot(data=yield_2, 
                          x=Aug.T, 
                          y=Maize.yield.anomaly, 
                          title=provs[2], 
                          xlab="August Temperature / degrees C",)
hjun = scatter_trend_plot(data=yield_3, 
                          x=Jun.T, 
                          y=Maize.yield.anomaly, 
                          title=provs[3], 
                          xlab="June Temperature / degrees C",)
hjul = scatter_trend_plot(data=yield_3, 
                          x=Jul.T, 
                          y=Maize.yield.anomaly, 
                          title=provs[3], 
                          xlab="July Temperature / degrees C",)
haug = scatter_trend_plot(data=yield_3, 
                          x=Aug.T, 
                          y=Maize.yield.anomaly, 
                          title=provs[3], 
                          xlab="August Temperature / degrees C",)
(ljun+ljul+laug)/(jjun+jjul+jaug)/(hjun+hjul+haug)
