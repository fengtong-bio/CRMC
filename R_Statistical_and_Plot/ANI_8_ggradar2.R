setwd("D:/R_dir/RUMINAN")

library(ggradar)
library(ggradar2)
library(dplyr)
library(scales)
library(tidyr)

#mycolor <- c("#61c1bf","#bf95c1","#a5d395","#a06f40","#39271d","#f8f1ca","#e4b264","#ba906c","#f3dc8f","#735338","#6a3e23","#ca8e46","#cfb390","#cda86a","#9b521b","#545446","#c4b4b4","#544464","#5c3e5a","#deab6b","#f9e49b")

#mycolor <- c("#cb6c37","#e9b34e","#752f29","#453f3c","#947fbd","#3a3468","#44653a","#3a36a8","#61c1bf")

mat=read.table("ANI_8_ggradar2_buffalo.txt", header = T, sep="\t", check.names = F, row.names = 1)
fullscore <- c(0.5,0.5,0.5,0.5,0.5,0.5,0.5)
pdf("ANI_8_ggradar2_buffalo.pdf", width = 15, height = 15)
ggradar2(mat,polygonfill = T,polygonfill.transparency = 0.2,group.line.width=0.5,group.point.size=1,background.circle.transparency = 0.1,radarshape = 'sharp',fullscore = fullscore,group.colours=mycolor, gridline.label = seq(0, 50, by = 25))
dev.off()

mat=read.table("ANI_8_ggradar2_cattle.txt", header = T, sep="\t", check.names = F, row.names = 1)
fullscore <- c(0.5,0.5,0.5,0.5,0.5,0.5,0.5)
pdf("ANI_8_ggradar2_cattle.pdf", width = 15, height = 15)
ggradar2(mat,polygonfill = T,polygonfill.transparency = 0.2,group.line.width=0.5,group.point.size=1,background.circle.transparency = 0.1,radarshape = 'sharp',fullscore = fullscore,group.colours=mycolor, gridline.label = seq(0, 50, by = 25))
dev.off()

mat=read.table("ANI_8_ggradar2_goat.txt", header = T, sep="\t", check.names = F, row.names = 1)
fullscore <- c(0.5,0.5,0.5,0.5,0.5,0.5,0.5)
pdf("ANI_8_ggradar2_goat.pdf", width = 15, height = 15)
ggradar2(mat,polygonfill = T,polygonfill.transparency = 0.2,group.line.width=0.5,group.point.size=1,background.circle.transparency = 0.1,radarshape = 'sharp',fullscore = fullscore,group.colours=mycolor, gridline.label = seq(0, 50, by = 25))
dev.off()

mat=read.table("ANI_8_ggradar2_moose.txt", header = T, sep="\t", check.names = F, row.names = 1)
fullscore <- c(0.5,0.5,0.5,0.5,0.5,0.5,0.5)
pdf("ANI_8_ggradar2_moose.pdf", width = 15, height = 15)
ggradar2(mat,polygonfill = T,polygonfill.transparency = 0.2,group.line.width=0.5,group.point.size=1,background.circle.transparency = 0.1,radarshape = 'sharp',fullscore = fullscore,group.colours=mycolor, gridline.label = seq(0, 50, by = 25))
dev.off()

mat=read.table("ANI_8_ggradar2_roe_deer.txt", header = T, sep="\t", check.names = F, row.names = 1)
fullscore <- c(0.5,0.5,0.5,0.5,0.5,0.5,0.5)
pdf("ANI_8_ggradar2_roe_deer.pdf", width = 15, height = 15)
ggradar2(mat,polygonfill = T,polygonfill.transparency = 0.2,group.line.width=0.5,group.point.size=1,background.circle.transparency = 0.1,radarshape = 'sharp',fullscore = fullscore,group.colours=mycolor, gridline.label = seq(0, 50, by = 25))
dev.off()

mat=read.table("ANI_8_ggradar2_sheep.txt", header = T, sep="\t", check.names = F, row.names = 1)
fullscore <- c(0.5,0.5,0.5,0.5,0.5,0.5,0.5)
pdf("ANI_8_ggradar2_sheep.pdf", width = 15, height = 15)
ggradar2(mat,polygonfill = T,polygonfill.transparency = 0.2,group.line.width=0.5,group.point.size=1,background.circle.transparency = 0.1,radarshape = 'sharp',fullscore = fullscore,group.colours=mycolor, gridline.label = seq(0, 50, by = 25))
dev.off()

mat=read.table("ANI_8_ggradar2_water_deer.txt", header = T, sep="\t", check.names = F, row.names = 1)
fullscore <- c(0.5,0.5,0.5,0.5,0.5,0.5,0.5)
pdf("ANI_8_ggradar2_water_deer.pdf", width = 15, height = 15)
ggradar2(mat,polygonfill = T,polygonfill.transparency = 0.2,group.line.width=0.5,group.point.size=1,background.circle.transparency = 0.1,radarshape = 'sharp',fullscore = fullscore,group.colours=mycolor, gridline.label = seq(0, 50, by = 25))
dev.off()

mat=read.table("ANI_8_ggradar2_yak.txt", header = T, sep="\t", check.names = F, row.names = 1)
fullscore <- c(0.5,0.5,0.5,0.5,0.5,0.5,0.5)
pdf("ANI_8_ggradar2_yak.pdf", width = 15, height = 15)
ggradar2(mat,polygonfill = T,polygonfill.transparency = 0.2,group.line.width=0.5,group.point.size=1,background.circle.transparency = 0.1,radarshape = 'sharp',fullscore = fullscore,group.colours=mycolor, gridline.label = seq(0, 50, by = 25))
dev.off()
