# usgs

### Install `usgs` 

+ Development version from GitHub:

```R 
install.packages("devtools")
require(devtools)
install_github("usgs", "ropensci")
require(usgs)
```

### Display a map in R

```R
> vcp_map(bbox="-1.1555796946844999E7,5220831.371255575,-1.1541665204054998E7,5230496.950050622", park="Agate_Fossil_Beds_NM", plot=TRUE)
```

![thing](http://ropensci.github.com/usgs/map.png)


### Download the map to a file

```R
> vcp_map(bbox="-1.1555796946844999E7,5220831.371255575,-1.1541665204054998E7,5230496.950050622", park="Agate_Fossil_Beds_NM")
File downloaded at ~/image.png
```