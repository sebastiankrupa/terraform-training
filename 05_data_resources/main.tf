# https://www.terraform.io/docs/providers/aws/
provider "aws" {
  # access_key = ""
  # secret_key = ""
  region = "eu-west-1"
}

# https://www.terraform.io/docs/providers/aws/d/caller_identity.html
data "aws_caller_identity" "current" {}

# https://www.terraform.io/docs/providers/aws/d/region.html
data "aws_region" "current" {
  current = true
}

# https://www.terraform.io/docs/providers/aws/d/vpc.html
data "aws_vpc" "default" {
  default = true
}

output "caller_arn" {
  value = "${data.aws_caller_identity.current.arn}"
}

output "caller_user" {
  value = "${data.aws_caller_identity.current.user_id}"
}

output "aws_region" {
  value = "${data.aws_region.current.name}"
}

output "aws_region_endpoint" {
  value = "${data.aws_region.current.endpoint}"
}

output "vpc_id" {
  value = "${data.aws_vpc.default.id}"
}

output "vpc_cidr_block" {
  value = "${data.aws_vpc.default.cidr_block}"
}

output "vpc_state" {
  value = "${data.aws_vpc.default.state}"
}
