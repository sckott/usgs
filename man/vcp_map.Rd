\name{vcp_map}
\alias{vcp_map}
\title{Get map png from the Vegetation Characterization Program (VCP).}
\usage{
  vcp_map(park = "Acadia_NP", f = "image", bbox = NULL,
    size = NULL, dpi = NULL, format = "png",
    transparent = "false", file = "~/image", plot = FALSE,
    ...)
}
\arguments{
  \item{park}{Park to search, defaults to Acadia National
  Park ("Acadia_NP").}

  \item{f}{The response format, one of json, image, or
  kmz.}

  \item{bbox}{The extent (bounding box) of the exported
  image. Unless the bboxSR parameter has been specified,
  the bbox is assumed to be in the spatial reference of the
  map. See examples below.}

  \item{size}{The size (width * height) of the exported
  image in pixels. If the size is not specified, an image
  with a default size of 400 * 400 will be exported.  e.g.:
  "600,500"}

  \item{dpi}{The device resolution of the exported image
  (dots per inch). If the dpi is not specified, an image
  with a default DPI of 96 will be exported.}

  \item{format}{The format of the exported image. The
  default format is png. Options are: png, png8, png24,
  jpg, pdf, bmp, gif, svg, and png32.}

  \item{layers}{Determines which layers appear on the
  exported map. There are four ways to specify which layers
  are shown: show: (only the layers specified in this list
  will be exported), hide (all layers except those
  specified in this list will be exported), include (in
  addition to the layers exported by default, the layers
  specified in this list will be exported), exclude (the
  layers exported by default excluding those specified in
  this list will be exported)}

  \item{transparent}{If TRUE, image will be exported with
  the background color of the map set as its transparent
  color. The default is FALSE. Only the png and gif formats
  support transparency.}

  \item{...}{Pass on parameters to grid.raster for plotting
  images. See ?grid::grid.raster for options.}
}
\description{
  Get map png from the Vegetation Characterization Program
  (VCP).
}
\examples{
\dontrun{
# plot a map
vcp_map(bbox="-1.1555796946844999E7,5220831.371255575,-1.1541665204054998E7,5230496.950050622", park="Agate_Fossil_Beds_NM", plot=TRUE)

# save the map to file
vcp_map(bbox="-1.1555796946844999E7,5220831.371255575,-1.1541665204054998E7,5230496.950050622", park="Agate_Fossil_Beds_NM")
}
}

