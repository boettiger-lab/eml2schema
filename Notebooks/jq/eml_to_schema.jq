. |

{
  id: .["@id"],
  type: "Dataset",
  dataset: .dataset | {
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
  creator: [if .creator[].individualName then .creator[] | 
    if .address then 
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
      }
    else 
      {
      type: "Person",
      givenName: .individualName.givenName,
      familyName: .individualName.surName,
      }
    end
  else 
    empty
  end,
  
  if .creator[].organizationName then .creator[] | 
    if .address then
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
      }
    else 
        {
      type: "Organization",
      organizationName: .organizationName,}
    end
  else 
    empty
  end,
  
  if .contact.individualName then .contact | 
    if .address then
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
      }
    else 
      {
      type: "Person",
      givenName: .individualName.givenName,
      familyName: .individualName.surName,
      }
    end
  else 
    empty
  end,
  
  if .contact.organizationName then .contact | 
    if .address then
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
      }
    else 
      {
      type: "Organization",
      organizationName: .organizationName,}
    end
  else 
    empty
  end] | del( .[] |select(.givenName == null and .organizationName == null)) | unique | reverse },
    
  
  
  
  citation: .citation | {
    id: .id,
    type: "CreativeWork",
    headline: .title,
    about: .abstract.para,
    creator: [.creator | {
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
  }

}

