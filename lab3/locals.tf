locals {
  alpha_address_space   = cidrsubnet(var.base_address_space, 2, 0) # the last part is the index and this is gotten by doing 2^(borrowed bits) and then calculating the index
  bravo_address_space   = cidrsubnet(var.base_address_space, 2, 1)
  charlie_address_space = cidrsubnet(var.base_address_space, 2, 2)
  delta_address_space   = cidrsubnet(var.base_address_space, 2, 3)
}