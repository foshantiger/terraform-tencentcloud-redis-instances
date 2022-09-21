locals {
  availability_zone = data.tencentcloud_vpc_subnets.subnets.instance_list[0].availability_zone
}


data "tencentcloud_vpc_subnets" "subnets" {
  vpc_id    = var.vpc_id
  subnet_id = var.subnet_id
}

resource "tencentcloud_redis_instance" "this" {
  availability_zone = local.availability_zone
  mem_size = var.mem_size
  type_id = var.type_id
  name = var.name
  charge_type = var.charge_type
  prepaid_period = var.charge_type == "PREPAID" ? var.prepaid_period : null
  auto_renew_flag = var.charge_type == "PREPAID" ? var.auto_renew_flag : null
  no_auth = var.no_auth
  vpc_id = var.vpc_id
  subnet_id = var.subnet_id
  params_template_id = var.params_template_id
  password = var.password
  port = var.port
  project_id = var.project_id
  redis_replicas_num = var.redis_replicas_num
  redis_shard_num =var.redis_shard_num
  replica_zone_ids = var.replica_zone_ids
  replicas_read_only = var.replicas_read_only
  security_groups = var.security_groups
  tags = var.tags
}