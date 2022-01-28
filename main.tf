resource "aci_rest_managed" "physDomP" {
  dn         = "uni/phys-${var.name}"
  class_name = "physDomP"
  content = {
    name = var.name
  }
}

resource "aci_rest_managed" "infraRsVlanNs" {
  dn         = "${aci_rest_managed.physDomP.dn}/rsvlanNs"
  class_name = "infraRsVlanNs"
  content = {
    tDn = "uni/infra/vlanns-[${var.vlan_pool}]-${var.vlan_pool_allocation}"
  }
}
