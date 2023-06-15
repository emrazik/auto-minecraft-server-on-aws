# Auto Deployed Minecraft Server with Terraform and AWS

## What is this and how does it work?
This is a way to auto deploy and confiugre a minecraft server on AWS. It uses Terraform to set up the infrastructure and a bash script to perform the necessary configuration

## Requirements
1. Clone this repo
2. install [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
3. install the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
4. Store your [aws credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html). These will likely be stores in ~/.aws/credentials on your computer


## Set up the server
1. Run `terraform init` in this directory to initialize Terraform with its configuration files
2. Run `terraform apply` to start the server. This will make Terraform make the necessary changes to your AWS infrastructure.
3. Wait about 5 minutes for the server to fully initialize and create the world.
 
## Connect to the server
1. Open your minecraft client.
2. Click on installations.
3. Click on new installation. You will need to download version 1.17.1.
4. Click play next to the new installation.
5. Click on multiplayer and then input the ip of the instance that is displayed in your terminal


### This script inspired by these resources







https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-build
https://linuxhint.com/create-security-groups-aws-terraform/
https://registry.terraform.io/providers/hashicorp/aws/2.36.0/docs/resources/instance
https://fabianlee.org/2021/05/28/terraform-invoking-a-startup-script-for-an-ec2-aws_instance/