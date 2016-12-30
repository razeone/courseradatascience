# The Base Plotting System in R

The core plotting and graphics engine in R is encapsulated in the following packages:

* graphics: contains plitting functions for the "base" graphic systems, including `plot, hist, boxplot` and many others
* grDevices: contains all the code implementing the various graphics devices, including X11, PDF, PostScript, PNG, etc.

The Lattice plotting system is implemented using the following packages

* lattice: contains code for producing Trellis graphics, which are independent of the base graphics system; includes functions like `xyplot, bwplot, levelplot`
* grid: implements a different graphing system independent of the base system; the lattice package builds on top of grid, we seldom call functions from the grid package directly

### The process of Making a Plot

When making a plot one must first make a few considerations (not necessarily in this order):

* Where will the plot be made? On the screen? In a file?
* How will the plot be used?
	- Is the plot for viewing temporarily on the screen?
	- Will it be presented in a web browser?
	- Will it be eventually end up in a paper that might be printed?
	- Are you using it in a presentation?
* Is there a large amount of data going into the plot? Or is just a few points?
* Do you need to be able to dynamically resize the graphic?

More to think about...

* What graphics system will you use: base, lattice, or ggplot2? These generally cannot be mixed
* Base graphics are usually constructed piecemeal, with each aspect of the plot handled separately through a series of function calls; thisi s often conceptually simpler and allows plotting to mirror the though process
* Lattice graphics are usually created in a single function call, so all of the grapghics parameters have to be specified at once; specifying everything at once allows R to automatically calculate thenecessary spacings and font sizes.
* ggplot2 combines concepts from both base and lattice graphics but uses an independent implementation

We focus on using the base plotting system to create graphics on the screen device.

### Base graphics

Base graphics are used most commonly and are a very powerful system for creating 2-D graphics.

* There are two phases to creating a base plot
	- Initializing a new plot
	- Annotating (adapting to) an existing plot
* Calling `plot(x,y)` or `hist(x)` will launch a graphics device (if one is not already open) and draw a new plot on the device
* If the arguments to `plot` are not of some special class, then the default method for `plot` is called; this function has many arguments, letting you set the title, x axis label, y axis label, etc.
* The base graphics system has many parameters that can set tweaked, there parameters are documented in `?par`; it wouldn't hurt to try memorize this help page