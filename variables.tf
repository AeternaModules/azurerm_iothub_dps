variable "iothub_dpses" {
  description = <<EOT
Map of iothub_dpses, attributes below
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
    allocation_policy             = optional(string) # Default: "Hashed"
    data_residency_enabled        = optional(bool)   # Default: false
    public_network_access_enabled = optional(bool)   # Default: true
    tags                          = optional(map(string))
    sku = object({
      capacity = number
      name     = string
    })
    ip_filter_rule = optional(object({
      action  = string
      ip_mask = string
      name    = string
      target  = optional(string)
    }))
    linked_hub = optional(object({
      allocation_weight       = optional(number) # Default: 1
      apply_allocation_policy = optional(bool)   # Default: true
      connection_string       = string
      location                = string
    }))
  }))
}

