
resource "azurerm_container_registry" "acr001" {
  name                = "containerRegistryachraf"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
}


resource "azurerm_role_assignment" "roleforaks" {
  principal_id                     = azurerm_kubernetes_cluster.cluster.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr001.id
  skip_service_principal_aad_check = true
}