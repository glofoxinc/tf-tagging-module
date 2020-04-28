output "id" {
  value       = local.enabled ? local.id : ""
  description = "ambiguous local id"
}

output "name" {
  value       = local.enabled ? local.name : ""
  description = "Standardised name"
}

output "tags" {
  value       = local.enabled ? local.tags : {}
  description = "Standardised Tag map"
}

output "tags_as_list_of_maps" {
  value       = local.tags_as_list_of_maps
  description = "Additional tags as a list of maps, useful for different aws resources"
}
