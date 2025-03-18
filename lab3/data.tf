data "azurerm_subnet" "bravo" {
  name                 = "snet-bravo"
  virtual_network_name = "vnet-network-dev"
  resource_group_name  = "rg-network-dev"
}

data "azurerm_key_vault" "main" {
  name                = "kv-devops-dev-zonmjj"
  resource_group_name = "rg-devops-dev"
}