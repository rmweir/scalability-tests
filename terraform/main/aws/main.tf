terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = local.region
}

resource "aws_instance" "app_server" {
  ami           = local.ami
  instance_type = local.instance_type
  ebs_block_device {
    device_name           = "/dev/sda1"
    volume_size           = 50
    volume_type           = "gp3"
    delete_on_termination = true
  }
  key_name = local.key_name
  tags = {
    Name        = local.instance_name
    DoNotDelete = "true"
    Owner       = local.owner
  }
}