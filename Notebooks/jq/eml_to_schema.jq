.dataset |
{
  id: .["@id"],
  type: if (.creator[0] | keys [0]) == "individualName" then "Person" else "Organization" end
  creator: [.creator[] .individualName | {
    givenName: .givenName,
    familyName: .surName
    }],
  temporalCoverage: .coverage.temporalCoverage.rangeOfDates |
    [.beginDate.calendarDate, .endDate.calendarDate] | join("/"),
  spatialCoverage: .coverage.geographicCoverage | {
    description: .geographicDescription,
      geo: {
        box: .boundingCoordinates |
        [.southBoundingCoordinate,
         .westBoundingCoordinate,
         .northBoundingCoordinate,
         .eastBoundingCoordinate] | join(" ")
      }
    
  }
}

