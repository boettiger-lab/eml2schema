.dataset |
{
  id: .["@id"],
  type: .["@type"],
  name: .creator[].individualName |
    [.givenName, .surName] | join(" ")
}