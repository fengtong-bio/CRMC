setwd("D:/R_dir/RUMINAN")

library(ggplot2)

# 物种单菌在各维生素途径
mat=read.table("ab_wuzhong_vitamin_median_average.txt", header = F, sep="\t", check.names = F)
x_order <- c("Cattle", "Buffalo", "Yak", "Goat","Sheep","Moose","Water_deer","Roe_deer")
mat$V3 <- factor(mat$V3, levels = x_order)
pdf("ab_wuzhong_vitamin_MAG_MAP.pdf", width = 7, height = 15)
ggplot(mat, aes(x = V3, y = V6, fill = V3)) +
  geom_boxplot() +
  coord_cartesian(ylim = c(0, 0.5)) +
  facet_wrap(~ V2, ncol = 1, strip.position = "top") +
  theme(
    panel.background = element_blank(),  # 面板背景
    plot.background = element_blank(),   # 整个图表背景
    strip.background = element_blank(),  # 分面标题背景
    legend.background = element_blank(), # 图例背景
    legend.key = element_blank()         # 图例键背景
  )
dev.off()


# 物种整体样本在各维生素合成途径
mat=read.table("Vitamin_sum_MAP_abundance.txt", header = F, sep="\t", check.names = F)
x_order <- c("Cattle", "Buffalo", "Yak", "Goat","Sheep","Moose","Water_deer","Roe_deer")
mat$V4 <- factor(mat$V4, levels = x_order)
pdf("ab_wuzhong_vitamin_sample_MAP.pdf", width = 15, height = 15)
ggplot(mat, aes(x = V4, y = V6, fill = V4)) +
  geom_boxplot() +
  coord_cartesian(ylim = c(0, 60)) +
  facet_wrap(~ V1, ncol = 1, strip.position = "top") +
  theme(
    panel.background = element_blank(),  # 面板背景
    plot.background = element_blank(),   # 整个图表背景
    strip.background = element_blank(),  # 分面标题背景
    legend.background = element_blank(), # 图例背景
    legend.key = element_blank()         # 图例键背景
  )
dev.off()



# 不同位置
library(ggridges)
library(viridis)
library(dplyr)
mat=read.table("Vitamin_sum_MAP_abundance.txt", header = F, sep="\t", check.names = F)
mat <- mat %>%
  mutate(V5_new = case_when(
    V5 %in% c("Rumen", "Reticulum","Omasum","Abomasum") ~ "Stomach",
    V5 %in% c("Duodenum", "Jejunum","Ileum") ~ "Small intestine",
    V5 %in% c("Cecum", "Colon","Rectum") ~ "Large intestine"
  ))
y_order <- c("Roe_deer","Water_deer","Moose","Sheep", "Goat", "Yak", "Buffalo", "Cattle")
mat$V4 <- factor(mat$V4, levels = y_order)


# 各物种肠段 - MAP通路 不拆
ggplot(mat, aes(x = V6, y = V4, fill = V5_new)) +
  geom_density_ridges(alpha=0.8,quantile_lines = TRUE,quantiles = c(0.5)) +
  scale_fill_viridis(option = "viridis", discrete = TRUE, begin = 0, end = 1) +
  coord_cartesian(xlim = c(0, 80)) +
  facet_wrap(~ V1, ncol = 9, strip.position = "top") +
  theme(
    panel.background = element_blank(),  # 面板背景
    plot.background = element_blank(),   # 整个图表背景
    strip.background = element_blank(),  # 分面标题背景
    legend.background = element_blank(), # 图例背景
    legend.key = element_blank()         # 图例键背景
  )


# 各物种肠段 - MAP通路 拆 -- 失效
ggplot(mat, aes(x = V6, y = V4, fill = V5_new)) +
  geom_density_ridges(alpha=0.8,quantile_lines = TRUE,quantiles = c(0.5)) +
  scale_fill_viridis(option = "viridis", discrete = TRUE, begin = 0, end = 1) +
  coord_cartesian(xlim = c(0, 80)) +
  facet_wrap(V5_new ~ V1, ncol = 9, strip.position = "top") +
  theme(
    panel.background = element_blank(),  # 面板背景
    plot.background = element_blank(),   # 整个图表背景
    strip.background = element_blank(),  # 分面标题背景
    legend.background = element_blank(), # 图例背景
    legend.key = element_blank()         # 图例键背景
  )


