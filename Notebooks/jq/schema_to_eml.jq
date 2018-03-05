. | 
{"@type": "EML",
dataset: {
  "@id": .["@id"],

  creator: [if .creator|type == "array" then .creator[] else .creator end | {
    "@id": .["@id"],
    individualName: [if .["@type"] == "Person" then {
       givenName: .name | split(" ") |.[1],
       surName: .name | split(" ") |.[2] }
    else 
      empty
    end] ,
    
    organizationName: [if .["@type"] == "Organization" then 
       .name
    else 
      empty
    end],
    
    phone: .contactPoint | {
      phonetype: "voice",
      phone: .telephone
    },
    electronicMailAddress: .contactPoint.email,
    onlineUrl: .url
  }],
  
  citation: {
    article: .citation
  },
  
  description: .description,
  
  publisher: .publisher | {
    "@id": .["@id"],
    individualName: [if .["@type"] == "Person" then {
       givenName: .name | split(" ") |.[1],
       surName: .name | split(" ") |.[2] }
    else 
      empty
    end] ,
    
    organizationName: [if .["@type"] == "Organization" then 
       .name
    else 
      empty
    end],
    onlineUrl: .url,
  } | del( . |select(.["@id"] == null)),
  
  project: .isPartOf | {
    "@id": .["@id"],
    title: .name,
    abstract: .description
  },

  distribution: [if .distribution|type == "array" then .distribution[] else .distribution end | {
    online: {
      onlineUrl: .contentUrl
      }
  }],
  
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
