output "dn" {
  value       = aci_rest.physDomP.id
  description = "Distinguished name of `physDomP` object."
}

output "name" {
  value       = aci_rest.physDomP.content.name
  description = "Physical domain name."
}
