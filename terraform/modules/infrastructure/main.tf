# Create virtual networks
resource "azurerm_virtual_network" "hubvnet" {
  name                = "${var.vnet1name}"
  location            = "${var.location}"
  resource_group_name = "${var.rgname}"
  address_space       = ["${var.vnet1range}"]

  tags = "${merge(var.tags)}"
}