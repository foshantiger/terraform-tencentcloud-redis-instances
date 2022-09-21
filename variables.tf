variable "instances" {
  type = list(object({
    availability_zone = string
    mem_size = number
    name = string
    charge_type = optional(string)
    prepaid_period = optional(number)
    auto_renew_flag = optional(number)
    force_delete = optional(bool)
    no_auth = optional(bool)
    vpc_id = string
    subnet_id = string
    params_template_id = optional(string)
    password = optional(string)
    port = optional(number)
    project_id = optional(number)
    redis_replicas_num = optional(number)
    redis_shard_num = optional(number)
    replica_zone_ids = optional(list(number))
    replicas_read_only = optional(bool)
    security_groups = list(string)
    tags = optional(map(string))
    type_id = optional(number)
  }))
  default = []
}
