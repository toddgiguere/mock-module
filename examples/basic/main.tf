##############################################################################
# Resource Group
# (if var.resource_group is null, create a new RG using var.prefix)
##############################################################################
/*
resource "ibm_resource_group" "resource_group" {
  count    = var.resource_group != null ? 0 : 1
  name     = "${var.prefix}-rg"
  quota_id = null
}

data "ibm_resource_group" "existing_resource_group" {
  count = var.resource_group != null ? 1 : 0
  name  = var.resource_group
}
*/
locals {
  # resource_group_id = var.resource_group != null ? data.ibm_resource_group.existing_resource_group[0].id : ibm_resource_group.resource_group[0].id
  resource_group_id = "292170bc79c94f5e9019e46fb48f245a"
}

#############################################################################
# Call root level module to create SSH key
#############################################################################

# module "mock_module" {
#   source            = "../.."
#   name              = var.prefix
#   resource_group_id = local.resource_group_id
#   tags              = var.resource_tags
# }

locals {
  new_string = "${var.new_for_test} yah"
}

resource "ibm_container_api_key_reset" "reset" {
  region            = var.region
  resource_group_id = local.resource_group_id
  reset_api_key     = 1
}

