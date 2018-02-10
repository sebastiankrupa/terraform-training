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

# https://www.terraform.io/docs/providers/aws/r/security_group.html
resource "aws_security_group" "open" {
  name        = "allow_all-${random_id.random.hex}"
  description = "Allow all ingress/egress traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags {
    Name = "tfworkshop-${random_id.random.hex}"
  }
}

# https://www.terraform.io/docs/providers/aws/r/instance.html
# https://www.terraform.io/docs/provisioners/connection.html
resource "aws_instance" "instance" {
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.workshop_key_name}-${random_id.random.hex}"
  vpc_security_group_ids = ["${aws_security_group.open.id}"]

  provisioner "remote-exec" {

    connection {
      private_key = "${file("~/.ssh/tfworkshop")}"
      type     = "ssh"
      user     = "ubuntu"
    }

    inline = [
      "uname -a",
    ]
  }

  tags {
    Name = "${var.instance_name}-${random_id.random.hex}"
  }
}
