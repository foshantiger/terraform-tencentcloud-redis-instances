variable "availability_zone" {
  description = "The available zone ID of an instance to be created"
  type        = string
}

variable "mem_size" {
  description = "The memory volume of an available instance(in MB)"
  type        = number
}

variable "name" {
  description = "Name of the redis instance"
  type        = string
}

variable "charge_type" {
  description = "The charge type of redis instance. Valid values are PREPAID, POSTPAID."
  type        = string
  default     = "POSTPAID"
  validation {
    condition     = contains(["PREPAID", "POSTPAID"], var.charge_type)
    error_message = "Valid charge_type: PREPAID, POSTPAID."
  }
}

variable "prepaid_period" {
  description = "The tenancy (time unit is month) of the prepaid instance."
  type        = number
  default     = 1
}

variable "auto_renew_flag" {
  description = "Auto-renew flag. 0 - default state (manual renewal); 1 - automatic renewal; 2 - explicit no automatic renewal."
  type        = number
  default     = 0
}

variable "force_delete" {
  description = "Indicate whether to delete Redis instance directly or not."
  type        = bool
  default     = false
}

variable "no_auth" {
  description = "Indicates whether the redis instance support no-auth access."
  type        = bool
  default     = false
}

variable "vpc_id" {
  description = "Id of the vpc at which the redis instance locates."
  type        = string
}

variable "subnet_id" {
  description = "Id of the subnet at which the redis instance locates."
  type        = string
}

variable "params_template_id" {
  description = "Specify params template id. If not set, will use default template."
  type        = string
  default     = null
}

variable "password" {
  description = "Password for a Redis user, which should be 8 to 16 characters."
  type        = string
  default     = null
}

variable "port" {
  description = "The port used to access a redis instance. The default value is 6379."
  type        = number
  default     = 6379
}

variable "project_id" {
  description = "The project the instance belongs to, default to 0."
  type        = number
  default     = 0
}

variable "redis_replicas_num" {
  description = "The number of instance copies. This is not required for standalone and master slave versions and must equal to count of replica_zone_ids."
  type        = number
  default     = 1
}

variable "redis_shard_num" {
  description = "The number of instance shard, default is 1."
  type        = number
  default     = 1
}

variable "replica_zone_ids" {
  description = "ID of replica nodes available zone."
  type        = list(number)
}

variable "replicas_read_only" {
  description = "Whether copy read-only is supported."
  type        = bool
  default     = null
}

variable "security_groups" {
  description = "A list of security group IDs to associate with."
  type        = list(string)
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "type_id" {
  description = "Instance type. Available values reference data source tencentcloud_redis_zone_config."
  type        = number
}