
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
    ##     "dataset": {
    ##         "temporalCoverage": "2012-06-01/2013-12-31",
    ##         "spatialCoverage": {
    ##             "type": "Place",
    ##             "description": "Harvard Forest Greenhouse, Tom Swamp Tract (Harvard Forest)",
    ##             "geo": {
    ##                 "type": "GeoShape",
    ##                 "box": "+42.42 -72.29 +42.55 -72.10"
    ##             }
    ##         },
    ##         "creator": [
    ##             {
    ##                 "type": "Person",
    ##                 "givenName": "Nicholas",
    ##                 "familyName": "Gotelli"
    ##             },
    ##             {
    ##                 "type": "Person",
    ##                 "givenName": "Aaron",
    ##                 "familyName": "Ellison"
    ##             },
    ##             {
    ##                 "type": "Organization",
    ##                 "organizationName": "University of California",
    ##                 "address": {
    ##                     "type": "PostalAddress",
    ##                     "streetAddress": "123 Campus Dr.",
    ##                     "addressLocality": "Santa Barbara",
    ##                     "addressRegion": "CA",
    ##                     "postalCode": "93101",
    ##                     "addressCountry": "USA"
    ##                 }
    ##             }
    ##         ],
    ##         "citation": {
    ##             "id": null,
    ##             "type": "CreativeWork",
    ##             "headline": null,
    ##             "about": null,
    ##             "creator": [
    ## 
    ##             ],
    ##             "publisher": [
    ## 
    ##             ],
    ##             "datePublished": null
    ##         }
    ##     }
    ## }

``` r
eml_to_schema <- readr::read_file("jq/eml_to_schema.jq")
eml_citation51 <- readr::read_file("../examples/eml/citation-sbclter-bibliography.50.json")
jq(eml_citation51, eml_to_schema)
```

    ## {
    ##     "id": null,
    ##     "type": "Dataset",
    ##     "dataset": {
    ##         "temporalCoverage": "/",
    ##         "spatialCoverage": {
    ##             "type": "Place",
    ##             "description": null,
    ##             "geo": {
    ##                 "type": "GeoShape",
    ##                 "box": "   "
    ##             }
    ##         },
    ##         "creator": [
    ## 
    ##         ],
    ##         "citation": {
    ##             "id": null,
    ##             "type": "CreativeWork",
    ##             "headline": null,
    ##             "about": null,
    ##             "creator": [
    ## 
    ##             ],
    ##             "publisher": [
    ## 
    ##             ],
    ##             "datePublished": null
    ##         }
    ##     }
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

``` r
schema_to_eml <-  readr::read_file("jq/schema_to_eml.jq")
schema <- readr::read_file("../examples/earthcube.json")
getwd()
```

    ## [1] "/Users/zihaoprimary/Desktop/UCB/Research/URAP/boettiger/eml2schema/Notebooks"

