data "azurerm_digital_twins_instance" "digital_twins_instance_lookup" {
  for_each = var.digital_twins_instance_lookup

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}

