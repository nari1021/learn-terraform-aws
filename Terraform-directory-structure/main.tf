locals {
  resource_prefix = join("-", [
    var.service_name,
    var.system
  ])
  resource_suffix = var.env
  tags = merge(var.tags, {
    Owner  = var.owner
    Env    = var.env
    System = var.system
  })
}