# 各物种 10 GIT位置- MAP通路 拆
ggplot(mat, aes(x = V6, y = V4, fill = V5)) +
  geom_density_ridges(alpha=0.8,quantile_lines = TRUE,quantiles = c(0.5)) +
  scale_fill_viridis(option = "viridis", discrete = TRUE, begin = 0, end = 1) +
  coord_cartesian(xlim = c(0, 80)) +
  facet_wrap(V5_new~ V1, ncol = 9, strip.position = "top") +
  theme(
    panel.background = element_blank(),  # 面板背景
    plot.background = element_blank(),   # 整个图表背景
    strip.background = element_blank(),  # 分面标题背景
    legend.background = element_blank(), # 图例背景
    legend.key = element_blank()         # 图例键背景
  )


# 不同位置箱线图-不拆-拆
library(ggridges)
library(viridis)
library(dplyr)
mat=read.table("Vitamin_sum_MAP_abundance.txt", header = F, sep="\t", check.names = F)
mat <- mat %>%
  mutate(V5_new = case_when(
    V5 %in% c("Rumen", "Reticulum","Omasum","Abomasum") ~ "Stomach",
    V5 %in% c("Duodenum", "Jejunum","Ileum") ~ "Small intestine",
    V5 %in% c("Cecum", "Colon","Rectum") ~ "Large intestine"
  ))
y_order <- c("Roe_deer","Water_deer","Moose","Sheep", "Goat", "Yak", "Buffalo", "Cattle")
mat$V4 <- factor(mat$V4, levels = y_order)
pdf("Vitamin_sum_MAP_abundance_boxplot_3sit.pdf", width = 25, height = 15)
ggplot(mat, aes(x = V6, y = V4, fill = V5_new)) +  # x=维生素丰度(V6)，y=物种(V4)，填充=肠道部位(V5_new)
  geom_boxplot(
    alpha = 0.8,                # 箱体透明度
    color = "black",            # 箱体边框颜色（黑色）
    outlier.color = "black",    # 离群点颜色（黑色）
    outlier.shape = 16,         # 离群点形状（实心圆点）
    outlier.size = 1            # 离群点大小
  ) +
  scale_fill_viridis(option = "viridis", discrete = TRUE, begin = 0, end = 1) +  # viridis配色
  coord_cartesian(xlim = c(0, 50)) +  # 限制X轴范围
  facet_wrap(V5_new~ V1, ncol = 9, strip.position = "top") +  # 按V1分面，每行9列
  labs(
    x = "Vitamin Abundance",
    y = "Species",
    fill = "Gut Segment"
  ) + 
  theme(
    # 全局文字颜色设为黑色
    text = element_text(color = "black"),          # 所有文本（包括标题、图例等）
    axis.text = element_text(color = "black"),     # 坐标轴刻度标签
    axis.title = element_text(color = "black"),    # 坐标轴标题
    strip.text = element_text(color = "black"),    # 分面标题
    legend.text = element_text(color = "black"),   # 图例文字
    legend.title = element_text(color = "black"), # 图例标题
    
    panel.background = element_blank(),          # 移除绘图区背景色
    panel.border = element_rect(color = "black", fill = NA),  # 黑色边框
    plot.background = element_blank(),          # 移除图表背景
    strip.background = element_blank(),         # 移除分面标题背景
    legend.background = element_blank(),        # 移除图例背景
    legend.key = element_blank(),               # 移除图例键背景
    axis.text.y = element_text(size = 10)
  )
dev.off()

