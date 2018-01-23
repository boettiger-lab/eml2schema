.dataset |
{
  id: .["@id"],
  type: "Dataset",
  creator: [.creator[] | if .individualName then 
    .individualName | {
      type: "Person",
      givenName: .givenName,
      familyName: .surName,
    } 
    else
      null 
    end], 
  temporalCoverage: .coverage.temporalCoverage.rangeOfDates |
    [.beginDate.calendarDate, .endDate.calendarDate] | join("/"),
  spatialCoverage: .coverage.geographicCoverage | {
    type: "Place",
    description: .geographicDescription,
      geo: {
        type: "GeoShape",
        box: .boundingCoordinates |
        [.southBoundingCoordinate,
         .westBoundingCoordinate,
         .northBoundingCoordinate,
         .eastBoundingCoordinate] | join(" ")
      }
    
  }
}

