.dataset |
{
  id: .["@id"],
  type: "Dataset",
  creator: [{
      type: "Person",
      givenName: .creator[0].individualName.givenName,
      familyName: .creator[0].individualName.surName,
    },
    {
      type: "Person",
      givenName: .creator[1].individualName.givenName,
      familyName: .creator[1].individualName.surName,
    },
    {
      type: "Organization",
      organizationName: .contact.organizationName,
      address: {
        type: "PostalAddress",
        streetAddress: .contact.address.deliveryPoint,
        addressLocality: .contact.address.city,
        addressRegion: .contact.address.administrativeArea,
        postalCode: .contact.address.postalCode,
        addressCountry: .contact.address.country
      }
      
    }]
    ,

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

