
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

``` r
getwd()
```

    ## [1] "/Users/zihaoprimary/Desktop/UCB/Research/URAP/boettiger/eml2schema/Notebooks"

``` r
eml_to_schema <- readr::read_file("jq/eml_to_schema.jq")
eml <- readr::read_file("../examples/hf205.json")
jq(eml, eml_to_schema)
```

    ## {
    ##     "id": null,
    ##     "type": "Dataset",
    ##     "citation": {
    ##         "id": null,
    ##         "type": "CreativeWork",
    ##         "headline": null,
    ##         "about": null,
    ##         "creator": [
    ## 
    ##         ],
    ##         "publisher": [
    ## 
    ##         ],
    ##         "datePublished": null
    ##     },
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

``` r
eml_to_schema <- readr::read_file("jq/eml_to_schema2.jq")
eml_citation50 <- readr::read_file("../examples/eml/citation-sbclter-bibliography.50.json")
jq(eml_citation50, eml_to_schema)
```

    ## {
    ##     "id": null,
    ##     "type": "Dataset",
    ##     "citation": {
    ##         "id": "sbclter-bibliography.50",
    ##         "type": "CreativeWork",
    ##         "headline": "Satellite Views of Plumes and Blooms in the Santa Barbara Channel (in) Channel Islands I: Introduction to Channel Islands National Marine Sanctuary ",
    ##         "about": "This 30 min video is an introduction to the Channel Islands National Marine Sanctuary designed for a nation-wide audience of middle school aged students. It includes six minutes on satellite views of sediment plumes and phytoplankton blooms in the Santa Barbara Channel.",
    ##         "creator": [
    ##             {
    ##                 "type": "Person",
    ##                 "givenName": "S",
    ##                 "familyName": "Fangman"
    ##             },
    ##             {
    ##                 "type": "Person",
    ##                 "givenName": [
    ##                     "D",
    ##                     "A"
    ##                 ],
    ##                 "familyName": "Siegel"
    ##             }
    ##         ],
    ##         "publisher": [
    ##             {
    ##                 "type": "Organization",
    ##                 "organizationName": "Project Oceanography, University of South Florida"
    ##             }
    ##         ],
    ##         "datePublished": "2002"
    ##     },
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

``` r
eml_to_schema <- readr::read_file("jq/eml_to_schema.jq")
eml_citation51 <- readr::read_file("../examples/eml/citation-sbclter-bibliography.51.json")
jq(eml_citation51, eml_to_schema)
```

    ## {
    ##     "id": null,
    ##     "type": "Dataset",
    ##     "citation": {
    ##         "id": "sbclter-bibliography.51",
    ##         "type": "CreativeWork",
    ##         "headline": "Hopping with Life: The Ecology of Kelp on the Beach",
    ##         "about": "This 4 minute video describes the ecology of kelp wrack on the sandy beaches of Southern California, USA. The kelp wrack provides an important food source and habitat for kelp flies, maggots and small crustaceans on which several species of shore birds, starlings, common crows, black phoebes and warblers feed.",
    ##         "creator": [
    ##             {
    ##                 "type": "Person",
    ##                 "givenName": "Jenifer",
    ##                 "familyName": "Dugan"
    ##             }
    ##         ],
    ##         "publisher": [
    ##             {
    ##                 "type": "Organization",
    ##                 "organizationName": "The Ocean Channel (for Ty Warner Sea Center)"
    ##             }
    ##         ],
    ##         "datePublished": "2002"
    ##     },
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

eml <- jq(schema, schema_to_eml)
eml
```

    ## {
    ##     "dataset": {
    ##         "@id": null,
    ##         "creator": {
    ##             "organizationName": "OC/NOAA/NESDIS/NCEI > National Centers for Environmental Information, NESDIS, NOAA, U.S. Department of Commerce",
    ##             "phone": {
    ##                 "phonetype": "voice",
    ##                 "phone": "+1-828-271-4800"
    ##             },
    ##             "electronicMailAddress": "ncei.orders@noaa.gov",
    ##             "onlineUrl": "https://www.ncei.noaa.gov/"
    ##         },
    ##         "coverage": {
    ##             "temporalCoverage": {
    ##                 "rangeOfDates": {
    ##                     "beginDate": {
    ##                         "calenderDate": "1950-01-01"
    ##                     },
    ##                     "endDate": {
    ##                         "calenderDate": "2013-12-18"
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
    ##         }
    ##     }
    ## }
