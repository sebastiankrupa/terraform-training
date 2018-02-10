# https://www.terraform.io/docs/providers/aws/r/internet_gateway.html
resource "aws_internet_gateway" "igw" {
  tags {
    Name        = "${lower("igw-${var.environment_name}-${random_id.random.hex}")}"
    Environment = "${lower("${var.environment_name}")}"
  }

  vpc_id = "${aws_vpc.vpc.id}"
}
