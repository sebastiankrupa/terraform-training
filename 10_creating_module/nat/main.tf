# https://www.terraform.io/docs/providers/random/index.html
resource "random_id" "random" {
  byte_length = 8
}

module "subnet" {
  source = "../subnet"

  aws_availability_zones = "${var.aws_availability_zones}"
  environment_name = "${var.environment_name}"
  subnet_name = "${var.nat_subnet_name}"
  subnet_range = "${var.nat_subnet_range}"
  vpc_id = "${var.vpc_id}"
}

module "route_table" {
  source = "../route_table"

  aws_availability_zones = "${var.aws_availability_zones}"
  environment_name = "${var.environment_name}"
  route_table_name = "${var.nat_route_table_name}"
  vpc_id = "${var.vpc_id}"
}

# https://www.terraform.io/docs/providers/aws/r/route.html
resource "aws_route" "default" {
  count                  = "${length(var.aws_availability_zones)}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${var.internet_gateway_id}"
  route_table_id         = "${element(module.route_table.ids, count.index)}"
}

# https://www.terraform.io/docs/providers/aws/r/route_table_association.html
resource "aws_route_table_association" "route_table_association" {
  count          = "${length(var.aws_availability_zones)}"
  route_table_id = "${element(module.route_table.ids, count.index)}"
  subnet_id      = "${element(module.subnet.ids, count.index)}"
}

# https://www.terraform.io/docs/providers/aws/r/eip.html
resource "aws_eip" "eip" {
  count          = "${length(var.aws_availability_zones)}"
}

# https://www.terraform.io/docs/providers/aws/r/nat_gateway.html
resource "aws_nat_gateway" "nat" {
 allocation_id = "${element(aws_eip.eip.*.id, count.index)}"
 count         = "${length(var.aws_availability_zones)}"
 subnet_id     = "${element(module.subnet.ids, count.index)}"
}
