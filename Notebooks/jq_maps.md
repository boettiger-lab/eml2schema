
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

    ## [1] "/Users/Alex/Desktop/UCB/URAP/Boettiger_Group/eml2schema/Notebooks"

``` r
eml_to_schema <- readr::read_file("jq/eml_to_schema.jq")
eml <- readr::read_file("../examples/hf205.json")
jq(eml, eml_to_schema)
```

    ## {
    ##     "id": "HF205",
    ##     "type": "Dataset",
    ##     "creator": [
    ##         {
    ##             "type": "Person",
    ##             "givenName": "Nicholas",
    ##             "familyName": "Gotelli"
    ##         },
    ##         {
    ##             "type": "Person",
    ##             "givenName": "Aaron",
    ##             "familyName": "Ellison"
    ##         },
    ##         {
    ##             "type": "Organization",
    ##             "organizationName": "University of California",
    ##             "address": {
    ##                 "type": "PostalAddress",
    ##                 "streetAddress": "123 Campus Dr.",
    ##                 "addressLocality": "Santa Barbara",
    ##                 "addressRegion": "CA",
    ##                 "postalCode": "93101",
    ##                 "addressCountry": "USA"
    ##             }
    ##         },
    ##         {
    ##             "type": "Organization",
    ##             "organizationName": "Harvard Forest",
    ##             "address": {
    ##                 "type": "PostalAddress",
    ##                 "streetAddress": "324 North Main Street",
    ##                 "addressLocality": "Petersham",
    ##                 "addressRegion": "MA",
    ##                 "postalCode": "01366",
    ##                 "addressCountry": "USA"
    ##             }
    ##         },
    ##         {
    ##             "type": "Person",
    ##             "givenName": "Aaron",
    ##             "familyName": "Ellison",
    ##             "address": {
    ##                 "type": "PostalAddress",
    ##                 "streetAddress": "324 North Main Street",
    ##                 "addressLocality": "Petersham",
    ##                 "addressRegion": "MA",
    ##                 "postalCode": "01366",
    ##                 "addressCountry": "USA"
    ##             }
    ##         }
    ##     ],
    ##     "temporalCoverage": "2012-06-01/2013-12-31",
    ##     "spatialCoverage": {
    ##         "type": "Place",
    ##         "description": "Harvard Forest Greenhouse, Tom Swamp Tract (Harvard Forest)",
    ##         "geo": {
    ##             "type": "GeoShape",
    ##             "box": "+42.42 -72.29 +42.55 -72.10"
    ##         }
    ##     }
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
    ##     "@id": null,
    ##     "@type": "Dataset",
    ##     "creator": {
    ##         "organizationName": "OC/NOAA/NESDIS/NCEI > National Centers for Environmental Information, NESDIS, NOAA, U.S. Department of Commerce",
    ##         "phone": {
    ##             "phonetype": "voice",
    ##             "phone": "+1-828-271-4800"
    ##         },
    ##         "electronicMailAddress": "ncei.orders@noaa.gov",
    ##         "onlineUrl": "https://www.ncei.noaa.gov/"
    ##     },
    ##     "coverage": {
    ##         "temporalCoverage": {
    ##             "rangeOfDates": {
    ##                 "beginDate": "1950-01-01",
    ##                 "endDate": "2013-12-18"
    ##             }
    ##         },
    ##         "geographicCoverage": {
    ##             "geographicDescription": null,
    ##             "boundingCoordinates": {
    ##                 "westBoundingCoordinate": "-65.0",
    ##                 "eastBoundingCoordinate": "172.0",
    ##                 "northBoundingCoordinate": "72.0",
    ##                 "southBoundingCoordinate": "18.0"
    ##             }
    ##         }
    ##     }
    ## }
