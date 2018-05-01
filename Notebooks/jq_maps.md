
Mapping between Schema.Org and EML via JQ
=========================================

Key References:
---------------

-   [Google documentation for Dataset type](https://developers.google.com/search/docs/data-types/dataset)
-   [Schema.Org Dataset spec](http://schema.org/Dataset)
-   [Google Structured Data testing tool](https://search.google.com/structured-data/testing-tool)
-   [Ecological Metadata Language (EML) Spec](https://knb.ecoinformatics.org/#external//emlparser/docs/eml-2.1.1/./eml.html)
-   [JQ Query Language](https://stedolan.github.io/jq/tutorial/)

Additional references
---------------------

-   [DataONE global repository](https://search.dataone.org/#data)
-   [JSON-LD Playground](https://json-ld.org/playground/)
-   [JSON-LD Spec](https://json-ld.org/spec/latest/json-ld/)
-   [`emld` R package](https://github.com/cboettig/emld)

Example files:
--------------

-   [hf205.json](../examples/hf205.json) Is a pretty extensive example of data structured in the EML-JSON format.
-   [earthcube.json](../examples/earthcube.json) Is a pretty extensive example of data structured in the Schema.Org JSON format.

These example files should give you a good idea of how things are laid out in each case.

``` r
library(jqr)
```

Load in the current working drafts of the JQ maps.
You'll want to modify the `.jq` files so that they can map much more of the data.

EML to Schema.Org:
------------------

Let's map a more complete EML document into schema.org:

| del( .\[\] |select(.givenName == null and .organizationName == null)) | unique

\[if .creator|type == "array" then .creator\[\] else .creator end

``` r
getwd()
```

    ## [1] "/Users/zihaoprimary/Desktop/UCB/Research/URAP/boettiger/eml2schema/Notebooks"

``` r
eml_to_schema <- readr::read_file("jq/eml_to_schema.jq")
eml <- readr::read_file("../examples/hf205.json")
jq(eml, eml_to_schema)
```

    ## [
    ## 
    ## ]

``` r
eml_to_schema <- readr::read_file("jq/eml_to_schema.jq")
eml_citation50 <- readr::read_file("../examples/eml/eml-sample.json")
jq(eml_citation50, eml_to_schema)
```

    ## {
    ##     "id": null,
    ##     "type": "Dataset",
    ##     "citation": {
    ##         "id": null,
    ##         "type": "CreativeWork",
    ##         "headline": null,
    ##         "about": null,
    ##         "publisher": [
    ## 
    ##         ],
    ##         "datePublished": null
    ##     },
    ##     "keywords": [
    ##         "Old field grassland",
    ##         "biomass",
    ##         "productivity",
    ##         "species-area",
    ##         "species richness"
    ##     ],
    ##     "datePublished": null,
    ##     "headline": null,
    ##     "license": null,
    ##     "DataDownload": [
    ##         "http://metacat.nceas.ucsb.edu/knb/servlet/metacat?action=read&docid=knb.46.1"
    ##     ],
    ##     "variableMeasured": [
    ##         {
    ##             "id": "att.1",
    ##             "value": "Field",
    ##             "description": "Field where the data was collected\n        ",
    ##             "maxValue": [
    ##                 null
    ##             ],
    ##             "minValue": [
    ##                 null
    ##             ]
    ##         },
    ##         {
    ##             "id": "att.2",
    ##             "value": "year",
    ##             "description": "The year the data was collected\n        ",
    ##             "maxValue": [
    ##                 null
    ##             ],
    ##             "minValue": [
    ##                 "1944"
    ##             ]
    ##         },
    ##         {
    ##             "id": "att.3",
    ##             "value": "Species Richness",
    ##             "description": "Species richness for CDR",
    ##             "unitText": "dimensionless",
    ##             "maxValue": [
    ##                 null
    ##             ],
    ##             "minValue": [
    ##                 "0"
    ##             ]
    ##         },
    ##         {
    ##             "id": "att.4",
    ##             "value": "percent cover",
    ##             "description": "The percent ground cover on the field\n        ",
    ##             "maxValue": [
    ##                 null
    ##             ],
    ##             "minValue": [
    ##                 null
    ##             ]
    ##         },
    ##         {
    ##             "id": "att.5",
    ##             "value": "Average Species Richness for 1991",
    ##             "description": "The average species richness for the field in 1991\n        ",
    ##             "maxValue": [
    ##                 null
    ##             ],
    ##             "minValue": [
    ##                 null
    ##             ]
    ##         },
    ##         {
    ##             "id": "att.6",
    ##             "value": "Average Species Richness for 1992",
    ##             "description": "The average species richness for the field in 1992\n        ",
    ##             "maxValue": [
    ##                 null
    ##             ],
    ##             "minValue": [
    ##                 null
    ##             ]
    ##         },
    ##         {
    ##             "id": "att.7",
    ##             "value": "Average Species Richness for 1993",
    ##             "description": "The average species richness for the field in 1993\n        ",
    ##             "maxValue": [
    ##                 null
    ##             ],
    ##             "minValue": [
    ##                 null
    ##             ]
    ##         },
    ##         {
    ##             "id": "att.8",
    ##             "value": "Average Species Richness for 1994",
    ##             "description": "The average species richness for the field in 1994\n        ",
    ##             "maxValue": [
    ##                 null
    ##             ],
    ##             "minValue": [
    ##                 null
    ##             ]
    ##         },
    ##         {
    ##             "id": "att.9",
    ##             "value": "Average Species Richness for 1995",
    ##             "description": "The average species richness for the field in 1995\n        ",
    ##             "maxValue": [
    ##                 null
    ##             ],
    ##             "minValue": [
    ##                 null
    ##             ]
    ##         },
    ##         {
    ##             "id": "att.10",
    ##             "value": "Average Species Richness for 1996",
    ##             "description": "The average species richness for the field in 1996\n        ",
    ##             "maxValue": [
    ##                 null
    ##             ],
    ##             "minValue": [
    ##                 null
    ##             ]
    ##         },
    ##         {
    ##             "id": "att.11",
    ##             "value": "mean species richness",
    ##             "description": "the mean species richness from 1991 to 1996\n        ",
    ##             "maxValue": [
    ##                 null
    ##             ],
    ##             "minValue": [
    ##                 null
    ##             ]
    ##         },
    ##         {
    ##             "id": "att.12",
    ##             "value": "Biomass",
    ##             "description": "The total biomass measured in this field\n        ",
    ##             "maxValue": [
    ##                 null
    ##             ],
    ##             "minValue": [
    ##                 null
    ##             ]
    ##         },
    ##         {
    ##             "id": "att.13",
    ##             "value": "Species Per Square Meter",
    ##             "description": "Calculated species per square meter\n        ",
    ##             "maxValue": [
    ##                 null
    ##             ],
    ##             "minValue": [
    ##                 null
    ##             ]
    ##         },
    ##         {
    ##             "id": "att.14",
    ##             "value": "Time",
    ##             "description": "The time of day for this observation, 24 hour clock\n        ",
    ##             "maxValue": [
    ##                 "19:00:00.0"
    ##             ],
    ##             "minValue": [
    ##                 "15:00:00.0"
    ##             ]
    ##         }
    ##     ],
    ##     "text": [
    ## 
    ##     ],
    ##     "temporalCoverage": "/",
    ##     "spatialCoverage": {
    ##         "type": "Place",
    ##         "description": null,
    ##         "geo": {
    ##             "type": "GeoShape",
    ##             "box": "   "
    ##         }
    ##     },
    ##     "creator": [
    ## 
    ##     ]
    ## }

Schema.Org to EML
-----------------

Convert a dataset marked up in <http://schema.org/Dataset> terms into EML

``` r
schema_to_eml <-  readr::read_file("jq/schema_to_eml.jq")
schema <- readr::read_file("../examples/schema-org-dataset.json")
getwd()
```

    ## [1] "/Users/zihaoprimary/Desktop/UCB/Research/URAP/boettiger/eml2schema/Notebooks"

``` r
eml <- jq(schema, schema_to_eml)
eml
```

    ## {
    ##     "@type": "EML",
    ##     "dataset": {
    ##         "@id": null,
    ##         "creator": [
    ##             {
    ##                 "@id": null,
    ##                 "individualName": [
    ## 
    ##                 ],
    ##                 "organizationName": [
    ##                     "OC/NOAA/NESDIS/NCEI > National Centers for Environmental Information, NESDIS, NOAA, U.S. Department of Commerce"
    ##                 ],
    ##                 "phone": {
    ##                     "phonetype": "voice",
    ##                     "phone": "+1-828-271-4800"
    ##                 },
    ##                 "electronicMailAddress": "ncei.orders@noaa.gov",
    ##                 "onlineUrl": "https://www.ncei.noaa.gov/"
    ##             }
    ##         ],
    ##         "citation": {
    ##             "article": null
    ##         },
    ##         "description": "Storm Data is provided by the National Weather Service (NWS) and contain statistics on...",
    ##         "publisher": null,
    ##         "project": null,
    ##         "distribution": [
    ##             {
    ##                 "online": {
    ##                     "onlineUrl": "http://www.ncdc.noaa.gov/stormevents/ftp.jsp"
    ##                 }
    ##             },
    ##             {
    ##                 "online": {
    ##                     "onlineUrl": "http://gis.ncdc.noaa.gov/all-records/catalog/search/resource/details.page?id=gov.noaa.ncdc:C00510"
    ##                 }
    ##             }
    ##         ],
    ##         "coverage": {
    ##             "temporalCoverage": {
    ##                 "rangeOfDates": {
    ##                     "beginDate": {
    ##                         "calendarDate": "1950-01-01"
    ##                     },
    ##                     "endDate": {
    ##                         "calendarDate": "2013-12-18"
    ##                     }
    ##                 }
    ##             },
    ##             "geographicCoverage": {
    ##                 "geographicDescription": null,
    ##                 "boundingCoordinates": {
    ##                     "westBoundingCoordinate": "-65.0",
    ##                     "eastBoundingCoordinate": "172.0",
    ##                     "northBoundingCoordinate": "72.0",
    ##                     "southBoundingCoordinate": "18.0"
    ##                 }
    ##             }
    ##         },
    ##         "onlineUrl": "https://catalog.data.gov/dataset/ncdc-storm-events-database",
    ##         "licenseURL": null
    ##     }
    ## }

``` {r}/
schema_to_eml <-  readr::read_file("jq/schema_to_eml.jq")
schema <- readr::read_file("../examples/earthcube.json")
getwd()
eml_earthcube <- jq(schema, schema_to_eml)
eml_earthcube
```
