# https://www.terraform.io/docs/providers/aws/
provider "aws" {
  # access_key = ""
  # secret_key = ""
  region = "eu-west-1"
}

module "vpc" {
  source = "vpc"

  environment_name = "${var.environment_name}"
  vpc_subnet_range = "${var.vpc_subnet_range}"
}

module "igw" {
  source = "igw"

  environment_name = "${var.environment_name}"
  vpc_id = "${module.vpc.id}"
}

module "nat" {
  source = "nat"

  aws_availability_zones = "${var.aws_availability_zones}"
  environment_name = "${var.environment_name}"
  internet_gateway_id = "${module.igw.id}"
  nat_route_table_name = "${var.nat_route_table_name}"
  nat_subnet_name = "${var.nat_subnet_name}"
  nat_subnet_range = "${var.nat_subnet_range}"
  vpc_id = "${module.vpc.id}"
}
