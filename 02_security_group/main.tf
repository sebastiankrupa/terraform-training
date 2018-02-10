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
  key_name   = "workshop_key-${random_id.random.hex}"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCxFd2W+6XNdY7EA7oOB7XqBcVbkMSTZ8rySUmuiPvmKGn6k3eM4A/cC99qu8kvPB50SOs37eS851f2KFIVZSkCCWXG8lZheG6pHwhTM4nsRNT3+M6AvesGaiYCKIGUmgjukuZx7ilHPR1PBn1OOFO1T5Cr9QEWs6yiVC/dYjIziqcCYPOJNH9FLZzUhdgmu9ODruOnORPyQTn+7a+kCvxzLzWwHfy853Uq1RKwyadxq7ScYSTSvKPXGGcJaLhHfiRJ6WgzDuUSGo0R/4mloZbsw7L2ge3Mhirojlgz+xVkz5BkxOFqXqL949t+8VQ0hNHUFjnJ7iSPXXowDGObMucf adamdrozdz@ip-192-168-1-216.eu-west-1.compute.internal"
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
resource "aws_instance" "instance" {
  ami           = "ami-da28dfa3"
  instance_type = "t2.micro"
  key_name      = "workshop_key-${random_id.random.hex}"
  vpc_security_group_ids = ["${aws_security_group.open.id}"]

  tags {
    Name = "tfworkshop-${random_id.random.hex}"
  }
}

output "public_ip" {
  value = "${aws_instance.instance.public_ip}"
}
