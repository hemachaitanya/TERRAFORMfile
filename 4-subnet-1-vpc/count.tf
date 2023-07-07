
provider "aws" {
    region = "us-east-1"
  
}
resource "aws_vpc" "one-vpc" {
    cidr_block = "192.168.0.0/16"
    tags = {
      Name = "vpc-one"
    }
  
}
resource "aws_subnet" "subnet" {
    vpc_id = aws_vpc.one-vpc.id
    count = 4
    cidr_block = cidrsubnet("192.168.0.0/16",8,count.index)
    tags = {
        Name = "subnet${(count.index)}"
    }
  
}