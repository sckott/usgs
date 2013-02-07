#' Get map png from the Vegetation Characterization Program (VCP).
#' 
#' @import RCurl XML png plyr
#' @param park Park to search, defaults to Acadia National Park ("Acadia_NP").
#' @param f The response format, one of json, image, or kmz.
#' @param bbox The extent (bounding box) of the exported image. Unless the 
#' 		bboxSR parameter has been specified, the bbox is assumed to be in the 
#' 		spatial reference of the map. See examples below.
#' @param size The size (width * height) of the exported image in pixels. If the 
#' 	size is not specified, an image with a default size of 400 * 400 will be exported.
#' 	e.g.: "600,500"
#' @param dpi The device resolution of the exported image (dots per inch). If 
#' 	the dpi is not specified, an image with a default DPI of 96 will be exported.
#' @param format The format of the exported image. The default format is png. Options
#' 	are: png, png8, png24, jpg, pdf, bmp, gif, svg, and png32.
#' @param layers Determines which layers appear on the exported map. There are 
#' 	four ways to specify which layers are shown: show: (only the layers specified 
#' 	in this list will be exported), hide (all layers except those specified in 
#' 	this list will be exported), include (in addition to the layers exported by 
#' 	default, the layers specified in this list will be exported), exclude (the 
#' 	layers exported by default excluding those specified in this list will be 
#' 	exported)
#' @param transparent If TRUE, image will be exported with the background color 
#' 	of the map set as its transparent color. The default is FALSE. Only the png 
#' 	and gif formats support transparency.
#' @param ... Pass on parameters to grid.raster for plotting images. See 
#' 	?grid::grid.raster for options.
#' @examples \dontrun{
#' # plot a map
#' vcp_map(bbox="-1.1555796946844999E7,5220831.371255575,-1.1541665204054998E7,5230496.950050622", park="Agate_Fossil_Beds_NM", plot=TRUE)
#' 
#' # save the map to file
#' vcp_map(bbox="-1.1555796946844999E7,5220831.371255575,-1.1541665204054998E7,5230496.950050622", park="Agate_Fossil_Beds_NM")
#' }
#' @export
vcp_map <- function(park = "Acadia_NP", f = "image", bbox = NULL, size = NULL, 
				dpi = NULL, format = "png", transparent = "false", file = "~/image", 
				plot = FALSE, ...)
{
	file2 <- paste(file, ".", format, sep="")
	url = "http://gis1.usgs.gov/arcgis/rest/services/nvcp"
	url2 <- paste(url, "/", park, "/MapServer/export", sep="")
	args <- compact(list(f = f, bbox = bbox, size = size, dpi = dpi, format = format, transparent = transparent))
	img <- content(GET(url2, query=args), as="parsed")
	
	if(plot==FALSE){
		png(file2)
		grid::grid.raster(img, ...)
		dev.off()
		message(paste("File downloaded at ", file2, sep=""))
	} else
	{
		grid::grid.raster(img, ...)
	}
}
# getURL("http://gis1.usgs.gov/arcgis/rest/services/nvcp/Agate_Fossil_Beds_NM/MapServer/export?bbox=-1.15557969,522083,-1.154166520,52304&format=png&transparent=false&f=image")
# url <- "http://gis1.usgs.gov/arcgis/rest/services/nvcp/Agate_Fossil_Beds_NM/MapServer/export?bbox=-1.1555796946844999E7%2C5220831.371255575%2C-1.1541665204054998E7%2C5230496.950050622&format=png&transparent=false&f=image"
# url <= "http://gis1.usgs.gov/arcgis/rest/services/nvcp/Agate_Fossil_Beds_NM/MapServer/export?bbox=-1.155579%2C5220831%2C-1.154166520405%2C5230496&format=png&transparent=false&f=image"
# # readPNG(getURL(url))
# download.file(url, destfile="~/file.png", mode="wb")
# "http://gis1.usgs.gov/arcgis/rest/services/nvcp/Acadia_NP/MapServer?f=json"
# fromJSON("http://gis1.usgs.gov/arcgis/rest/services/Specialty/ESRI_StatesCitiesRivers_USA/MapServer/find?searchText=island&contains=true&layers=0%2C2&returnGeometry=true&f=json")