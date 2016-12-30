# Graphics Devices

### What is a graphics device?

* A graphics device is something where you can make a plot appear

	- A window in your computer (screen device)
	- A PDF file (file device)
	- A PNG or JPEG (file device)
	- A Scalable Vector Graphics (SVG) file (file device)

* When you make a plot in R, it has to be "sent" to a specific graphics device
* The most common place for a plot to be "sent" is the screen device
	- On a mac the screen device is launched by `quartz()`
	- On windows the screen device is launched by `windows()`
	- On linux the screen device is launched by `x11()`
* When making a plot you need to consider how the plot will be used to determine what device the plot should be sent to.
	- The list of devices is found in ?Devices; there are also devices created by users on CRAN
* For quick visualizations and exploratory analysis, usually you want to use the screen device
	- Functions like plot in base, `xyplot` in lattice, or `qplot` ig ggplot2 will default to sending a plot to the screen device
	- On a given platform (Mac, Windows, Unix/linux) there's only one screen device
* For plots that may be printed out or be incorporated into a document (e.g. papers/reports, slide presentations), usually a file device is more appropiate
	- There are many different file devies to choose from
* NOTE: Not al graphics devices are available on all platforms (i.e. you cannot launch `windows()` on a mac)

### How does a plot get created?

There are two basic approaches to plotting. The first is most common:

* Call a plotting function like `plot`, `xyplot` or `qplot`
* The plot appears on the screen device
* Annotate plot if necessary
* Enjoy

```
library(datasets)
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser Data")
```

The second approach to plotting is most commonly used for file devices:

* Explicitly launch a graphics device
* Call a plotting function to make a plot (Note: If you're using a file device, no plot will appear on the screen)
* Annotate plot if necessary
* Explicitly close graphics device with `dev.off()` (this is very important)

```
pdf(file = "myplot.pdf")
with(faithful, plot(eruptions, waiting))
title(main = "Old faithful Geyser Data")
def.off()
```

### Graphics file devices

There are two basic types of file devices: vector and bitmap devices

Vector formats:

* `pdf`: useful for line-type graphics, resizes well, usually portable, not efficient if a plot hax many objects/points
* `svg`: Xml-based scalable vector graphics; supports animation and interactivity, potentially useful for web-based plots
* `win.metafile`: Windows metafile (only windows)
* `postscript`: older format, also resizes well, usually portable, can be uses to create encapulated postscript files; windows systems often don't have a postscript viewer

### Bitmap formats

Bitmap formats

* `png`: bitmapped format, good for line drawings of images with solid colors, usesloseless compression (like the old GIF format), most web browsers can read this format natively, good for plotting many many points, does not resize well
* `jpeg`: good for photographs or natural scenes, does not resize well, can de read by almost any computer and any browser, not great for line drawings
* `tiff`: Creates bitmap files in the TIFF format, supports lossless compression
* `bmp`: a native Windows bitmapped format

### Multiple Open Graphics Devices

* It is possible to open multiple graphics devices (screen, file or both), for example when viewing multiple plots at once
* Plotting can only occur on one graphics device at a time
* The currently active graphics device can be found by calling `dev.cur()`
* Every open graphics device is assigned an integer >= 2
* You can change the active graphics device with `dev.set(<integer>)` where `<integer>` is the number associated with the graphics device you want to swith to

### Copying plots

Copying a plot to another device can be useful because some plots require a lot of code and it can be a pain to type all thain again for a different device.

* `dev.copy`: copy a plot from one device to another
* `dev.copy2pdf`: specifically copy a plot to a PDF file

NOTE: Copying a plot is not an exact operation, so the result may not be identical to the original

```
library(datasets)
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser Data")
dev.copy(png, file = "geyserplot.png")
dev.off()
```

### Summary

* Plots must be created on a graphics device
* The default graphics device is almost always the screen device, which is mots useful for exploratory analysis
* Files devices are useful for creating plots that can be included in other documents os sent to other people
* For file devices, there are vector bitmap formats
	- Vector formats are good for line drawings and plots with solid colors using a modest number of points
	- Bitmaps formats are good for plots with a large number of points, natural scenes or web-based plots


