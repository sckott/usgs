# USGS App Challenge

## Notes
+ website for the app challenge [here](http://applifyingusgsdata.challenge.gov/)
+ we all need to sign up for the challenge, although one of us has to be the team leader (even if that person doesn't lead per se)
+ There is apparenlty no prize, except for the leader being flown to Denver to present the app (the travel is paid for)
 
## [Data sources](http://www.usgs.gov/core_science_systems/csas/activities.html) in brief
+ Biocomplexity Thesaurus - 
	+ [web service](http://www.usgs.gov/core_science_systems/csas/biocomplexity_thesaurus/web_service.html)
	+ uses SOAP
+ CSAS Geoportal - 
	+ [main]()
	+ no API? - looks like JSON/CVS show up as download options, can use the JSON, but how to construct queries?
+ Gap Analysis Program (GAP) - 
	+ [web service](http://gapanalysis.usgs.gov/data/web-services/)
	+ example call [here](http://dingo.gapanalysisprogram.com/ArcGIS/rest/services/NAT_Species_Amphibians/aBOTOx/MapServer?f=json&pretty=true)
	+ can't find any documentation for the API yet
+ Integrated Taxonomic Information System (ITIS) - Already use it in [taxize](https://github.com/ropensci/taxize_).
	+ will Species 2000 database include all ITIS? or have different data
	+ taking requests for API changes?
+ National Fish Habitat Action Plan (NFHAP) - 
	+ [data viewer](http://ecosystems.usgs.gov/fishhabitat/nfhap_mapviewer.html)
	+ [data - though not sure there's any API interface??](http://ecosystems.usgs.gov/fishhabitat/nfhap_download.html)
+ Ocean Biogeographic Information System-USA (OBIS-USA) - 
	+ [main](http://www.usgs.gov/obis-usa/)
	+ [data - though not sure there's any API interface??](http://obis-usa.colorado.edu/erddap/index.html)
	+ there's a URL generator apparently, hmmmm.
+ ScienceBase - Appears to be a metadata catalog mostly
	+ [main page](https://www.sciencebase.gov/confluence/display/sciencebase/ScienceBase)
	+ [REST documentation](https://www.sciencebase.gov/confluence/display/sciencebase/Creating+Queries+for+ScienceBase#CreatingQueriesforScienceBase-Example)
	+ Example queries
		+ [https://www.sciencebase.gov/catalog/items?s=Search&q=water&format=json&fields=title,facets,summary,body](https://www.sciencebase.gov/catalog/items?s=Search&q=water&format=json&fields=title,facets,summary,body)
		+ [https://www.sciencebase.gov/catalog/items?s=Search&q=water&format=json](https://www.sciencebase.gov/catalog/items?s=Search&q=water&format=json)
+ Vegetation Characterization Program (VCP) - 
	+ [main](http://www.usgs.gov/core_science_systems/csas/vip/index.html)
	+ [web services](http://gis1.usgs.gov/arcgis/rest/services/nvcp)
	+ E.g. calls
		+ [metadata](http://gis1.usgs.gov/arcgis/rest/services/nvcp/Acadia_NP/MapServer?f=pjson)
		+ [actual map as png](http://gis1.usgs.gov/arcgis/rest/services/nvcp/Agate_Fossil_Beds_NM/MapServer/export?bbox=-1.1555796946844999E7%2C5220831.371255575%2C-1.1541665204054998E7%2C5230496.950050622&format=png&transparent=false&f=image)
		+ []()
+ USGS Core Science Metadata Clearinghouse - 
	+ [main](http://mercury-ops2.ornl.gov/clearinghouse/)
	+ [looks like they have some sort of rudimentary API](http://mercury-ops2.ornl.gov/clearinghouse/services.html#opensearch)
+ Metadata clearinghouse
	+ [main](http://mercury-ops2.ornl.gov/clearinghouse/)
	+ Looks like it can be interfaced via curl calls with their search engine.  We can output results as RSS, and then grab URL's from the RSS feed.  This will let us call for webpages with all the metadata.  We could text mine the metadata?  Not sure what the utility of this is.  But it fits in with our MO of web based data delivery.  If people have interest I can try a quick example.
+ National Fish Habitat Partnership
	+ [main](http://ecosystems.usgs.gov/fishhabitat/)
	+ [web services](http://ecosystems.usgs.gov/fishhabitat/nfhap_download.html)

### In more detail
+ See the website [here](http://www.usgs.gov/core_science_systems/csas/activities.html)

### Notes from webinar with USGS folks
+ email usgs folks about how species 2000 differs from ITIS
+ she says they're taking suggestions for API
+ csas@usgs.gov
+ ask questions in discussion area of challenge.go

### Discussion on 2013-02-11 with Karthik, Ted, Scott
+ Plan is to make a shiny app as the main interface
	+ we can host the shiny app on heroku
	+ main focus will be around taxize
	+ we particularly want to highlight [ITIS](http://www.itis.gov/) as its by the USGS, but taxize interacts with a lot of different taxonomic databases, which can also be used
	+ we should  definitely use any taxonomically linked data they have, also use GBIF data
	+ with tabs for phylogeny output, map of distributions, possible tabs
		+ phylogeny
		+ map of distribution of species in d3
		+ map of distribution of species in R/ggplot2
	+ interact with CartoDB - embed their maps in the app
	+ code lives at [the usgs repo](https://github.com/ropensci/usgs)
	+ we can rsync the code to the shiny app where its hosted
		+ see email I forwarded to ropensci-dev gmail account
+ Possibly add: ["common tree"](http://www.ncbi.nlm.nih.gov/Taxonomy/CommonTree/wwwcmt.cgi) search with NCBI data (no API planned though) - get karthik to help? - this could then allow users to get a taxonomy based phylogeny with very disparate taxa (insect, mammal, etc.) - I have tried to pre-process the data, but no luck so far