pdf("Vitamin_sum_MAP_abundance_boxplot_10sit.pdf", width = 25, height = 50)
ggplot(mat, aes(x = V6, y = V4, fill = V5)) +  # x=维生素丰度(V6)，y=物种(V4)，填充=肠道部位(V5_new)
  geom_boxplot(
    alpha = 0.8,                # 箱体透明度
    color = "black",            # 箱体边框颜色（黑色）
    outlier.color = "black",    # 离群点颜色（黑色）
    outlier.shape = 16,         # 离群点形状（实心圆点）
    outlier.size = 1            # 离群点大小
  ) +
  scale_fill_viridis(option = "viridis", discrete = TRUE, begin = 0, end = 1) +  # viridis配色
  coord_cartesian(xlim = c(0, 50)) +  # 限制X轴范围
  facet_wrap(V5~ V1, ncol = 9, strip.position = "top") +  # 按V1分面，每行9列
  labs(
    x = "Vitamin Abundance",
    y = "Species",
    fill = "Gut Segment"
  ) +
  theme(
    # 全局文字颜色设为黑色
    text = element_text(color = "black"),          # 所有文本（包括标题、图例等）
    axis.text = element_text(color = "black"),     # 坐标轴刻度标签
    axis.title = element_text(color = "black"),    # 坐标轴标题
    strip.text = element_text(color = "black"),    # 分面标题
    legend.text = element_text(color = "black"),   # 图例文字
    legend.title = element_text(color = "black"), # 图例标题
    
    panel.background = element_blank(),          # 移除绘图区背景色
    panel.border = element_rect(color = "black", fill = NA),  # 黑色边框
    plot.background = element_blank(),          # 移除图表背景
    strip.background = element_blank(),         # 移除分面标题背景
    legend.background = element_blank(),        # 移除图例背景
    legend.key = element_blank(),               # 移除图例键背景
    axis.text.y = element_text(size = 10)
  )

dev.off()


# 各物种MAP选择
setwd("D:/R_dir/RUMINAN")
library(ggplot2)
library(ggsci)  # 用于科学期刊配色
library(viridis)  # Viridis 色系

color_palette <- colorRampPalette(c("#1976D2", "#4CAF50", "#FFEB3B", "#FF5722"))(30)

mat=read.table("map_choose_number.txt", header = F, sep="\t", check.names = F)
order <- c("cattle", "buffalo", "yak", "goat","sheep","moose","water_deer","roe")
mat$V10 <- factor(mat$V10, levels = order)
ggplot(mat,aes(x=V11,y=V9,fill=V3)) + 
  geom_bar(stat = 'identity',width = 0.8) +
  facet_wrap(~ V10,ncol = 9, strip.position = "top", scales = "free_x") +
  scale_fill_manual(
    values = color_palette,
    guide = guide_legend(
      nrow = 10,
      override.aes = list(size = 3, alpha = 1)
    )
  ) +
  theme(
    panel.background = element_blank(),  # 面板背景
    plot.background = element_blank(),   # 整个图表背景
    strip.background = element_blank(),  # 分面标题背景
    legend.background = element_blank(), # 图例背景
    legend.key = element_blank()         # 图例键背景
  )

######################################### 长数据转宽数据存储
mat=read.table("map_choose_number_sum_number.txt", header = F, sep="\t", check.names = F)
wide_data <- mat %>%
  pivot_wider(
    names_from = V3,    # 列名来自分组2（V3）
    values_from = V1    # 数值来自V1
  )

#tmat <- t(wide_data)
write.csv(wide_data, "map_choose_number_sum_number.csv", row.names = T)
######################################### 


# human MAP选择
setwd("D:/R_dir/RUMINAN")
library(ggplot2)
library(ggsci)  # 用于科学期刊配色
library(viridis)  # Viridis 色系

color_palette <- colorRampPalette(c("#1976D2", "#4CAF50", "#FFEB3B", "#FF5722"))(30)
mat=read.table("IMGG_human_KEGG_module_line1.txt", header = F, sep="\t", check.names = F)
ggplot(mat,aes(x=V3,y=V6,fill=V8)) + 
  geom_bar(stat = 'identity',width = 0.8) +
  theme(
    panel.background = element_blank(),  # 面板背景
    plot.background = element_blank(),   # 整个图表背景
    strip.background = element_blank(),  # 分面标题背景
    legend.background = element_blank(), # 图例背景
    legend.key = element_blank()         # 图例键背景
  )

# human K1-KN ratio
library(pheatmap)
mat=read.table("IMGG_human_aim_module_node_ratio_pheatmap.txt", header = T, sep="\t", check.names = F, row.names = 1)
pdf("IMGG_human_aim_module_node_ratio_pheatmap.pdf", width = 10, height = 30)
pheatmap(mat, 
         cluster_rows = F, 
         cluster_cols = F, 
         show_colnames = T, 
         cellwidth = 15,
         cellheight = 15,
         #         border_color = NA,
         border_color = "white",
         color = colorRampPalette(c("#FFFFFF","#b38aae","#1c6e7d","#2f4858"))(100))
