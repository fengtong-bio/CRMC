setwd("D:/R_dir/RUMINAN")

library(ggradar)
library(ggradar2)
library(dplyr)
library(scales)
library(tidyr)

mat=read.table("ruminants_8_to_other_5_ratio.txt", header = T, sep="\t", check.names = F, row.names = 1)


ggradar(
  mat,
  axis.label.size = 3,
  group.line.width = 1,
  group.point.size = 2,
  legend.text.size = 8,
  legend.position = "bottom",
  plot.title = "微生物组数据雷达图（归一化后）"
) +
  theme(legend.key.width = unit(1.5, "cm"))

mycolor <- c("#61c1bf","#bf95c1","#a5d395","#a06f40","#39271d","#f8f1ca","#e4b264","#ba906c","#f3dc8f","#735338","#6a3e23","#ca8e46","#cfb390","#cda86a","#9b521b","#545446","#c4b4b4","#544464","#5c3e5a","#deab6b","#f9e49b")

mycolor <- c("#cb6c37","#e9b34e","#752f29","#453f3c","#947fbd","#3a3468","#44653a","#3a36a8","#61c1bf")

fullscore <- c(1,1,1,1,1)

ggradar2(mat,
         polygonfill = T,
         polygonfill.transparency = 0.2,
         group.line.width=0.5,
         group.point.size=1,
         background.circle.transparency = 0.1,
         radarshape = 'sharp',
         fullscore = fullscore,
         group.colours=mycolor)
