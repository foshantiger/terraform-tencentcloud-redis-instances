data "tencentcloud_redis_zone_config" "config" {

}

output "zone_config" {
  value = data.tencentcloud_redis_zone_config.config
}