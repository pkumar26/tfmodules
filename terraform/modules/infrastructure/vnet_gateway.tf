# Create virtual network gateway & add P2S connection
resource "azurerm_public_ip" "hubgateway-pip" {
  name                = "${var.vpnpipname}"
  location            = "${var.location}"
  resource_group_name = "${var.rgname}"

  allocation_method = "Dynamic"
}
resource "azurerm_virtual_network_gateway" "hubgateway" {
  name                = "${var.vpnname}"
  location            = "${var.location}"
  resource_group_name = "${var.rgname}"

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "${var.vpnsku}"

  ip_configuration {
    name                          = "hubGatewayConfig"
    public_ip_address_id          = "${azurerm_public_ip.hubgateway-pip.id}"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = "${azurerm_subnet.gtwsubnet.id}"
  }

  vpn_client_configuration {
    address_space = ["${var.vpniprange}"]

    root_certificate {
      name = "P2Srootcert"

      public_cert_data = "${var.rootcertfile}"
    }
  }
}