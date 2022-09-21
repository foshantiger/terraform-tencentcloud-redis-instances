locals {

  instances = flatten([
    for instance in var.instances: {
      availability_zone = instance.availability_zone
      mem_size = instance.mem_size
      name = instance.name
      charge_type = instance.charge_type == null || instance.charge_type == "" ? "POSTPAID" : instance.charge_type
      prepaid_period = instance.prepaid_period == null || instance.prepaid_period == 0 ? 1 : instance.prepaid_period
      auto_renew_flag = instance.auto_renew_flag == null  ? 0 : instance.auto_renew_flag
      force_delete = instance.force_delete == null ? false : instance.force_delete
      no_auth = instance.no_auth == null ? false : instance.no_auth
      vpc_id = instance.vpc_id
      subnet_id = instance.subnet_id
      params_template_id = instance.params_template_id == null || instance.params_template_id == "" ? null : instance.params_template_id
      password = instance.password == null || instance.password == "" ? null : instance.password
      port = instance.port == null ? 6379 : instance.port
      project_id = instance.project_id == null ? 0 : instance.project_id
      redis_replicas_num = instance.redis_replicas_num == null ? 1 : instance.redis_replicas_num
      redis_shard_num = instance.redis_shard_num == null ? 1 : instance.redis_shard_num
      replica_zone_ids = instance.replica_zone_ids == null ? [] : instance.replica_zone_ids
      replicas_read_only = instance.replicas_read_only == null ? false : instance.replicas_read_only
      security_groups = instance.security_groups
      tags = instance.tags == null ? {} : instance.tags
      type_id = instance.type_id == null ? data.tencentcloud_redis_zone_config.zone_config.list[0].type_id : instance.type_id
    }
  ])

  instance_map = { for instance in local.instances: format("%s.%s", instance.vpc_id, instance.name) => instance }
  instance_id_map = { for key, instance in module.redis_instances: key => instance.id}

}

data "tencentcloud_redis_zone_config" "zone_config" {
  
}

module "redis_instances" {
  for_each = local.instance_map
  source = "./modules/instance"

  availability_zone = each.value.availability_zone
  mem_size = each.value.mem_size
  name = each.value.name
  charge_type = each.value.charge_type
  prepaid_period = each.value.prepaid_period
  auto_renew_flag = each.value.auto_renew_flag
  no_auth = each.value.no_auth
  vpc_id = each.value.vpc_id
  subnet_id = each.value.subnet_id
  params_template_id = each.value.params_template_id
  password = each.value.password
  port = each.value.port
  project_id = each.value.project_id
  redis_replicas_num = each.value.redis_replicas_num
  redis_shard_num = each.value.redis_shard_num
  replica_zone_ids = each.value.replica_zone_ids
  replicas_read_only = each.value.replicas_read_only
  security_groups = each.value.security_groups
  tags = each.value.tags
  type_id = each.value.type_id
}