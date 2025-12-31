setwd("D:/R_dir/RUMINAN")

library(ggplot2)
library(dplyr)
library(ggsankey)
library(readr)

mat=read.table("sample_sankey-1-1-REAL.txt", header = T, sep="\t", check.names = F, row.names = 1)

# 数据预处理：统计node到next_node的流量
mat_1 <- mat %>%
  count(node, next_node, x, next_x) %>%
  make_long(node, next_node, value = n)

#node_order <- c(
#  "Buffalo", "Cattle", "Roe_deer", "Water_deer", "Goat", "Sheep", "Yak",  # 动物类型
#  "Rumen", "Reticulum", "Omasum", "Abomasum", "Duodenum", "Jejunum", "Ileum", "Cecum", "Colon", "Rectum"
#)

node_order <- c(
  "Moose", "Water_deer", "Roe_deer", "Yak", "Sheep", "Goat", "Cattle", "Buffalo",
  "Rectum", "Colon", "Cecum", "Ileum", "Jejunum", "Duodenum", "Abomasum", "Omasum", "Reticulum", "Rumen"
)


mat_1 <- mat_1 %>%
  mutate(
    node = factor(node, levels = node_order),
    next_node = factor(next_node, levels = node_order)
  )

#ggplot(mat_1, aes(x = x, next_x = next_x, node = node, next_node = next_node, fill = factor(node), label = node)) +
#  geom_sankey(flow.alpha = .6,
#              node.color = "gray30") +
#  geom_sankey_label(size = 3, color = "white", fill = "gray40") +
#  scale_fill_viridis_d(drop = FALSE) +
#  theme_sankey(base_size = 18) +
#  labs(x = NULL) +
#  theme(legend.position = "none",
#        plot.title = element_text(hjust = .5)) +
#  ggtitle("Car features")

ggplot(mat_1, aes(
  x = x,
  next_x = next_x,
  node = node,
  next_node = next_node,
  fill = factor(node),
  value = value
)) +
  geom_sankey(flow.alpha = 0.5) +
  geom_sankey_label(aes(label = node), size = 3, color = "white", fill = "gray40") +
  scale_fill_viridis_d(drop = FALSE) +
  theme_sankey(base_size = 14) +
  labs(title = "Sankey Diagram", x = NULL, y = NULL) +
  theme(legend.position = "none")
  