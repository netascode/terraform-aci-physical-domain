module "aci_physical_domain" {
  source  = "netascode/physical_domain/aci"
  version = ">= 0.1.0"

  name                 = "PHY1"
  vlan_pool            = "VP1"
  vlan_pool_allocation = "dynamic"
}
