terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "netascode/aci"
      version = ">=0.2.0"
    }
  }
}

module "main" {
  source = "../.."

  name      = "PHY1"
  vlan_pool = "VP1"
}

data "aci_rest" "physDomP" {
  dn = "uni/phys-${module.main.name}"

  depends_on = [module.main]
}

resource "test_assertions" "physDomP" {
  component = "physDomP"

  equal "name" {
    description = "name"
    got         = data.aci_rest.physDomP.content.name
    want        = module.main.name
  }
}

data "aci_rest" "infraRsVlanNs" {
  dn = "${data.aci_rest.physDomP.id}/rsvlanNs"
}

resource "test_assertions" "infraRsVlanNs" {
  component = "infraRsVlanNs"

  equal "tDn" {
    description = "tDn"
    got         = data.aci_rest.infraRsVlanNs.content.tDn
    want        = "uni/infra/vlanns-[VP1]-static"
  }
}
