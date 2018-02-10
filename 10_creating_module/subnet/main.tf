# https://www.terraform.io/docs/providers/random/index.html
resource "random_id" "random" {
  byte_length = 8
}

# https://www.terraform.io/docs/providers/aws/r/subnet.html
resource "aws_subnet" "subnet" {
  availability_zone = "${element(var.aws_availability_zones, count.index)}"
  cidr_block        = "${cidrsubnet(var.subnet_range, length(var.aws_availability_zones)-1, count.index)}"
  count             = "${length(var.aws_availability_zones)}"

  tags {
    Name        = "${lower("${var.subnet_name}-${element(var.aws_availability_zones, count.index)}-${var.environment_name}-${random_id.random.hex}")}"
    Environment = "${lower("${var.environment_name}")}"
  }

  vpc_id = "${var.vpc_id}"
}
