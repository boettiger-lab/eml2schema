. | 
{
dataset: {
  "@id": .["@id"],

  creator: .creator | {
    
    organizationName: .name,
    phone: .contactPoint | {
      phonetype: "voice",
      phone: .telephone
    },
    electronicMailAddress: .contactPoint .email,
    onlineUrl: .url
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
  }
}
}
