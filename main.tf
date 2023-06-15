terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.16"
        }
        tls = {
            source = "hashicorp/tls"
            version = "~> 4.0.4"
        }
    }
    required_version = ">= 1.2.0"
}

variable "region" {
    type = string
    description = "The region that you want your minecraft server to be on"
    default = "us-east-1"
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_key_pair" "minecraft_key" {
  key_name   = "mc_key"
  public_key = file("${path.module}/mc-key.pub")
}

resource "aws_instance" "minecraft_server" {
  ami = "ami-022e1a32d3f742bd8"
  instance_type = "t2.small"
  vpc_security_group_ids = [aws_security_group.mc_server.id]
  associate_public_ip_address = true
  key_name = aws_key_pair.minecraft_key.key_name
  user_data = file("${path.module}/create_server.sh")
}

resource "aws_security_group" "mc_server" {
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 25565
        to_port = 25565
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

output "instance_ip" {
  value = aws_instance.minecraft_server.public_ip
  description = "Connect your Minecraft Server IP:"
}

