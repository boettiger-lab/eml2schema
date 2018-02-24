. | 
{"@type": "EML",
dataset: {
  "@id": .["@id"],

  creator: [.creator[] | {
    "@id": .["@id"],
    individualName: .name,
    phone: .contactPoint | {
      phonetype: "voice",
      phone: .telephone
    },
    electronicMailAddress: .contactPoint .email,
    onlineUrl: .url
  }],
  
  citation: {
    article: .citation
  },
  
  description: .description,
  
  publisher: .publisher | {
    "@id": .["@id"],
    organizationName: .name,
    onlineUrl: .url,
  },
  
  project: .isPartOf | {
    "@id": .["@id"],
    title: .name,
    abstract: .description
  },
  
  distribution:  .distribution | {
    online: {
      onlineUrl: .contentUrl
      }
  },
  
  coverage: {
    temporalCoverage: {
      rangeOfDates: {
        beginDate : {
          calendarDate: .temporalCoverage | split("/") |.[0]},
        endDate : {
          calendarDate: .temporalCoverage | split("/") |.[1] }
      }
    },
    geographicCoverage: .spatialCoverage | {
      geographicDescription: .description,
      boundingCoordinates: {
        westBoundingCoordinate: .geo.box | split(" ") | .[1],
        eastBoundingCoordinate: .geo.box | split(" ") | .[3],
        northBoundingCoordinate: .geo.box | split(" ") | .[2],
        southBoundingCoordinate: .geo.box | split(" ") | .[0]
      }
    }
  },
  onlineUrl: .url,
  licenseURL: .license
  
}
}
