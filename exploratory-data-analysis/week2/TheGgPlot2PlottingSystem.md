# The ggplot2 plotting System

### That is ggplot2?

* An implementation of the Grammar of Graphics by Leland Wilkinson
* Written by Hadley Wickham (while he was a graduate student at Iowa State)
* A third graphics system for R (along with base and lattice)
* Available from CRAN via `install.packages()`
* Website [Ggplot2](http://ggplot2.org)
* Grammar of graphics represents an abstraction of graphics ideas/objects
* Think "verb", "noun", "adjective" for graphics
* Allows for a theory of graphics on which to build new graphics and graphics objects
* Shorten the distance from mind to page

### Grammar of graphics

In brief, the grammar tells us what graphic is a **mapping** from data to **aesthetic** attributes (colour, shape, size) of **geometric** objects (points, lines, bars). The plot may also contain statistical transformations of the data and is drawn on a specific coordinate system.

### The Basics: `qplot()`

* Works much like the `plot` function in base graphics system
* Looks for data in a data frame, similar to lattice, or in the parent environment
* Plots are made up of aesthetics (size, shape, color) and geoms (points, lines)
* Factors are important for indicating subsets of the data (if they are to have different properties); they should be **labeled**
* The `qplot()` hides what goes underneath, which is ok for most operations
* `ggplot()`is the core function and very flexible for doing things `qplot()`cannot do

### Hello world ggplot2

```
library(ggplot2)
str(mpg)
qplot(displ, hwy, data = mpg)
```

### Modifying the aesthetics

```
qplot(displ, hwy, data = mpg, color = drv)
```

### Adding geom

```
qplot(displ, hwy, data = mpg, geom = c("point", "smooth"))
```

### Histograms

```
qplot(hwy, data = mpg, fill = drv)
```

### Facets

```
qplot(displ, hwy, data = mpg, facets = .~drv)
qplot(hwy, data = mpg, facets = drv~., binwidth = 2)
```

### MAACS example

```
load("./data/maacs.Rda")
qplot(log(eno), data = maacs)
```

### Histogram by group

```
qplot(log(eno, data = maacs, fill = mopos))
```

### Density Smooth


```
qplot(log(eno), data = maacs, geom = "density")
qplot(log(eno), data = maacs, geom = "density", color = eno)
```

### Scatterplots eNO vs. PM2.5

```
qplot(log(pm25), log(eno), data = maacs)
qplot(log(pm25), log(eno), data = maacs, shape = mopos)
qplot(log(pm25), log(eno), data = maacs, color = mopos)
qplot(log(pm25), log(eno), data = maacs, color = mopos) + geom_smooth(mtehod = "lm")
qplot(log(pm25), log(eno), data = maacs, facets = .~mopos) + geom_smooth(mtehod = "lm")
```

### Summary of `qplot()`

* The `splot()`function is the analog `plot()` but with many built-in features
* Syntax somewhere in between base/lattice
* Produces very nice graphics, essentially publication ready if you like the design
* Difficult to go against the grain/customize (don't bother; use full ggplot2 power in that case)


### Basic Components of ggplot2 plot

* A **data frame**
* **aesthetic mappings**: how data are mapped to color, size
* **geoms**: geometric objects like points, lines, shapes
* **facets**: for conditional plots
* **stats**: statistical transformations like binning, quantiles, smoothing
* **scales**: what scale an aesthetic map uses (example: male = red, female = blue)
* **coordinate system**

### Building plots with ggplot2

* When building plots in ggplot2 (rather than using qplot) the "artist's pallete" model may be the closest analogy
* Plots are built up in layers
	- Plot the data
	- Overlay a summary
	- Metadata and annotation

### Example: BMI, PM2.5, asthma

* Mouse allergen and Asthma Cohort Study
* Baltimore Children (age 5-17)
* Persistent Asthma, exacerbation in past year
* Does BMI (normal vs overweight) modify the relationship between PM2.5 and asthma symptoms

### Basic PLot

```
qplot(logpm25, NocturnalSympt, data = maacs, facets = .~bmicat, geom = c("point", "smooth"), method = "lm")
```

### Annotation

* Labels: `xlab()`, `ylab()`, `labs()` `ggtitle()`
* Each of the "geom" functions has options to modify
* For things that only make sense globally, use theme()
	- Example: theme(legend.position = "none")
* Two standard appearence themes are includes
	- theme_gray(): the default theme (gray background)
	- theme_bw(): More stark/plain



### Final plot

```
g <- ggplot(maacs, aes(logpm25, NocturnalSympt))
# Add layers
g + geom_point(alpha = 1/3) + 
  facet_wrap(bmicat ~ no2tert, nrow = 2, ncol = 4) + 
  geom_smooth(method="lm", se=FALSE, col="steelblue") + 
  theme_bw(base_family = "Avenir", base_size = 10) + 
  labs(x = expression("log " * PM[2.5])) + 
  labs(y = "Nocturnal Symptoms") + 
  labs(title = "MAACS Cohort")
```

### Summary

* ggplot2 is very powerful and flexible if you learn the "grammar" and the various elements that can be tuner/modified
* Many more types of plots can be made; explore and mess around with the package (references mentioned in part 1 are useful)