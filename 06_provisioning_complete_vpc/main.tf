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