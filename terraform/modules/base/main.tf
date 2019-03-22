variable "project" {}
variable "project_prefix" {}
variable "env_prefix" {}
variable "az_location" {}
variable "region_prefix" {}
variable "tags" {
    default = {}
}

# Create a resource group
resource "azurerm_resource_group" "orchestration" {
  name     = "${var.project_prefix}-${var.project}-${var.env_prefix}-rg"
  location = "${var.az_location}"

  tags = "${merge(var.tags)}"
}

# create a storage account
resource "azurerm_storage_account" "orchestration" {
    name = "${var.region_prefix}${var.project_prefix}${var.project}${var.env_prefix}"
    resource_group_name = "${azurerm_resource_group.orchestration.name}"
    location = "${azurerm_resource_group.orchestration.location}"
    account_replication_type = "LRS"
    account_tier = "Standard"
    depends_on = ["azurerm_resource_group.orchestration"]

    tags = "${merge(var.tags)}"
}

# create a storage container
resource "azurerm_storage_container" "orchestration" {
    name = "tfstates"
    resource_group_name = "${azurerm_resource_group.orchestration.name}"
    storage_account_name = "${azurerm_storage_account.orchestration.name}"
    container_access_type = "private"
}

# Outputs
output "orchestration_rgname" {
  value = "${azurerm_resource_group.orchestration.name}"
}
output "orchestration_rgname_location" {
  value = "${azurerm_resource_group.orchestration.location}"
}
output "orchestration_storagename" {
  value = "${azurerm_storage_account.orchestration.name}"
}
output "orchestration_containername" {
  value = "${azurerm_storage_container.orchestration.name}"
}