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
                    .dataset.dataTable.physical.distribution.online.url,
                    .otherEntity.physical.distribution.online.url
                    ] | delpaths([path(.[]| select(.==null))]),
    
    variableMeasured: [if .dataset.dataTable.attributeList.attribute then .dataset.dataTable.attributeList.attribute[] else .attribute[] end |{
      id: .id,
      value: .attributeLabel,
      description: .attributeDefinition,
      unitText: .measurementScale.interval.unit.standardUnit,
      url: .url,
      maxValue: [if .measurementScale.interval.numericDomain then .measurementScale.interval.numericDomain.bounds.maximum.maximum else .measurementScale.dateTime.dateTimeDomain.bounds.maximum.maximum end],
      minValue: [if .measurementScale.interval.numericDomain then .measurementScale.interval.numericDomain.bounds.minimum.minimum else .measurementScale.dateTime.dateTimeDomain.bounds.minimum.minimum end]
      }] | delpaths([path(.[][]| select(.==null))]),
    
    
    
    text: [if .section|type == "array" then .section[] else .section end] | delpaths([path(.[]| select(.==null))]),
      
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
  
  creator: 
  
  [if .creator|type == "array" then .creator[] else .creator end |
  if .individualName then  
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



