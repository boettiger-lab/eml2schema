. |

{
  id: .["@id"],
  type: "Dataset",
  citation: .citation | {
    id: .id,
    type: "CreativeWork",
    headline: .title,
    about: .abstract.para,
    
      
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
    
    keywords: .dataset.keywordSet.keyword,
    
    datePublished: .pubDate,
    
    headline: .title,
    
    license: .license,
    
    DataDownload: [.dataset.distribution.online.url, 
                    .distribution.online.url,
                    .dataset.dataTable.physical.distribution.online.url
                    ],
    
    variableMeasured: .dataset.dataTable.attributeList.attribute[] |{
      value: .attributeLabel,
      description: .attributeDefinition,
      unitText: .measurementScale.interval.unit.standardUnit,
      url: .url
    },
    
    text: [if .section|type == "array" then .section[] else .section end],
      
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
  
  creator: .creator |
  [if .individualName then  
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
  
  if .organizationName then  
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
  end]
}



