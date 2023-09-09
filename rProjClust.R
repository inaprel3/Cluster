#k-средних:
# Пример использования K-средних кластеризации
data_kmeans <- data.frame(
  x = rnorm(100, mean = 0, sd = 1),
  y = rnorm(100, mean = 3, sd = 1)
)
k <- 3
kmeans_result <- perform_kmeans_clustering(data_kmeans, k)

# Вывод информации о кластерах
print(kmeans_result)

# Визуализация результатов кластеризации
plot(data_kmeans, col = kmeans_result$cluster)
points(kmeans_result$centers, col = 1:k, pch = 8, cex = 2)

#иерархической кластеризации:
# Пример использования иерархической кластеризации
data_hierarchical <- USArrests
hc <- perform_hierarchical_clustering(data_hierarchical)

# Рисование дендрограммы (дерева кластеров)
plot(hc, cex = 0.6, hang = -1)

#выделения связных компонент:
# Пример выделения связных компонент
edges <- data.frame(
  from = c(1, 2, 3, 4, 5, 6, 7, 8),
  to = c(2, 3, 1, 4, 5, 6, 7, 8)
)
components <- find_connected_components(edges)

# Вывод связных компонент
for (i in 1:length(components$csize)) {
  cat(paste("Связная компонента", i, ": ", components$csize[i], "вершин(ы)\n"))
  cat(paste("Вершины: ", toString(components$membership[components$membership == i]), "\n\n"))
}