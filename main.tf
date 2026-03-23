provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "lab6-terraform-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_security_group" "web_server" {
  id = "sg-026c58f8f9fdf1f1b"
}

data "aws_instance" "web_server" {
  instance_id = "i-04788a542cf089d97"
}

output "public_ip" {
  value = data.aws_instance.web_server.public_ip
}

output "security_group_name" {
  value = data.aws_security_group.web_server.name
}

output "instance_state" {
  value = data.aws_instance.web_server.instance_state
}