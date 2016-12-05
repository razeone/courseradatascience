# This file belongs to the notes of the lecture 'Reading from HDF5' of the
# Getting and cleaning data MOOC

# The package for reading data from HDF5 is in biocLite
# So for installing:
source("https://bioconductor.org/biocLite.R")
biocLite("rhdf5")
library(rhdf5)
# Then we're going to create an HDF5 file with the following command
created = h5createFile("example.h5")
# created should return TRUE
created
# Now let's create a group called 'foo'
created = h5createGroup("example.h5", "foo")
# And then create a group called 'baa'
created = h5createGroup("example.h5", "baa")
# And also create a subgroup of 'foo' called 'foobaa'
created = h5createGroup("example.h5", "foo/foobaa")
# Now, let's use the h5ls command to list data of that file
h5ls("example.h5")
# We can now write some data to groups and subgroups
A = matrix(1:10, nr=5, nc=2)
# Here, we're writing a simple matrix to the 'foo' group
h5write(A, "example.h5", "foo/A")
# Here we create an array called B
B = array(seq(0.1,2.0,by=0.1), dim=c(5,2,2))
# And we can also add attributes to that array
attr(B, "scale") <- "litter"
# And now write it to the 'foobaa' subgroup
h5write(B, "example.h5", "foo/foobaa/B")
# Now let's check the output of h5ls
h5ls("example.h5")
# We can also write data frames to the HDF5 file
df = data.frame(1L:5L, seq(0,1,length.out=5), c("ab", "cde", "fghi", "a", "s"), stringsAsFactors = F)
# We're going to write to the root / directly
h5write(df, "example.h5", "df")
# And see that it was actually written to the file
h5ls("example.h5")
# Now let's read the data from that file
readA <- h5read("example.h5", "foo/A")
readB <- h5read("example.h5", "foo/foobaa/B")
readdf <- h5read("example.h5", "df")
# We can also write directly to the file and specific values using index
# In the below example, we use the index to reffer to the first 3 rows in the
# first column
h5write(c(12,13,14), "example.h5", "foo/A", index=list(1:3,1))
