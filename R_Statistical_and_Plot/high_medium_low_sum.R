setwd("D:/R_dir/RUMINAN")

library(ggplot2)

mat=read.table("high_medium_low_sum.txt", header = F, sep="\t", check.names = F)

mat <- mat %>%
  mutate(V5 = factor(V5, levels = c("strain", "buffalo", "cattle", "goat", "sheep", "yak", "roe_deer", "water_deer", "moose")))


mat <- mat %>%
  mutate(V4 = factor(V4, levels = c("High","Medium","Low")))

ggplot(mat, aes(x = V5, y = V6, fill = V4)) +
  geom_col(position = "stack")
