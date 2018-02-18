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
    datePublished: .pubDate}
}



