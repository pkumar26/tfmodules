# Create subnets
resource "azurerm_subnet" "gtwsubnet" {
  name                = "${var.gtwsubnetname}"
  virtual_network_name = "${azurerm_virtual_network.hubvnet.name}"
  resource_group_name = "${var.rgname}"
  address_prefix      = "${var.gtwsubnetrange}"
}

resource "azurerm_subnet" "subnet1" {
  name                = "${var.subnet1name}"
  virtual_network_name = "${azurerm_virtual_network.hubvnet.name}"
  resource_group_name = "${var.rgname}"
  address_prefix      = "${var.subnet1range}"
}