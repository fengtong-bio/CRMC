setwd("D:/R_dir/RUMINAN")

########################################################################
# strain ANI 99 95 to GTDB,ruminants,pig,human,mouse
library(ggplot2)
mat=read.table("ruminants_strain_other_ANI_99_95.txt", header = F, sep="\t", check.names = F)
x_order <- c("strain", "GTDB_ref_MAGs","ruminants_Microbiome_MAGs","PIGC_pig_MAGs", "MIMAG_human_MAGs", "iMGMC_mouse_MAGs")
mat$V4 <- factor(mat$V4, levels = x_order)
pdf("ruminants_strain_other_ANI_99_95.pdf")
ggplot(mat, aes(x = V4, y = V2)) +  # 设置x/y轴映射
  geom_bar(stat = "identity",            # 使用原始数值（非计数统计）
           fill = "steelblue",           # 填充颜色
           width = 0.8) +
  coord_cartesian(ylim = c(0, 1)) +
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


########################################################################
# all MAGs Genus_Species tax ratio
library(ggplot2)
mat=read.table("all_file_tax_ratio_Genus_Species.txt", header = F, sep="\t", check.names = F)
x_order <- c("strain","cattle", "buffalo", "yak", "goat","sheep","moose","water_deer","roe_deer")
mat$V5 <- factor(mat$V5, levels = x_order)
pdf("all_file_tax_ratio_Genus_Species.pdf")
ggplot(mat, aes(x = V5, y = V3)) +  # 设置x/y轴映射
  geom_bar(stat = "identity",            # 使用原始数值（非计数统计）
           fill = "steelblue",           # 填充颜色
           width = 0.8) +                # 条形宽度
  facet_wrap(~ V1, ncol = 1, strip.position = "top") +
  theme(
#    axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
    panel.background = element_blank(),  # 面板背景
    plot.background = element_blank(),   # 整个图表背景
    strip.background = element_blank(),  # 分面标题背景
    legend.background = element_blank(), # 图例背景
    legend.key = element_blank()         # 图例键背景
  )
dev.off()

########################################################################
# all wuzhong Phylum_ratio_line
library(ggplot2)
mat=read.table("Phylum_ratio_line.txt", header = F, sep="\t", check.names = F)
pdf("wuzhong_8_Phylum_ratio_line_geom_col.pdf", width = 25, height = 15)
ggplot(mat, aes(x = V3, y = V2, fill = V2)) +
  geom_col(
#    fill = "steelblue",          # 柱形填充色
    color = "black",             # 柱形边框色
    width = 0.7,                 # 柱形宽度
    alpha = 1                  # 透明度
  ) +
  facet_wrap(~ V1, ncol = 4) +   # 按V1分面，每行3列
  labs(
    x = "V3",          # X轴名称
    y = "V2",          # Y轴名称
    title = "分面条形图：按V1分组"
  ) +
  theme_minimal() +              # 简洁主题
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
    axis.text.y = element_text(size = 10),
    legend.position = "none" 
  )
dev.off()

########################################################################
# all wuzhong tax_ratio_line
library(ggplot2)
mat=read.table("all_file_tax_ratio.txt", header = F, sep="\t", check.names = F)
pdf("wuzhong_8_tax_ratio_line_geom_col.pdf", width = 25, height = 15)
y_order <- c("Species","Genus","Family","Order","Class","Phylum")
mat$V1 <- factor(mat$V1, levels = y_order)
ggplot(mat, aes(x = V3, y = V1, fill = V1)) +
  geom_col(
    #    fill = "steelblue",          # 柱形填充色
    color = "black",             # 柱形边框色
    width = 0.7,                 # 柱形宽度
    alpha = 1                  # 透明度
  ) +
  facet_wrap(~ V5, ncol = 4) +   # 按V1分面，每行3列
  labs(
    x = "V3",          # X轴名称
    y = "V2",          # Y轴名称
    title = "分面条形图：按V1分组"
  ) +
  theme_minimal() +              # 简洁主题
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
    axis.text.y = element_text(size = 10),
    legend.position = "none" 
  )
dev.off()

