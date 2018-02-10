# https://www.terraform.io/docs/providers/aws/r/subnet.html
resource "aws_subnet" "subnet" {
  availability_zone = "${element(var.aws_availability_zones, count.index)}"
  cidr_block        = "${cidrsubnet(var.nat_subnet_range, length(var.aws_availability_zones)-1, count.index)}"
  count             = "${length(var.aws_availability_zones)}"

  tags {
    Name        = "${lower("${var.nat_subnet_name}-${element(var.aws_availability_zones, count.index)}-${var.environment_name}-${random_id.random.hex}")}"
    Environment = "${lower("${var.environment_name}")}"
  }

  vpc_id = "${aws_vpc.vpc.id}"
}

# https://www.terraform.io/docs/providers/aws/r/route_table.html
resource "aws_route_table" "route_table" {
  count = "${length(var.aws_availability_zones)}"

  tags {
    Name        = "${lower("${var.nat_route_table_name}-${element(var.aws_availability_zones, count.index)}-${var.environment_name}-${random_id.random.hex}")}"
    Environment = "${lower("${var.environment_name}")}"
  }

  vpc_id = "${aws_vpc.vpc.id}"
}

# https://www.terraform.io/docs/providers/aws/r/route.html
resource "aws_route" "default" {
  count                  = "${length(var.aws_availability_zones)}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.igw.id}"
  route_table_id         = "${element(aws_route_table.route_table.*.id, count.index)}"
}

# https://www.terraform.io/docs/providers/aws/r/route_table_association.html
resource "aws_route_table_association" "route_table_association" {
  count          = "${length(var.aws_availability_zones)}"
  route_table_id = "${element(aws_route_table.route_table.*.id, count.index)}"
  subnet_id      = "${element(aws_subnet.subnet.*.id, count.index)}"
}

# https://www.terraform.io/docs/providers/aws/r/eip.html
resource "aws_eip" "eip" {
  count          = "${length(var.aws_availability_zones)}"
}

# https://www.terraform.io/docs/providers/aws/r/nat_gateway.html
resource "aws_nat_gateway" "nat" {
 allocation_id = "${element(aws_eip.eip.*.id, count.index)}"
 count         = "${length(var.aws_availability_zones)}"
 subnet_id     = "${element(aws_subnet.subnet.*.id, count.index)}"
}
