provider "azurerm" {

}



resource "azurerm_resource_group" "testrg" {
  name     = "resourceGroupName"
  location = "eastus"
}

resource "azurerm_storage_account" "testomegastoa" {
  name                     = "storageaccountomegayo"
  resource_group_name      = "${azurerm_resource_group.testrg.name}"
  location                 = "westus"
  account_tier             = "Standard"
  access_tier              = "Cool"
  account_replication_type = "GRS"
  account_kind = "BlobStorage"

  tags {
    environment = "staging"
  }
}


############################
# Containers
#######################
resource "azurerm_storage_container" "testomegayo" {
  name                  = "vhds"
  resource_group_name   = "${azurerm_resource_group.testrg.name}"
  storage_account_name  = "${azurerm_storage_account.testomegastoa.name}"
  container_access_type = "Blob"
}