########################################################################
# all MAGs mapping
library(ggplot2)
library(dplyr)  # 用于数据处理

mat=read.table("all_mapping_raito_NO_N_NO_8_wuzhong.txt", header = F, sep="\t", check.names = F)
# 计算每个V1类别对应的V3中位值，并按中位值降序排序
mat_sorted <- mat %>%
  group_by(V1) %>%
  mutate(median_val = median(V3)) %>%
  ungroup() %>%
  mutate(V1 = reorder(V1, median_val))  # 负号实现从大到小排序

######################################### 长数据转宽数据存储
wide_data <- mat %>%
  pivot_wider(
    names_from = V2,    # 样本名将成为新列名
    values_from = V3    # 数据值将填充到新列中
  )

tmat <- t(wide_data)
write.csv(tmat, "all_mapping_raito.csv", row.names = T)
######################################### 

# 绘制箱线图
pdf("all_mapping_raito_NO_N_NO_8_wuzhong.pdf", width = 15, height = 5)
ggplot(mat_sorted, aes(x = V3, y = V1, fill = V1)) +
  geom_boxplot() +
  theme(
    axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
    panel.background = element_blank(),
    plot.background = element_blank(),
    strip.background = element_blank(),
    legend.background = element_blank(),
    legend.key = element_blank()
  ) +
  scale_fill_discrete(guide = guide_legend(reverse = TRUE))  # 图例顺序与坐标轴同步
dev.off()

########################################################################
# 8 wuzhong ANI95 gem_bar
library(ggplot2)
library(dplyr)
mat=read.table("8_wuzhong_ANI95_gem_bar.txt", header = F, sep="\t", check.names = F)
library(dplyr)
library(ggplot2)

# 1. 计算百分比
mat_perc <- mat %>%
  group_by(V2) %>%
  mutate(total = sum(V1)) %>%
  ungroup() %>%
  mutate(percent = V1 / total * 100)

# 2. 选择排序参考类别（例如按 V3 中 "Uniq" 的占比排序）
reference_category <- "Uniq"  # 替换为您的实际类别名称

# 3. 计算每个 V2 分组中参考类别的占比
sort_order <- mat_perc %>%
  filter(V3 == reference_category) %>%
  arrange(desc(percent)) %>%  # 降序排列（占比大的在前）
  pull(V2)

# 4. 重新排序 V2 的因子水平
mat_perc$V2 <- factor(mat_perc$V2, levels = sort_order)

# 5. 创建排序后的百分比堆叠条形图
pdf("8_wuzhong_ANI95_gem_bar.pdf")
ggplot(mat_perc, aes(x = V2, y = percent, fill = V3)) +
  geom_bar(stat = "identity", width = 0.8) +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) +
  labs(y = "Percentage", x = "Groups") +
  theme_minimal()
dev.off()


########################################################################
# 8 wuzhong ANI xiangsixing
library(ggcorrplot)
#mat=read.table("ANI_8_pheatmap.txt", header = T, sep="\t", check.names = F, row.names = 1)
mat=read.table("self_other_wuzhong_number_pheatmap.txt", header = T, sep="\t", check.names = F, row.names = 1)
pdf("self_other_wuzhong_number_pheatmap.pdf")
ggcorrplot(mat, 
           hc.order = TRUE, 
           outline.color = "white",
           colors = c("#6D9EC1", "white", "#E46726"),
           lab = TRUE
           )
dev.off()

########################################################################
# 8 wuzhong ANI self other ggradar2

library(ggradar)
library(ggradar2)
library(dplyr)
library(scales)
library(tidyr)

#mycolor <- c("#61c1bf","#bf95c1","#a5d395","#a06f40","#39271d","#f8f1ca","#e4b264","#ba906c","#f3dc8f","#735338","#6a3e23","#ca8e46","#cfb390","#cda86a","#9b521b","#545446","#c4b4b4","#544464","#5c3e5a","#deab6b","#f9e49b")

mycolor <- c("#cb6c37","#e9b34e","#752f29","#453f3c","#947fbd","#3a3468","#44653a","#3a36a8","#61c1bf")

