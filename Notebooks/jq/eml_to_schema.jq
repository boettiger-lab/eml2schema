.dataset |

{
  id: .["@id"],
  type: "Dataset",
  creator: [if .creator[] .individualName then 
    .creator[] |if .individualName then
      .individualName | {
      type: "Person",
      givenName: .givenName,
      familyName: .surName,
    }
    else
      empty
    end
  else
    .contact | {
      type: "Organization",
      organizationName: .organizationName,
      address: {
        type: "PostalAddress",
        streetAddress: .address.deliveryPoint,
        addressLocality: .address.city,
        addressRegion: .address.administrativeArea,
        postalCode: .address.postalCode,
        addressCountry: .address.country,}
        }
  
  end] | unique | reverse, 
    
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

