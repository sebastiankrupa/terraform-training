variable "instance_ami" {
  default = "ami-da28dfa3"
}

variable "instance_name" {
  default = "tfworkshop"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "workshop_key_name" {
  default = "workshop_key"
}

variable "workshop_public_key" {}
