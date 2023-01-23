locals {
  tags = merge(var.tags, {
    Owner  = var.owner
    System = var.service_name
    Env    = var.env
  })
}
