# https://www.terraform.io/docs/backends/types/s3.html
terraform {
  backend "s3" {
    bucket = "tfworkshop-myname-tfstate"
    key = "terraform.tfstate"
    region = "eu-west-1"
  }
}

# https://www.terraform.io/docs/providers/aws/
provider "aws" {
  # access_key = ""
  # secret_key = ""
  region = "eu-west-1"
}

# https://www.terraform.io/docs/providers/random/index.html
resource "random_id" "random" {
  byte_length = 8
}

# https://www.terraform.io/docs/providers/aws/r/key_pair.html
resource "aws_key_pair" "workshop" {
  key_name   = "${var.workshop_key_name}-${random_id.random.hex}"
  public_key = "${var.workshop_public_key}"
}

# https://www.terraform.io/docs/providers/aws/r/instance.html
resource "aws_instance" "instance" {
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.workshop_key_name}-${random_id.random.hex}"

  tags {
    Name = "${var.instance_name}-${random_id.random.hex}"
  }
}
