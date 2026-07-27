variable "iothub_dps" {
  description = <<EOT
Map of iothub_dps, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku (block):
        - capacity (required)
        - name (required)
Optional:
    - allocation_policy
    - data_residency_enabled
    - public_network_access_enabled
    - tags
    - ip_filter_rule (block):
        - action (required)
        - ip_mask (required)
        - name (required)
        - target (optional)
    - linked_hub (block):
        - allocation_weight (optional)
        - apply_allocation_policy (optional)
        - connection_string (required)
        - location (required)
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    allocation_policy             = optional(string)
    data_residency_enabled        = optional(bool)
    public_network_access_enabled = optional(bool)
    tags                          = optional(map(string))
    sku = object({
      capacity = number
      name     = string
    })
    ip_filter_rule = optional(list(object({
      action  = string
      ip_mask = string
      name    = string
      target  = optional(string)
    })))
    linked_hub = optional(list(object({
      allocation_weight       = optional(number)
      apply_allocation_policy = optional(bool)
      connection_string       = string
      location                = string
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.iothub_dps : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.iothub_dps : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.iothub_dps : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.iothub_dps : (
        v.sku.capacity >= 1 && v.sku.capacity <= 200
      )
    ])
    error_message = "must be between 1 and 200"
  }
  validation {
    condition = alltrue([
      for k, v in var.iothub_dps : (
        v.linked_hub == null || alltrue([for item in v.linked_hub : (length(item.connection_string) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.iothub_dps : (
        v.linked_hub == null || alltrue([for item in v.linked_hub : (length(item.location) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.iothub_dps : (
        v.linked_hub == null || alltrue([for item in v.linked_hub : (item.allocation_weight == null || (item.allocation_weight >= 0 && item.allocation_weight <= 1000))])
      )
    ])
    error_message = "must be between 0 and 1000"
  }
  validation {
    condition = alltrue([
      for k, v in var.iothub_dps : (
        v.ip_filter_rule == null || alltrue([for item in v.ip_filter_rule : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.iothub_dps : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 11 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