dev.off()


# 物种单菌在各维生素途径
mat=read.table("ab_wuzhong_vitamin_median_average_choose_map.txt", header = F, sep="\t", check.names = F)
x_order <- c("Cattle", "Buffalo", "Yak", "Goat","Sheep","Moose","Water_deer","Roe_deer")
mat$V3 <- factor(mat$V3, levels = x_order)
pdf("ab_wuzhong_vitamin_MAG_MAP_choose_map.pdf", width = 10, height = 25)
ggplot(mat, aes(x = V2, y = V6, fill = V2)) +
  geom_boxplot() +
  coord_cartesian(ylim = c(0, 0.5)) +
  facet_wrap(~ V3, ncol = 1, strip.position = "top") +
  theme(
    axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
    panel.background = element_blank(),  # 面板背景
    plot.background = element_blank(),   # 整个图表背景
    strip.background = element_blank(),  # 分面标题背景
    legend.background = element_blank(), # 图例背景
    legend.key = element_blank()         # 图例键背景
  )
dev.off()

# 物种整体样本在各维生素合成途径
mat=read.table("Vitamin_sum_MAP_abundance_choose_map.txt", header = F, sep="\t", check.names = F)
x_order <- c("Cattle", "Buffalo", "Yak", "Goat","Sheep","Moose","Water_deer","Roe_deer")
mat$V4 <- factor(mat$V4, levels = x_order)
pdf("ab_wuzhong_vitamin_sample_MAP_choose_map.pdf", width = 10, height = 25)
ggplot(mat, aes(x = V1, y = V6, fill = V1)) +
  geom_boxplot() +
  coord_cartesian(ylim = c(0, 60)) +
  facet_wrap(~ V4, ncol = 1, strip.position = "top") +
  theme(
    axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
    panel.background = element_blank(),  # 面板背景
    plot.background = element_blank(),   # 整个图表背景
    strip.background = element_blank(),  # 分面标题背景
    legend.background = element_blank(), # 图例背景
    legend.key = element_blank()         # 图例键背景
  )
dev.off()

# K1-KN choose
library(pheatmap)
mat=read.table("all_MAP_K1_KN_ratio.txt", header = T, sep="\t", check.names = F, row.names = 1)
pdf("all_MAP_K1_KN_ratio.pdf", width = 30, height = 10)
pheatmap(mat, 
         cluster_rows = TRUE, 
         cluster_cols = F, 
         show_colnames = T, 
         cellwidth = 15,
         cellheight = 15,
#         border_color = NA,
         border_color = "white",
         color = colorRampPalette(c("#FFFFFF","#b38aae","#1c6e7d","#2f4858"))(100))
dev.off()

# "#FFFFFF","#1976D2","#FFEB3B","#FF5722"
# "#FFFFFF","#039590","#1c6e7d","#2f4858"

# NODE choose MAGs number
library(ggplot2)
library(ggsci)  # 用于科学期刊配色
library(viridis)  # Viridis 色系

color_palette <- colorRampPalette(c("#1976D2", "#4CAF50", "#FFEB3B", "#FF5722"))(30)

mat=read.table("Vitamin_pheatmap_sum_percentage_top_3_MAP.txt", header = F, sep="\t", check.names = F)
order <- c("cattle", "buffalo", "yak", "goat","sheep","moose","water_deer","roe")
mat$V10 <- factor(mat$V10, levels = order)
order_x <- c("N100101","N110001","N110100","N110101","N0110111101","N1010111101","N1110111101","N100010000011001010","N100100000011001010","N100100000101001010","N100100000111000010","N100100000111001000","N100100000111001010","N100110000011001010","N100110000111001010","N10101001","N10111001","N10111010","N10111011","N10111101","N111101","N111110","N111111","N01","N10","N11","N100010001001011001","N110010000010011001","N110010001000011001","N111000001000011001","N111000011000011001","N01111100101","N01111101101","N01111110001","N10111111001","N11111100101","N11111101001","N11111111001","N1101111")
mat$V9 <- factor(mat$V9, levels = order_x)
pdf("Vitamin_pheatmap_sum_percentage_top_3_MAP.pdf", width = 20, height = 10)
ggplot(mat,aes(x=V9,y=V12,fill=V3)) + 
  geom_bar(stat = 'identity',width = 0.8) +
  facet_wrap(~ V10,ncol = 1, strip.position = "top", scales = "free_y") +
  scale_fill_manual(
    values = color_palette,
    guide = guide_legend(
      nrow = 30,
      override.aes = list(size = 3, alpha = 1)
    )
  ) +
  theme(
    axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
    panel.background = element_blank(),  # 面板背景
    plot.background = element_blank(),   # 整个图表背景
    strip.background = element_blank(),  # 分面标题背景
    legend.background = element_blank(), # 图例背景
    legend.key = element_blank()         # 图例键背景
  )
