# Exploratory Graphs

### Why do we use graphs in data analysis?

 * To understand data properties
 * To find patterns in data
 * To suggest modeling strategies
 * To "debug" analyses
 * To communicate results

 ### Characteristics of exploratory graphs

 * They are made quickly
 * A large number are made
 * The goal is for personal understanding
 * Axes/legends are generally cleaned up (later)
 * Color/size are primarily used for information

 ### Simple summaries of data

 * Five-number summary
 * Boxplots
 * Histograms
 * Density plot
 * Barplot

 ```
 summary(pollution$pm25)
 boxplot(pollution$pm25, col = "blue")
 hist(pollution$pm25, col = "green")
 rug(pollution$pm25)
 hist(pollution$pm25, col = "green", breaks = 100)
 rug(pollution$pm25)
 boxplot(pollution$pm25, col = "blue")
 abline(h = 12)
 hist(pollution$pm25, col = "green")
 abline(v = 12, lwd = 2)
 abline(v = median(pollution$pm25), col = "magenta", lwd = 4)
 barplot(table(pollution$region), col = "wheat", main = "Number of Counties in Each region")
 ```

#### Two dimensions

* Multiple/overlayed 1-D plots (Lattice/ggplot2)
* Scatterplots
* Smooth scatterplots

#### > 2 dimensions

* Overlayed/multiple 2-d plots; coplots
* User color, size, shape tp add dimensions
* Spinning plots
* Actual 3-D plots (not that useful)

### Multiple boxplots

```
boxplot(pm25 ~ region, data = pollution, col = "red")
```

### Multiple histograms

```
par(mfrow = c(2,1), mar = c(4,4,2,1))
hist(subset(pollution, region == "east")$pm25, col = "green")
hist(subset(pollution, region == "west")$pm25, col = "green")
```

### Scatterplot

```
with(pollution, plot(latitude, pm25))
abline(h = 12, lwd = 2, lty = 2)
```

#### Using color

```
with(pollution, plot(latitude, pm25, col = region))
abline(h = 12, lwd = 2, lty = 2)
```
#### Multiple Scatterplots

```
par(mfrow = c(1,2), mar = c(5,4,2,1))
with(subset(pollution, region == "west"), plot(latitude, pm25, main = "West"))
with(subset(pollution, region == "east"), plot(latitude, pm25, main = "East"))
```

### Summary

* Exploratory plots are "quick and dirty"
* Let you summarize the data (usually graphically) and highly any broad features
* Explore basic questions and hypotheses (and perhaps rule them out)
* Suggest modeling strategies for the "next step"

### Further resources

[R Graph Gallery](http://www.r-graph-gallery.com/)
[R Bloggers](https://www.r-bloggers.com/)