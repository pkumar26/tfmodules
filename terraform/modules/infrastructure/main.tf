# Create virtual networks
resource "azurerm_virtual_network" "hubvnet" {
  name                = "${var.vnet1name}"
  location            = "${var.location}"
  resource_group_name = "${var.rgname}"
  address_space       = ["${var.vnet1range}"]

  tags = "${merge(var.tags)}"
}

resource "azurerm_virtual_network" "spoke1" {
  name                = "${var.vnet2name}"
  location            = "${var.location}"
  resource_group_name = "${var.rgname}"
  address_space       = ["${var.vnet2range}"]

  tags = "${merge(var.tags)}"
}

resource "azurerm_virtual_network" "spoke2" {
  name                = "${var.vnet3name}"
  location            = "${var.location}"
  resource_group_name = "${var.rgname}"
  address_space       = ["${var.vnet3range}"]

  tags = "${merge(var.tags)}"
}