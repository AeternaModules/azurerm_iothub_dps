output "iothub_dpses_id" {
  description = "Map of id values across all iothub_dpses, keyed the same as var.iothub_dpses"
  value       = { for k, v in azurerm_iothub_dps.iothub_dpses : k => v.id }
}
output "iothub_dpses_allocation_policy" {
  description = "Map of allocation_policy values across all iothub_dpses, keyed the same as var.iothub_dpses"
  value       = { for k, v in azurerm_iothub_dps.iothub_dpses : k => v.allocation_policy }
}
output "iothub_dpses_data_residency_enabled" {
  description = "Map of data_residency_enabled values across all iothub_dpses, keyed the same as var.iothub_dpses"
  value       = { for k, v in azurerm_iothub_dps.iothub_dpses : k => v.data_residency_enabled }
}
output "iothub_dpses_device_provisioning_host_name" {
  description = "Map of device_provisioning_host_name values across all iothub_dpses, keyed the same as var.iothub_dpses"
  value       = { for k, v in azurerm_iothub_dps.iothub_dpses : k => v.device_provisioning_host_name }
}
output "iothub_dpses_id_scope" {
  description = "Map of id_scope values across all iothub_dpses, keyed the same as var.iothub_dpses"
  value       = { for k, v in azurerm_iothub_dps.iothub_dpses : k => v.id_scope }
}
output "iothub_dpses_ip_filter_rule" {
  description = "Map of ip_filter_rule values across all iothub_dpses, keyed the same as var.iothub_dpses"
  value       = { for k, v in azurerm_iothub_dps.iothub_dpses : k => v.ip_filter_rule }
}
output "iothub_dpses_linked_hub" {
  description = "Map of linked_hub values across all iothub_dpses, keyed the same as var.iothub_dpses"
  value       = { for k, v in azurerm_iothub_dps.iothub_dpses : k => v.linked_hub }
  sensitive   = true
}
output "iothub_dpses_location" {
  description = "Map of location values across all iothub_dpses, keyed the same as var.iothub_dpses"
  value       = { for k, v in azurerm_iothub_dps.iothub_dpses : k => v.location }
}
output "iothub_dpses_name" {
  description = "Map of name values across all iothub_dpses, keyed the same as var.iothub_dpses"
  value       = { for k, v in azurerm_iothub_dps.iothub_dpses : k => v.name }
}
output "iothub_dpses_public_network_access_enabled" {
  description = "Map of public_network_access_enabled values across all iothub_dpses, keyed the same as var.iothub_dpses"
  value       = { for k, v in azurerm_iothub_dps.iothub_dpses : k => v.public_network_access_enabled }
}
output "iothub_dpses_resource_group_name" {
  description = "Map of resource_group_name values across all iothub_dpses, keyed the same as var.iothub_dpses"
  value       = { for k, v in azurerm_iothub_dps.iothub_dpses : k => v.resource_group_name }
}
output "iothub_dpses_service_operations_host_name" {
  description = "Map of service_operations_host_name values across all iothub_dpses, keyed the same as var.iothub_dpses"
  value       = { for k, v in azurerm_iothub_dps.iothub_dpses : k => v.service_operations_host_name }
}
output "iothub_dpses_sku" {
  description = "Map of sku values across all iothub_dpses, keyed the same as var.iothub_dpses"
  value       = { for k, v in azurerm_iothub_dps.iothub_dpses : k => v.sku }
}
output "iothub_dpses_tags" {
  description = "Map of tags values across all iothub_dpses, keyed the same as var.iothub_dpses"
  value       = { for k, v in azurerm_iothub_dps.iothub_dpses : k => v.tags }
}

