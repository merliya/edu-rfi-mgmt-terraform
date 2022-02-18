module "required_tags" {
  source = "app.terraform.io/uopx/map-required-tags/aws"

  application_key = var.tag_application_key
  created_by      = var.tag_created_by
  module_key      = ""
  map_migrated    = var.tag_map_migrated
  additional_tags = {}
}

locals {
  ci_cd_tags      = merge(module.required_tags.tags, { ModuleKey = "ci_cd" })
  logging_tags    = merge(module.required_tags.tags, { ModuleKey = "logging" })
}
