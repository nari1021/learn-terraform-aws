locals {
  resource_prefix = join("-", [
    var.csp,
    var.service_name
  ])
  resource_suffix = join("-", [
    var.owner,
    var.env,
    var.region_code
  ])

  tags = merge(var.tags, {
    Owner  = var.owner
    System = var.service_name
    Env    = var.env
  })
}
