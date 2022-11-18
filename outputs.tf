resource "local_file" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.cluster]
  filename   = "kubeconfig-${var.env_name}"
  content    = azurerm_kubernetes_cluster.cluster.kube_config_raw
}


output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}