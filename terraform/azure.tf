##################################################################################
# RESOURCES
##################################################################################

# BASE #
module "base" {
  source = ".//modules//base"
  project = "${var.project}"
  project_prefix = "${var.project_prefix}"
  env_prefix = "${var.env_prefix}"
  az_location = "${var.az_location}"
  region_prefix = "${var.region_prefix}"
  tags = "${var.tags}"
}

# NETWORK INFRASTRUCTURE #
module "infrastructure" {
  source = ".//modules//infrastructure"
  location = "${module.base.orchestration_rgname_location}"
  rgname = "${module.base.orchestration_rgname}"
  vnet1name = "hubvnet"
  vnet1range = "10.0.0.0/16"
  gtwsubnetname = "GatewaySubnet"
  gtwsubnetrange = "10.0.1.0/24"
  subnet1name = "subnet1"
  subnet1range = "10.0.2.0/24"
  vpnpipname = "hubgatewaypip"
  vpnname = "hubgateway"
  vpniprange = "192.168.200.0/24"
  tags = "${var.tags}"
}