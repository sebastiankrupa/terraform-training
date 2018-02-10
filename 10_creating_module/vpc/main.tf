# https://www.terraform.io/docs/providers/random/index.html
resource "random_id" "random" {
  byte_length = 8
}

# https://www.terraform.io/docs/providers/aws/r/vpc.html
resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_subnet_range}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support   = "${var.enable_dns_support}"

  tags {
    Name = "${lower("${var.environment_name}-${random_id.random.hex}")}"
  }
}