mat=read.table("ANI_8_ggradar2_self_buffalo.txt", header = T, sep="\t", check.names = F, row.names = 1)
fullscore <- c(0.5,0.5,0.5,0.5,0.5,0.5,0.5)
pdf("ANI_8_ggradar2_self_buffalo.pdf", width = 15, height = 15)
ggradar2(mat,polygonfill = T,polygonfill.transparency = 0.2,group.line.width=0.5,group.point.size=1,background.circle.transparency = 0.1,radarshape = 'sharp',fullscore = fullscore,group.colours=mycolor, gridline.label = seq(0, 50, by = 25))
dev.off()

mat=read.table("ANI_8_ggradar2_self_cattle.txt", header = T, sep="\t", check.names = F, row.names = 1)
fullscore <- c(0.5,0.5,0.5,0.5,0.5,0.5,0.5)
pdf("ANI_8_ggradar2_self_cattle.pdf", width = 15, height = 15)
ggradar2(mat,polygonfill = T,polygonfill.transparency = 0.2,group.line.width=0.5,group.point.size=1,background.circle.transparency = 0.1,radarshape = 'sharp',fullscore = fullscore,group.colours=mycolor, gridline.label = seq(0, 50, by = 25))
dev.off()

mat=read.table("ANI_8_ggradar2_self_goat.txt", header = T, sep="\t", check.names = F, row.names = 1)
fullscore <- c(0.5,0.5,0.5,0.5,0.5,0.5,0.5)
pdf("ANI_8_ggradar2_self_goat.pdf", width = 15, height = 15)
ggradar2(mat,polygonfill = T,polygonfill.transparency = 0.2,group.line.width=0.5,group.point.size=1,background.circle.transparency = 0.1,radarshape = 'sharp',fullscore = fullscore,group.colours=mycolor, gridline.label = seq(0, 50, by = 25))
dev.off()

mat=read.table("ANI_8_ggradar2_self_moose.txt", header = T, sep="\t", check.names = F, row.names = 1)
fullscore <- c(0.5,0.5,0.5,0.5,0.5,0.5,0.5)
pdf("ANI_8_ggradar2_self_moose.pdf", width = 15, height = 15)
ggradar2(mat,polygonfill = T,polygonfill.transparency = 0.2,group.line.width=0.5,group.point.size=1,background.circle.transparency = 0.1,radarshape = 'sharp',fullscore = fullscore,group.colours=mycolor, gridline.label = seq(0, 50, by = 25))
dev.off()

mat=read.table("ANI_8_ggradar2_self_roe_deer.txt", header = T, sep="\t", check.names = F, row.names = 1)
fullscore <- c(0.5,0.5,0.5,0.5,0.5,0.5,0.5)
pdf("ANI_8_ggradar2_self_roe_deer.pdf", width = 15, height = 15)
ggradar2(mat,polygonfill = T,polygonfill.transparency = 0.2,group.line.width=0.5,group.point.size=1,background.circle.transparency = 0.1,radarshape = 'sharp',fullscore = fullscore,group.colours=mycolor, gridline.label = seq(0, 50, by = 25))
dev.off()

mat=read.table("ANI_8_ggradar2_self_sheep.txt", header = T, sep="\t", check.names = F, row.names = 1)
fullscore <- c(0.5,0.5,0.5,0.5,0.5,0.5,0.5)
pdf("ANI_8_ggradar2_self_sheep.pdf", width = 15, height = 15)
ggradar2(mat,polygonfill = T,polygonfill.transparency = 0.2,group.line.width=0.5,group.point.size=1,background.circle.transparency = 0.1,radarshape = 'sharp',fullscore = fullscore,group.colours=mycolor, gridline.label = seq(0, 50, by = 25))
dev.off()

mat=read.table("ANI_8_ggradar2_self_water_deer.txt", header = T, sep="\t", check.names = F, row.names = 1)
fullscore <- c(0.5,0.5,0.5,0.5,0.5,0.5,0.5)
pdf("ANI_8_ggradar2_self_water_deer.pdf", width = 15, height = 15)
ggradar2(mat,polygonfill = T,polygonfill.transparency = 0.2,group.line.width=0.5,group.point.size=1,background.circle.transparency = 0.1,radarshape = 'sharp',fullscore = fullscore,group.colours=mycolor, gridline.label = seq(0, 50, by = 25))
dev.off()

