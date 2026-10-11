variable "digital_twins_instance_lookup" {
  description = <<EOT
Map of digital_twins_instance_lookup, attributes below
Required:
    - name
    - resource_group_name
EOT

  type = map(object({
    name                = string
    resource_group_name = string
  }))
  validation {
    condition = alltrue([
      for k, v in var.digital_twins_instance_lookup : (
        length(v.name) >= 3
      )
    ])
    error_message = "[from validate.DigitalTwinsInstanceName: invalid when len(value) < 3]"
  }
  validation {
    condition = alltrue([
      for k, v in var.digital_twins_instance_lookup : (
        length(v.name) <= 63
      )
    ])
    error_message = "[from validate.DigitalTwinsInstanceName: invalid when len(value) > 63]"
  }
  validation {
    condition = alltrue([
      for k, v in var.digital_twins_instance_lookup : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.digital_twins_instance_lookup : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.digital_twins_instance_lookup : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

