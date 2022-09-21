
module "redis-instances" {
  source = "../.."
  instances = [
    {
      availability_zone = "ap-guangzhou-7"
      mem_size = "1024"
      type_id = 8
      name = "tigerhhchen-tf-test"
      # charge_type = "POSTPAID"
      # prepaid_period = 1
      # auto_renew_flag = 0
      # force_delete = false
      # no_auth = false
      vpc_id = "vpc-6og1oe1b"
      subnet_id = "subnet-b9bhnzsq"
      # params_template_id = ""
      password = "Change_me"
      # port = 6379
      # project_id = 0
      # redis_replicas_num = 1
      # redis_shard_num = 1
      replica_zone_ids = ["100006"]
      # replicas_read_only = false
      security_groups = ["sg-5b29sk1b"]
      tags = {
        app = "terraform"
      }
    },
  ]
}