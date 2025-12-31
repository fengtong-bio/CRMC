setwd("D:/R_dir/RUMINAN")

library(ggplot2)
library(ggridges)
library(viridis)

##length_N50_geom_density_ridges.txt
mat=read.table("all_length_N50.txt", header = F, sep="\t", check.names = F)
#mat$Group <- factor(mat$Group, levels = c("High_length","High_N50","Medium_length","Medium_N50"))
#mat$Group <- factor(mat$Group, levels = c("Medium_N50","Medium_length","High_N50","High_length"))
pdf("RUMINAN_length_N50_geom_density_ridges.pdf", width = 10, height = 10)
ggplot(mat, aes(x = log10(V2), y = V3, fill = V3)) +
  geom_density_ridges(alpha=0.99,quantile_lines = TRUE,quantiles = c(0.5)) +
  scale_fill_viridis(option = "viridis", discrete = TRUE, begin = 0, end = 1) +
  labs(x = "Length - N50 (Log10)", y = "Group", title = "Length - N50")
dev.off()

grouped_medians <- aggregate(mat$V2 ~ mat$V3, mat, median)
print(grouped_medians)

##Completeness_Contamination_geom_density_ridges.txt
mat=read.table("Completeness_Contamination_all.txt", header = F, sep="\t", check.names = F)
#mat$Group <- factor(mat$Group, levels = c("High_length","High_N50","Medium_length","Medium_N50"))
#mat$Group <- factor(mat$Group, levels = c("Medium_N50","Medium_length","High_N50","High_length"))
pdf("RUMINAN_Completeness_Contamination_geom_density_ridges.pdf", width = 10, height = 10)
ggplot(mat, aes(x = V2, y = V3, fill = V3)) +
  geom_density_ridges(alpha=0.99,quantile_lines = TRUE,quantiles = c(0.5)) +
  scale_fill_viridis(option = "viridis", discrete = TRUE, begin = 0, end = 1) +
  labs(x = "Completeness Contamination", y = "Group", title = "Completeness - Contamination")
dev.off()

grouped_medians <- aggregate(mat$V2 ~ mat$V3, mat, median)
print(grouped_medians)

##gene_ann_geom_density_ridges.txt
mat=read.table("gene_info_all.txt", header = F, sep="\t", check.names = F)
#mat$Group <- factor(mat$Group, levels = c("High_length","High_N50","Medium_length","Medium_N50"))
#mat$Group <- factor(mat$Group, levels = c("Medium_N50","Medium_length","High_N50","High_length"))
pdf("RUMINAN_gene_ann_geom_density_ridges.pdf", width = 10, height = 10)
ggplot(mat, aes(x = log10(V2), y = V3, fill = V3)) +
  geom_density_ridges(alpha=0.99,quantile_lines = TRUE,quantiles = c(0.5)) +
  scale_fill_viridis(option = "viridis", discrete = TRUE, begin = 0, end = 1) +
  labs(x = "Gene ann number (Log10)", y = "Group", title = "Gene number - ann number")
dev.off()

grouped_medians <- aggregate(mat$V2 ~ mat$V3, mat, median)
print(grouped_medians)
