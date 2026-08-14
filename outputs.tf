output "iothub_dps_id" {
  description = "Map of id values across all iothub_dps, keyed the same as var.iothub_dps"
  value       = { for k, v in azurerm_iothub_dps.iothub_dps : k => v.id if v.id != null && length(v.id) > 0 }
}
output "iothub_dps_allocation_policy" {
  description = "Map of allocation_policy values across all iothub_dps, keyed the same as var.iothub_dps"
  value       = { for k, v in azurerm_iothub_dps.iothub_dps : k => v.allocation_policy if v.allocation_policy != null && length(v.allocation_policy) > 0 }
}
output "iothub_dps_data_residency_enabled" {
  description = "Map of data_residency_enabled values across all iothub_dps, keyed the same as var.iothub_dps"
  value       = { for k, v in azurerm_iothub_dps.iothub_dps : k => v.data_residency_enabled if v.data_residency_enabled != null }
}
output "iothub_dps_device_provisioning_host_name" {
  description = "Map of device_provisioning_host_name values across all iothub_dps, keyed the same as var.iothub_dps"
  value       = { for k, v in azurerm_iothub_dps.iothub_dps : k => v.device_provisioning_host_name if v.device_provisioning_host_name != null && length(v.device_provisioning_host_name) > 0 }
}
output "iothub_dps_id_scope" {
  description = "Map of id_scope values across all iothub_dps, keyed the same as var.iothub_dps"
  value       = { for k, v in azurerm_iothub_dps.iothub_dps : k => v.id_scope if v.id_scope != null && length(v.id_scope) > 0 }
}
output "iothub_dps_ip_filter_rule" {
  description = "Map of ip_filter_rule values across all iothub_dps, keyed the same as var.iothub_dps"
  value       = { for k, v in azurerm_iothub_dps.iothub_dps : k => v.ip_filter_rule if v.ip_filter_rule != null && length(v.ip_filter_rule) > 0 }
}
output "iothub_dps_linked_hub" {
  description = "Map of linked_hub values across all iothub_dps, keyed the same as var.iothub_dps"
  value       = { for k, v in azurerm_iothub_dps.iothub_dps : k => v.linked_hub if v.linked_hub != null && length(v.linked_hub) > 0 }
  sensitive   = true
}
output "iothub_dps_location" {
  description = "Map of location values across all iothub_dps, keyed the same as var.iothub_dps"
  value       = { for k, v in azurerm_iothub_dps.iothub_dps : k => v.location if v.location != null && length(v.location) > 0 }
}
output "iothub_dps_name" {
  description = "Map of name values across all iothub_dps, keyed the same as var.iothub_dps"
  value       = { for k, v in azurerm_iothub_dps.iothub_dps : k => v.name if v.name != null && length(v.name) > 0 }
}
output "iothub_dps_public_network_access_enabled" {
  description = "Map of public_network_access_enabled values across all iothub_dps, keyed the same as var.iothub_dps"
  value       = { for k, v in azurerm_iothub_dps.iothub_dps : k => v.public_network_access_enabled if v.public_network_access_enabled != null }
}
output "iothub_dps_resource_group_name" {
  description = "Map of resource_group_name values across all iothub_dps, keyed the same as var.iothub_dps"
  value       = { for k, v in azurerm_iothub_dps.iothub_dps : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "iothub_dps_service_operations_host_name" {
  description = "Map of service_operations_host_name values across all iothub_dps, keyed the same as var.iothub_dps"
  value       = { for k, v in azurerm_iothub_dps.iothub_dps : k => v.service_operations_host_name if v.service_operations_host_name != null && length(v.service_operations_host_name) > 0 }
}
output "iothub_dps_sku" {
  description = "Map of sku values across all iothub_dps, keyed the same as var.iothub_dps"
  value       = { for k, v in azurerm_iothub_dps.iothub_dps : k => one(v.sku) if v.sku != null && length(v.sku) > 0 }
}
output "iothub_dps_tags" {
  description = "Map of tags values across all iothub_dps, keyed the same as var.iothub_dps"
  value       = { for k, v in azurerm_iothub_dps.iothub_dps : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

