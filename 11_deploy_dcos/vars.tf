variable "instance_ami" {
  default = "ami-da28dfa3"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "workshop_key_name" {
  default = "workshop_key"
}

variable "workshop_public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8vL+aeWwmTVvcPt+uCzA7ydrrPAwy2LJ1v80iTJ1lmzT31h7hAcLf4gAT3sZzwC0qU+jCyllj252F3PJ2D19ol9LX5ObLuVxPbFzOaf0X2DE+GLb7tdIl+oQgcoKXfukZTK+rL79Z0YmfNdKgqURTn4vT1m41HsMsn57SOZ0dQlKIHI3z2fxZ7dZ7ft2pM4FgC4BbVAK3iekf3u4Fi8QdAcOCPd3AfpZstwfKCU5SOoY68HTvG8e/+eGKAhs25FLGZLv5SNJyuNJnZkoA54CWTc3zi+rvA5ZN2ivh1IgRfPKNnAo+5xyjerMJGvBCNUdBc7fYiMF+vwlnAeyk40qt kamsz@Kamils-MBP"
}

variable "dcos_version" {
  default = "1.8.8"
}

variable "private_agents_count" {
  default = 2
}

variable "public_agents_count" {
  default = 1
}

variable "state" {
  default = "install"
}
