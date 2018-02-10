# https://www.terraform.io/docs/providers/random/index.html
resource "random_id" "random" {
  byte_length = 8
}

# https://www.terraform.io/docs/providers/aws/r/route_table.html
resource "aws_route_table" "route_table" {
  count = "${length(var.aws_availability_zones)}"

  tags {
    Name        = "${lower("${var.route_table_name}-${element(var.aws_availability_zones, count.index)}-${var.environment_name}-${random_id.random.hex}")}"
    Environment = "${lower("${var.environment_name}")}"
  }

  vpc_id = "${var.vpc_id}"
}
