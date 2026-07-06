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
  validation {
    condition = alltrue([
      for k, v in var.iothub_dpses : (
        v.sku.capacity >= 1 && v.sku.capacity <= 200
      )
    ])
    error_message = "must be between 1 and 200"
  }
  validation {
    condition = alltrue([
      for k, v in var.iothub_dpses : (
        v.linked_hub == null || (length(v.linked_hub.connection_string) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.iothub_dpses : (
        v.linked_hub == null || (length(v.linked_hub.location) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.iothub_dpses : (
        v.linked_hub == null || (v.linked_hub.allocation_weight == null || (v.linked_hub.allocation_weight >= 0 && v.linked_hub.allocation_weight <= 1000))
      )
    ])
    error_message = "must be between 0 and 1000"
  }
  validation {
    condition = alltrue([
      for k, v in var.iothub_dpses : (
        v.ip_filter_rule == null || (length(v.ip_filter_rule.name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_iothub_dps's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from iothubValidate.IoTHubName] !matched
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: sku.name
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: ip_filter_rule.ip_mask
  #   source:    [from validate.CIDR] re != nil && !re.MatchString(cidr)
  # path: ip_filter_rule.action
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: ip_filter_rule.target
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: allocation_policy
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

