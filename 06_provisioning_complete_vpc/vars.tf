variable "aws_availability_zones" {
  type = "list"
}
variable "enable_dns_hostnames" {
  default = true
}
variable "enable_dns_support" {
  default = true
}
variable "environment_name" {}
variable "nat_route_table_name" {}
variable "nat_subnet_name" {}
variable "nat_subnet_range" {}
variable "vpc_subnet_range" {}
