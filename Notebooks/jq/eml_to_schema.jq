.dataset |
{
  id: .["@id"],
  type: "Dataset",
  creator: [.creator[] .individualName | {
    type: "Person",
    id: .id,
    givenName: .givenName,
    familyName: .surName
    }],
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