``` r
eml_earthcube <- jq(schema, schema_to_eml)
eml_earthcube
```

    ## {
    ##     "@type": "EML",
    ##     "dataset": {
    ##         "@id": "https://www.bco-dmo.org/dataset/472032",
    ##         "creator": [
    ##             {
    ##                 "@id": "https://www.bco-dmo.org/person/51317",
    ##                 "individualName": [
    ##                     {
    ##                         "givenName": "Uta",
    ##                         "surName": "Passow"
    ##                     }
    ##                 ],
    ##                 "organizationName": [
    ## 
    ##                 ],
    ##                 "phone": {
    ##                     "phonetype": "voice",
    ##                     "phone": null
    ##                 },
    ##                 "electronicMailAddress": null,
    ##                 "onlineUrl": "https://www.bco-dmo.org/person/51317"
    ##             },
    ##             {
    ##                 "@id": "https://www.bco-dmo.org/person/50663",
    ##                 "individualName": [
    ##                     {
    ##                         "givenName": "Mark",
    ##                         "surName": "Brzezinski"
    ##                     }
    ##                 ],
    ##                 "organizationName": [
    ## 
    ##                 ],
    ##                 "phone": {
    ##                     "phonetype": "voice",
    ##                     "phone": null
    ##                 },
    ##                 "electronicMailAddress": null,
    ##                 "onlineUrl": "https://www.bco-dmo.org/person/50663"
    ##             },
    ##             {
    ##                 "@id": "https://www.bco-dmo.org/person/50575",
    ##                 "individualName": [
    ##                     {
    ##                         "givenName": "Craig",
    ##                         "surName": "Carlson"
    ##                     }
    ##                 ],
    ##                 "organizationName": [
    ## 
    ##                 ],
    ##                 "phone": {
    ##                     "phonetype": "voice",
    ##                     "phone": null
    ##                 },
    ##                 "electronicMailAddress": null,
    ##                 "onlineUrl": "https://www.bco-dmo.org/person/50575"
    ##             },
    ##             {
    ##                 "@id": "https://www.bco-dmo.org/person/471722",
    ##                 "individualName": [
    ##                     {
    ##                         "givenName": "Anna",
    ##                         "surName": "James"
    ##                     }
    ##                 ],
    ##                 "organizationName": [
    ## 
    ##                 ],
    ##                 "phone": {
    ##                     "phonetype": "voice",
    ##                     "phone": null
    ##                 },
    ##                 "electronicMailAddress": null,
    ##                 "onlineUrl": "https://www.bco-dmo.org/person/471722"
    ##             }
    ##         ],
    ##         "citation": {
    ##             "article": "Passow, U., Brzezinski, M., Carlson, C. (2016) Removal of organic carbon by natural bacterioplankton communities as a function of pCO2 from laboratory experiments between 2012 and 2016. Biological and Chemical Oceanography Data Management Office (BCO-DMO). Dataset version 2013-11-21 [if applicable, indicate subset used]. doi:10.1575/1912/bco-dmo.665253 [access date]"
    ##         },
    ##         "description": "&lt;p&gt;This dataset includes results of laboratory experiments which measured dissolved organic carbon (DOC) usage by natural bacteria in seawater at different pCO2 levels. &amp;nbsp;Included in this dataset are; bacterial&amp;nbsp;abundance, total organic carbon (TOC), what DOC was added to the experiment, target pCO2 level. &amp;nbsp;The experiments were conducted between 2012 and 2016 during the R/V Kilo Moana cruise KM1416, at the Bermuda Institute for Ocean Sciences (BIOS), and the University of Santa Barbara.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Abstract:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Factors that affect the removal of organic carbon by heterotrophic bacterioplankton can impact the rate and magnitude of organic carbon loss in the ocean through the conversion of a portion of consumed organic carbon to CO2. Through enhanced rates of consumption, surface bacterioplankton communities can also reduce the amount of dissolved organic carbon (DOC) available for export from the surface ocean. The present study investigated the direct effects of elevated pCO2 on bacterioplankton removal of several forms of DOC ranging from glucose to complex phytoplankton exudate and lysate, and naturally occurring DOC. Elevated pCO2 (1000 &ndash; 1500 ppm) enhanced both the rate and magnitude of organic carbon removal by bacterioplankton communities compared to low (pre-industrial and ambient) pCO2 (250 &ndash; ~400 ppm). The increased removal was largely due to enhanced respiration, rather than enhanced production of bacterioplankton biomass.&lt;/p&gt;",
    ##         "publisher": {
    ##             "@id": "https://www.bco-dmo.org/affiliation/191",
    ##             "individualName": [
    ## 
    ##             ],
    ##             "organizationName": [
    ##                 "BCO-DMO"
    ##             ],
    ##             "onlineUrl": "https://www.bco-dmo.org/affiliation/191"
    ##         },
    ##         "project": {
    ##             "@id": "https://www.bco-dmo.org/project/2284",
    ##             "title": "Will high CO2 conditions affect production, partitioning and fate of organic matter?",
    ##             "abstract": "From the NSF Award Abstract\nCoastal waters are already experiencing episodic exposure to carbonate conditions that were not expected until the end of the century making understanding the response to these episodic events as important as understanding the long-term mean response. Among the most striking examples are those associated with coastal upwelling along the west coast of the US, where the pH of surface waters may drop to 7.6 and pCO2 can reach 1100 uatm. Upwelling systems are responsible for a significant fraction of global carbon export making them prime targets for investigations on how ocean acidification is already affecting the biological pump today.\nIn this study, researchers at the University of California at Santa Barbara will investigate the potential effects of ocean acidification on the strength of the biological pump under the transient increases in CO2 experienced due to upwelling. Increases in CO2 are expected to alter the path and processing of carbon through marine food webs thereby strengthening the biological pump. Increases in inorganic carbon without proportional increases in nutrients result in carbon over-consumption by phytoplankton. How carbon over-consumption affects the strength of the biological pump will depend on the fate of the extra carbon that is either incorporated into phytoplankton cells forming particulate organic matter (POM), or is excreted as dissolved organic matter (DOM). Results from mesocosm experiments demonstrate that the mechanisms controlling the partitioning of fixed carbon between the particulate and dissolved phases, and the processing of those materials, are obscured when both processes operate simultaneously under natural or semi-natural conditions. Here, POM and DOM production and the heterotrophic processing of these materials will be separated experimentally across a range of CO2 concentrations by conducting basic laboratory culture experiments. In this way the mechanisms whereby elevated CO2 alters the flow of carbon along these paths can be elucidated and better understood for use in mechanistic forecasting models.\nBroader Impacts- The need to understand the effects of ocean acidification for the future of society is clear. In addition to research education, both formal and informal, will be important for informing the public. Within this project 1-2 graduate students and 2-3 minority students will be recruited as interns from the CAMP program (California Alliance for Minority Participation). Within the 'Ocean to Classrooms' program run by outreach personnel from UCSB's Marine Science Institute an educational unit for K-12 students will be developed. Advice and support is also given to the Education Coordinator of NOAA, Channel Islands National Marine Sanctuary for the development of an education unit on ocean acidification.\n\nPUBLICATIONS PRODUCED AS A RESULT OF THIS RESEARCH\nArnosti C, Grossart H-P, Muehling M, Joint I, Passow U. &quot;Dynamics of extracellular enzyme activities in seawater under changed atmsopheric pCO2: A mesocosm investigation.,&quot; Aquatic Microbial Ecology, v.64, 2011, p. 285.\nPassow U. &quot;The Abiotic Formation of TEP under Ocean Acidification Scenarios.,&quot; Marine Chemistry, v.128-129, 2011, p. 72.\nPassow, Uta; Carlson, Craig A.. &quot;The biological pump in a high CO2 world,&quot; MARINE ECOLOGY PROGRESS SERIES, v.470, 2012, p. 249-271.\nGaerdes, Astrid; Ramaye, Yannic; Grossart, Hans-Peter; Passow, Uta; Ullrich, Matthias S.. &quot;Effects of Marinobacter adhaerens HP15 on polymer exudation by Thalassiosira weissflogii at different N:P ratios,&quot; MARINE ECOLOGY PROGRESS SERIES, v.461, 2012, p. 1-14.\nPhilip Boyd, Tatiana Rynearson, Evelyn Armstrong, Feixue Fu, Kendra Hayashi, Zhangi Hu, David Hutchins, Raphe Kudela, Elena Litchman, Margaret Mulholland, Uta Passow, Robert Strzepek, Kerry Whittaker, Elizabeth Yu, Mridul Thomas. &quot;Marine Phytoplankton Temperature versus Growth Responses from Polar to Tropical Waters - Outcome of a Scientific Community-Wide Study,&quot; PLOS One 8, v.8, 2013, p. e63091.\nArnosti, C., B. M. Fuchs, R. Amann, and U. Passow. &quot;Contrasting extracellular enzyme activities of particle-associated bacteria from distinct provinces of the North Atlantic Ocean,&quot; Frontiers in Microbiology, v.3, 2012, p. 1.\nKoch, B.P., Kattner, G., Witt, M., Passow, U., 2014. Molecular insights into the microbial formation of marine dissolved organic matter: recalcitrant or labile? Biogeosciences Discuss. 11 (2), 3065-3111.\nTaucher, J., Brzezinski, M., Carlson, C., James, A., Jones, J., Passow, U., Riebesell, U., submitted. Effects of warming and elevated pCO2 on carbon uptake and partitioning of the marine diatoms Thalassiosira weissflogii and Dactyliosolen fragilissimus. Limnology and Oceanography\n"
    ##         },
    ##         "distribution": [
    ##             {
    ##                 "online": {
    ##                     "onlineUrl": "https://www.bco-dmo.org/dataset/472032/data/download"
    ##                 }
    ##             }
    ##         ],
    ##         "coverage": {
    ##             "temporalCoverage": {
    ##                 "rangeOfDates": {
    ##                     "beginDate": {
    ##                         "calendarDate": "2012-09-20"
    ##                     },
    ##                     "endDate": {
    ##                         "calendarDate": "2016-01-22"
    ##                     }
    ##                 }
    ##             },
    ##             "geographicCoverage": {
    ##                 "geographicDescription": null,
    ##                 "boundingCoordinates": {
    ##                     "westBoundingCoordinate": "-64.6353,34.407",
    ##                     "eastBoundingCoordinate": null,
    ##                     "northBoundingCoordinate": null,
    ##                     "southBoundingCoordinate": "-149.8727,-17.45"
    ##                 }
    ##             }
    ##         },
    ##         "onlineUrl": "https://www.bco-dmo.org/dataset/472032",
    ##         "licenseURL": "http://creativecommons.org/licenses/by/4.0/"
    ##     }
    ## }
