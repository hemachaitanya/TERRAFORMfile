
provider "aws" {
  region = "us-east-1"

}
resource "aws_vpc" "ecc-vpc" {
  cidr_block = var.vpc-1.cidr_block
  tags = {
    Name = var.vpc-1.name
  }

}
resource "aws_subnet" "ecc" {
  vpc_id     = aws_vpc.ecc-vpc.id
  cidr_block = var.subnet-1.cidr_block
  tags = {
    Name = var.subnet-1.name
  }
}
resource "aws_internet_gateway" "ecc-igw" {
  vpc_id = aws_vpc.ecc-vpc.id
  tags = {
    Name = var.igw.name
  }

}
resource "aws_internet_gateway_attachment" "igw-attach" {
    vpc_id = aws_vpc.ecc-vpc.id
  internet_gateway_id = aws_internet_gateway.ecc-igw.id

}
resource "aws_route_table" "table-1" {
  vpc_id = aws_vpc.ecc-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ecc-igw.id

  }

}
resource "aws_route_table_association" "ec2-assosiation" {
  subnet_id      = aws_subnet.ecc.id
  route_table_id = aws_route_table.table-1.id
}
resource "aws_security_group" "sg" {
  name   = "all-traffic"
  vpc_id = aws_vpc.ecc-vpc.id
  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  
}
data "aws_ami_ids" "ubuntu" {
  owners = ["099720109477"]
  
}
resource "aws_instance" "metricbeat" {
  ami = "ami-007855ac798b5175e"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id = aws_subnet.ecc.id  
}
resource "aws_key_pair" "tf-key" {
  key_name = "newkey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDPcK+7csMP7Cv4rNwPw+SzjJgOFzusbAKCkMT9cQRrZFH3I4lvzjLHJ6oqCdGLr9utMtVkLPi0a69QkJ49ZZ1ZYtWnZYhcQaCGYYJu39mhfaS2HUg/S+R5e0Faq9nuhs409edd9MH/sAW1LFpIA5n5c1MR9B8eeDnH8FbFL7PL3cegh2kI51Oc5BwvHQRUl9bn7OcIgDbViO/vctUJgW5bIXXkICwKmtb5mnLJPz1uHaeHhFAEDHEN47cHHZhtiqtPFF/faPtdnO1M6Xws2doc90l+OwxjpBvJYwsLbxTGPI/D3dVPyjhGW8UElEtIUS5Phz24SzzkivLVobMM+9iKAC4BBpQClttVNtgi82Kiixqk04vQfnZeGbb8D6htwm7uMXdKlnNVqRLimXLknW7MAGhXK7etRW0bWIrbeR6AXxoiedeyUHlgQAVofBLZEEBU3AaoyfVtyNtfzftho1B0cCixRtyV1HjkBrCNyZ1oOZ3HJ6H0O72mbEfKFPTmi3U= dell@DESKTOP-ASAI4ED"

  
}


