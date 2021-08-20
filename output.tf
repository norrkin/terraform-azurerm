output "resource_group_id" {
  value = azurerm_resource_group.terraform-azurerm-backend.id
}

output "tags" {
  value = local.tags
}

output "label1" {
  value = {
    name = module.labels.name
  }
}