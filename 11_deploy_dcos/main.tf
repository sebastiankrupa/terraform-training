# https://www.terraform.io/docs/providers/aws/
provider "aws" {
  # access_key = ""
  # secret_key = ""
  region = "eu-west-1"
}

# https://www.terraform.io/docs/providers/aws/r/key_pair.html
resource "aws_key_pair" "workshop" {
  key_name   = "${var.workshop_key_name}"
  public_key = "${var.workshop_public_key}"
}

module "dcos" {
  source = "terraform-dcos"

  aws_region = "eu-west-1"
  dcos_version = "${var.dcos_version}"
  key_name = "${aws_key_pair.workshop.key_name}"
  num_of_private_agents = "${var.private_agents_count}"
  num_of_public_agents = "${var.public_agents_count}"
  os = "coreos_1235.9.0"
  state = "${var.state}"
}
