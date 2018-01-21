Creator\_eml2schema
================

``` r
library(jqr)
setwd('creator')
eml_to_schema <- readr::read_file("creator.jq")
eml <- readr::read_file("hf205.json")
jq(eml, eml_to_schema)
```

    ## [
    ##     {
    ##         "id": "HF205",
    ##         "type": null,
    ##         "name": "Aaron Ellison"
    ##     },
    ##     {
    ##         "id": "HF205",
    ##         "type": null,
    ##         "name": "Nicholas Gotelli"
    ##     }
    ## ]

I modified the example you provide me a little bit and extracted the names of the two creators. I am not quite sure if this is the correct way to do it.

I am also a bit confused about the id and type. Since in earthcube.json the id is an url and type is something like "Person" or "PropertyValue", but here they are mapped to the file name and null respectively. There is also nothing in the eml file that seems to correspond to the id and type.