dev.off()


# NODE choose abundance
mat=read.table("04_sum_MAP_abundance_top_3_MAP.txt", header = F, sep="\t", check.names = F)
x_order <- c("Cattle", "Buffalo", "Yak", "Goat","Sheep","Moose","Water_deer","Roe_deer")
mat$V5 <- factor(mat$V5, levels = x_order)
order_x <- c("N100101","N110001","N110100","N110101","N0110111101","N1010111101","N1110111101","N100010000011001010","N100100000011001010","N100100000101001010","N100100000111000010","N100100000111001000","N100100000111001010","N100110000011001010","N100110000111001010","N10101001","N10111001","N10111010","N10111011","N10111101","N111101","N111110","N111111","N01","N10","N11","N100010001001011001","N110010000010011001","N110010001000011001","N111000001000011001","N111000011000011001","N01111100101","N01111101101","N01111110001","N10111111001","N11111100101","N11111101001","N11111111001","N1101111")
mat$V1 <- factor(mat$V1, levels = order_x)
pdf("04_sum_MAP_abundance_top_3_MAP.pdf", width = 20, height = 25)
ggplot(mat, aes(x = V1, y = V7, fill = V2)) +
  geom_boxplot() +
  coord_cartesian(ylim = c(0, 35)) +
  facet_wrap(~ V5, ncol = 1, strip.position = "top") +
  theme(
    axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
    panel.background = element_blank(),  # 面板背景
    plot.background = element_blank(),   # 整个图表背景
    strip.background = element_blank(),  # 分面标题背景
    legend.background = element_blank(), # 图例背景
    legend.key = element_blank()         # 图例键背景
  )
dev.off()

# NODE choose abundance -- main choose 连锁
mat=read.table("04_sum_MAP_abundance_top_3_MAP.txt", header = F, sep="\t", check.names = F)
x_order <- c("Cattle", "Buffalo", "Yak", "Goat","Sheep","Moose","Water_deer","Roe_deer")
mat$V5 <- factor(mat$V5, levels = x_order)
order_x <- c("N100101","N110001","N110100","N110101","N0110111101","N1010111101","N1110111101","N100010000011001010","N100100000011001010","N100100000101001010","N100100000111000010","N100100000111001000","N100100000111001010","N100110000011001010","N100110000111001010","N10101001","N10111001","N10111010","N10111011","N10111101","N111101","N111110","N111111","N01","N10","N11","N100010001001011001","N110010000010011001","N110010001000011001","N111000001000011001","N111000011000011001","N01111100101","N01111101101","N01111110001","N10111111001","N11111100101","N11111101001","N11111111001","N1101111")
selected_facets <- c("N110101","N1010111101","N100100000111001010","N10111001","N111110","N11","N01111100101","N100010001001011001","N1101111")
mat_filtered <- mat[mat$V1 %in% selected_facets, ]
mat_filtered$V1 <- factor(mat_filtered$V1, levels = selected_facets)  # 重新设置因子顺序
pdf("04_sum_MAP_abundance_top_3_MAP_main_choose_wuzhong.pdf", width = 15, height = 15)
ggplot(mat_filtered, aes(x = V5, y = V7, fill = V2)) +
  geom_boxplot() +
  coord_cartesian(ylim = c(0, 35)) +
  facet_wrap(~ V1, ncol = 1, strip.position = "top") +
  theme(
    axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
    panel.background = element_blank(),  # 面板背景
    plot.background = element_blank(),   # 整个图表背景
    strip.background = element_blank(),  # 分面标题背景
    legend.background = element_blank(), # 图例背景
    legend.key = element_blank()         # 图例键背景
  )
dev.off()

