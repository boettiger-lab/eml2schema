. |

{
  id: .["@id"],
  type: "Dataset",
  citation: .citation | {
    id: .id,
    type: "CreativeWork",
    headline: .title,
    about: .abstract.para,
    creator: [.creator[] | {
      type: "Person",
      givenName: .individualName.givenName,
      familyName: .individualName.surName, },
      {
      type: "Organization",
      organizationName: .organizationName}] | del( .[] |select(.givenName == null and .organizationName == null)) | unique,
      
    publisher: [.audioVisual.publisher | {
      type: "Person",
      givenName: .individualName.givenName,
      familyName: .individualName.surName, 
    },
    {
      type: "Organization",
      organizationName: .organizationName
    }] | del( .[] |select(.givenName == null and .organizationName == null)) | unique,
    datePublished: .pubDate},
      
      
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
  },

  
  creator: [.creator | 
      {
      type: "Person",
      givenName: .individualName.givenName,
      familyName: .individualName.surName,
      address: {
        type: "PostalAddress",
        streetAddress: .address.deliveryPoint,
        addressLocality: .address.city,
        addressRegion: .address.administrativeArea,
        postalCode: .address.postalCode,
        addressCountry: .address.country}
      },
  
      {
      type: "Organization",
      organizationName: .organizationName,
      address: {
        type: "PostalAddress",
        streetAddress: .address.deliveryPoint,
        addressLocality: .address.city,
        addressRegion: .address.administrativeArea,
        postalCode: .address.postalCode,
        addressCountry: .address.country,}
      },
    
    .contact | 
      {
      type: "Person",
      givenName: .individualName.givenName,
      familyName: .individualName.surName,
      address: {
        type: "PostalAddress",
        streetAddress: .address.deliveryPoint,
        addressLocality: .address.city,
        addressRegion: .address.administrativeArea,
        postalCode: .address.postalCode,
        addressCountry: .address.country,}
      },
      {
      type: "Organization",
      organizationName: .organizationName,
      address: {
        type: "PostalAddress",
        streetAddress: .address.deliveryPoint,
        addressLocality: .address.city,
        addressRegion: .address.administrativeArea,
        postalCode: .address.postalCode,
        addressCountry: .address.country,}
      } ]| del( .[] |select(.givenName == null and .organizationName == null)) | unique | reverse
}



