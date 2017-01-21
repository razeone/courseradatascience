# EDA Case Study - Understanding Human Activity with Smart Phones

The data comes from Samsung Galaxy S3

The dataset comes from [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Slightly processed data

```R
load("data/samsungData.rda")
names(samsungData)[1:12]
table(samsungData$activity)
```

### Plotting average acceleration for first subject

```R
par(mfrow = c(1, 2), mar = c(5, 4, 1, 1))
samsungData <- transform(samsungData, activity = factor(activity))
sub1 <- subset(samsungData, subject == 1)
plot(sub1[, 1], col = sub1$activity, ylab = names(sub1)[1])
plot(sub1[, 2], col = sub1$activity, ylab = names(sub1)[2])
legend("bottomright", legend = unique(sub1$activity), col = unique(sub1$activity), 
    pch = 1)
```

### Clustering based just on average acceleration

```R
source("myplclust.R")
distanceMatrix <- dist(sub1[, 1:3])
hclustering <- hclust(distanceMatrix)
myplclust(hclustering, lab.col = unclass(sub1$activity))
```

### Plotting maximum acceleration for the first subject

```R
par(mfrow = c(1, 2))
plot(sub1[, 10], pch = 19, col = sub1$activity, ylab = names(sub1)[10])
plot(sub1[, 11], pch = 19, col = sub1$activity, ylab = names(sub1)[11])
```

### Clustering based on maximum acceleration

```R
source("myplclust.R")
distanceMatrix <- dist(sub1[, 10:12])
hclustering <- hclust(distanceMatrix)
myplclust(hclustering, lab.col = unclass(sub1$activity))
```

### Singular value decomposition

```R
svd1 = svd(scale(sub1[, -c(562, 563)]))
par(mfrow = c(1, 2))
plot(svd1$u[, 1], col = sub1$activity, pch = 19)
plot(svd1$u[, 2], col = sub1$activity, pch = 19)
```

### Find maximum contributer

```R
plot(svd1$v[, 2], pch = 19)
```

### New clustering with maximum contributer

```R
maxContrib <- which.max(svd1$v[, 2])
distanceMatrix <- dist(sub1[, c(10:12, maxContrib)])
hclustering <- hclust(distanceMatrix)
myplclust(hclustering, lab.col = unclass(sub1$activity))
```

```R
names(samsungData)[maxContrib]
```

### K-means clustering (nstart=1, first try)

```R
kClust <- kmeans(sub1[, -c(562, 563)], centers = 6)
table(kClust$cluster, sub1$activity)
```

### K-means clustering (nstart=1, second try)

```R
kClust <- kmeans(sub1[, -c(562, 563)], centers = 6, nstart = 1)
table(kClust$cluster, sub1$activity)
```

### K-means clustering (nstart=100, first try)

```R
kClust <- kmeans(sub1[, -c(562, 563)], centers = 6, nstart = 100)
table(kClust$cluster, sub1$activity)
```

### K-means clustering (nstart=100, second try)

```R
kClust <- kmeans(sub1[, -c(562, 563)], centers = 6, nstart = 100)
table(kClust$cluster, sub1$activity)
```

### Cluster 1 variable centers (laying)

```R
plot(kClust$center[1, 1:10], pch = 19, ylab = "Cluster Center", xlab = "")
```

### Cluster 2 variables centers (Walking)

```R
plot(kClust$center[4, 1:10], pch = 19, ylab = "Cluster Center", xlab = "")
```

