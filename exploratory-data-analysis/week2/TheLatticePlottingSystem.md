# The Lattice Plotting System

The Lattice plotting system is implemented using the following packages:

* lattice: contains code for producing Trellis graphics, which are independent of the base graphics system; includes functions like `xyplot`, `bwplot`, `levelplot`
* grid: implements a different graphing system independent of the base grapgics system; the lattice package builds on top of grid
	- Wel seldom call functions from the `grid` package directly
* The Lattice system does not have a "two-phase" aspect with separate plotting and annotation like base plotting.
* All plotting/annotation is done at once with a single function call

### Lattice functions

* `xyplot`: this is the main function for creating scatterplots
* `bwplot`: box and whiskers plots "boxplots"
* `histogram`: histograms
* `stripplot`: like a boxplot but with actual points
* `dotplot`: plot dots on "violin strings"
* `splom`: scatterplot matrix, like `pairs` in base plotting system
* `levelplot`, `contourplot`: for plotting image data

Lattice functions generally take a formula for their first argument, usually of the form:

```R
xyplot(y ~ x | f * g, data)
```

* We use the *formula notation* here, hence the ~
* On the left of the ~ is the y-axis variable, on the right is the x-axis variable
* f and g are *conditioning variables* - they are optional
	- The * indicates interaction between two variables
* The second argument is the data frame or list from which the variables in the formula should be looked up
	- If no data frame or list is passed, then the parent frame is used
* If no other arguments are passed, there are defaults that can be used.


### Simple Lattice Plot

```R
library(lattice)
library(datasets)
xyplot(Ozone ~ Wind, data = airquality)
```

Anothe example, a little bit more complex

```R
library(datasets)
library(lattice)
airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))
```

### Lattice Behavior

Lattice functions behave differently from base graphics functions in one critical way.

* Base graphics functions plot data directly to the graphics device (screen, PDF, file, etc)
* Lattice graphics functions return an object of class **trellis**
* The print methods for lattice functions actually do the work of plotting the data on the graphics device
* Lattice functions return "plot objects" that can, in principle, be stored (but it's better to save the code and the data)
* On command line, trellis objects are auto printed so that it appears the function is plotting the data

```R
p <- xyplot(Ozone ~ Wind, data = airquality)
print(p) # Plot appears
xyplot(Ozone ~ Wind, data = airquality) # Auto printing
```

### Lattice Panel Functions

* Lattice functions have a **panel function** which controls what happens inside each panel of the plot.
* The *lattice* package comes with default panel functions, but you can supply your own if you want to customize what happens in each panel
* Panel functions receive the x/y coordinates of the data points in their panel (along ith any optional arguments)

```R
set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f * x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
xyplot(y ~ x | f, layout = c(2,1))
```

Custom panel function

```R
xyplot(y ~ x | f, panel = function(x, y, ...){
	panel.xyplot(x, y, ...)
	panel.abline(h = median(y), lty = 2) # Add a horizontal line in the median of y
})
```

```
xyplot(y ~ x | f, panel = function(x, y, ...){
	panel.xyplot(x, y, ...)
	panel.lmline(x, y, col = 2)
})
```

### Summary

* Lattice plots are constructed with a single function core to a lattice function (e.g. `xyplot`)
* Aspects like margins and spacing are automatically handled, and defaults are usually sufficient
* The lattice system is ideal for creating conditioning plots where you examine the same kind of plot under many different conditions
* Panel functions can be specified/customized to modify what is plotted in each of the plot panels