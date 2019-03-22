# Setup remote state data source
terraform {
  backend "azurerm" {
    storage_account_name = ""
    container_name       = ""
    key                  = "terraform.tfstate"
  }
}