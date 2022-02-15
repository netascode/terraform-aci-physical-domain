<!-- BEGIN_TF_DOCS -->
# Physical Domain Example

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example will create resources. Resources can be destroyed with `terraform destroy`.

```hcl
module "aci_physical_domain" {
  source  = "netascode/physical-domain/aci"
  version = ">= 0.1.0"

  name                 = "PHY1"
  vlan_pool            = "VP1"
  vlan_pool_allocation = "dynamic"
}
```
<!-- END_TF_DOCS -->