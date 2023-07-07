
provider "aws" {
  region = var.region

}
resource "aws_vpc" "one-vpc" {
  cidr_block = var.vpc.cidr_block
  tags = {
    Name = var.vpc.name
  }

}
resource "aws_subnet" "subnet" {
  vpc_id     = var.subnet.vpc_id
  count      = 4
  cidr_block = cidrsubnet("192.168.0.0/16", 8, count.index)
  tags = {
    Name = "subnet${count.index}"
  }

}