mat=read.table("ANI_8_ggradar2_self_yak.txt", header = T, sep="\t", check.names = F, row.names = 1)
fullscore <- c(0.5,0.5,0.5,0.5,0.5,0.5,0.5)
pdf("ANI_8_ggradar2_self_yak.pdf", width = 15, height = 15)
ggradar2(mat,polygonfill = T,polygonfill.transparency = 0.2,group.line.width=0.5,group.point.size=1,background.circle.transparency = 0.1,radarshape = 'sharp',fullscore = fullscore,group.colours=mycolor, gridline.label = seq(0, 50, by = 25))
dev.off()


########################################################################
# 8 wuzhong dbCAN Shared(1) Uniq(-1) P-value (0.05), other 0
library(pheatmap)
mat=read.table("03_dbcan_wuzhong_p-value_daxiao_pheatmap-1.txt", header = T, sep="\t", check.names = F, row.names = 1)
pdf("03_dbcan_wuzhong_p-value_daxiao_pheatmap-1.pdf", width = 30, height = 10)
color_mapping <- colorRampPalette(c("#6D9EC1", "white", "#E46726"))(3)
breaks <- c(-1.5, -0.5, 0.5, 1.5)  # 精确分隔三个值
pheatmap(
  mat,
  color = color_mapping,
  breaks = breaks,
  cellwidth = 15,
  cellheight = 15,
  legend_breaks = c(-1, 0, 1),     # 自定义图例刻度
  border_color = "white",
)
dev.off()

########################################################################
# 8 wuzhong tax Shared(1) Unshared(-1) P-value (0.05), P-value > 0.05 ==> 0
library(pheatmap)
mat=read.table("ANI_shared_tax_pheatmap.txt", header = T, sep="\t", check.names = F, row.names = 1)
pdf("ANI_shared_tax_pheatmap.pdf", width = 30, height = 10)
color_mapping <- colorRampPalette(c("#6D9EC1", "white", "#E46726"))(3)
breaks <- c(-1.5, -0.5, 0.5, 1.5)  # 精确分隔三个值
pheatmap(
  mat,
  color = color_mapping,
  breaks = breaks,
  cellwidth = 15,
  cellheight = 15,
  legend_breaks = c(-1, 0, 1),     # 自定义图例刻度
  border_color = "white",
)
dev.off()

########################################################################
# 8 wuzhong shared unshared Phylum ratio
library(ggplot2)
mat=read.table("ANI_shared_Phylum_number.txt", header = F, sep="\t", check.names = F)
pdf("ANI_shared_Phylum_number.pdf", width = 25, height = 15)
ggplot(mat, aes(x = V2 , y = V3, fill = V4)) +
  geom_bar(stat = "identity", 
           position = "fill"
           ) +
  facet_wrap(~ V1, ncol = 4) +   # 按V1分面，每行3列
  coord_flip() +  # 关键修改：将图表翻转，使条形水平
  scale_y_continuous(labels = scales::percent) + # 将 Y 轴显示为百分比
  theme_minimal() +              # 简洁主题
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
    axis.text.y = element_text(size = 10),
#    legend.position = "none" 
  )
dev.off()

########################################################################
# 8 wuzhong shared unshared CAZy ratio
library(ggplot2)
mat=read.table("ANI_shared_CAZy_number.txt", header = F, sep="\t", check.names = F)
pdf("ANI_shared_CAZy_number.pdf", width = 25, height = 25)
ggplot(mat, aes(x = V2 , y = V3, fill = V4)) +
  geom_bar(stat = "identity", 
           position = "fill"
  ) +
  facet_wrap(~ V1, ncol = 4) +   # 按V1分面，每行3列
  coord_flip() +  # 关键修改：将图表翻转，使条形水平
  scale_y_continuous(labels = scales::percent) + # 将 Y 轴显示为百分比
  theme_minimal() +              # 简洁主题
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
    axis.text.y = element_text(size = 10),
#    legend.position = "none" 
  )
dev.off()




